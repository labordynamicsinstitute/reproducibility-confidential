# Secretos en el código

## ¿Qué son los secretos?

- Claves API
- Credenciales de inicio de sesión para acceso a datos
- Rutas de archivos (¡FSRDC!)
- Nombres de variables (¡IRS!)

## Práctica estándar

Almacenar secretos en variables de entorno o archivos que no se publican.

## Algunos servicios se toman esto en serio

![Escaneo de secretos de Github](/images/github-secret-scanning.png)

## Dónde almacenar secretos

- **variables de entorno**
- archivos "[dot-env](https://pypi.org/project/python-dotenv/)" (Python), archivos "Renviron" (R)
- o algún otro archivo claramente identificado en el proyecto o directorio de inicio

## Variables de entorno

Escritas interactivamente (aquí para Linux y Mac)

```{.bash}
MYSECRET="dfad89ald"
CONFDATALOC="/path/to/irs/files"
```

(esto **no** se recomienda)

## Almacenar estos en archivos

La misma sintaxis se usa para el contenido de archivos "dot-env" o "Renviron", y de hecho archivos de inicio de `bash` o `zsh` (`.bash_profile`, `.zshrc`)

## Usar en R

Editar archivos `.Renviron` (¡nota el punto!):

```{.r code-line-numbers="2,4"}
# Editar Renviron global (personal)
usethis::edit_r_environ()
# También puedes considerar crear configuraciones específicas del proyecto:
usethis::edit_r_environ(scope = "project")
```

Usar las variables definidas en `.Renviron`:

```{.r}
mysecret <- Sys.getenv('MYSECRET')
```

## Usar en Python

Cargar variables de entorno regulares:

```{.python code-line-numbers="2"}
import os
mysecret = os.getenv("MYSECRET")  # cargará variables de entorno
```

Cargar con `dotenv`

```{.python code-line-numbers="2-3"}
from dotenv import load_dotenv
load_dotenv()  # tomar variables de entorno del proyecto .env.
mysecret = os.getenv("MYSECRET")  # cargará variables de entorno
```

## Usar en Stata

Sí, esto también funciona en Stata

```{.stata code-line-numbers="2"}
// cargar desde entorno
global mysecret : env MYSECRET
display "$mysecret"  // en realidad no hagas esto en el código
```

y a través de (¿qué más?) un paquete escrito por usuario para cargar desde archivos:

```{.stata code-line-numbers="1-3"}
net install doenv, from(https://github.com/vikjam/doenv/raw/master/) 
doenv using ".env"
global mysecret "`r(MYSECRET)'"
display "$mysecret"
```


## Solución más simple

```{.stata code-line-numbers="5,8,10"}
//============ parámetros no confidenciales =========
include "config.do"

//============ parámetros confidenciales =============
capture confirm file "$code/confidential/confparms.do"
if _rc == 0 {
    // el archivo existe
    include "$code/confidential/confparms.do"
} else {
    di in red "No se encontraron parámetros confidenciales"
}
//============ fin parámetros confidenciales =========

```

# ¿Código confidencial? 

## ¿Qué es código confidencial, dices? {transition="fade"}

- En Estados Unidos, algunas **variables en bases de datos del IRS** se consideran super-ultra-secretas. Así que no puedes nombrar esa-variable-que-llenaste-en-tu-Formulario-1040 en tu código de análisis de los mismos datos. (A menudo se les refiere en jerga como "variables Título 26"). 

## ¿Qué es código confidencial, dices? {transition="fade"}

- Tu código contiene la **semilla aleatoria que usaste para anonimizar** los identificadores sensibles. Esto podría permitir hacer ingeniería inversa de la anonimización, y no es buena idea publicar.

## ¿Qué es código confidencial, dices? {transition="fade"}

- Usaste una **tabla de búsqueda codificada directamente** en tu código Stata para anonimizar los identificadores sensibles (`replace anoncounty=1 if county="Tompkins, NY"`). 

Una **muy mala idea**, pero sí, probablemente quieres ocultar eso.

## ¿Qué es código confidencial, dices? {transition="fade"}

- Tu especialista en TI u oficial de divulgación piensa que publicar la **ruta exacta** a tu copia de los datos confidenciales del Censo 2010, ej., "/data/census/2010", es un riesgo de seguridad y se niega a dejar pasar ese código.

## ¿Qué es código confidencial, dices? {transition="fade"}

- Has cumplido con las reglas de divulgación, pero por alguna razón, el tamaño mínimo preciso de celda es un parámetro confidencial.

## ¿Qué es código confidencial, dices? {transition="fade"}

Así que ya sea razonable o no, **esto es un problema**. ¿Cómo haces eso, sin arruinar el código, o gastar horas redactando tu código?

## Ejemplo {.smaller transition="fade"}

- Esto servirá como ejemplo. Nada de esto es específico a Stata, y las soluciones para R, Python, Julia, Matlab, etc. son todas bastante similares. 
- Asume que las variables `q2f` y `q3e` se consideran confidenciales por alguna regla, y que el tamaño mínimo de celda `10` también es confidencial.

```{.stata}
set seed 12345
use q2f q3e county using "/data/economic/cmf2012/extract.dta", clear
gen logprofit = log(q2f)
by county: collapse (count)  n=q3e (mean) logprofit
drop if n<10
graph twoway n logprofit
```

## Ejemplo {.smaller transition="fade"}

Solo una línea que no contiene información "confidencial".

```{.stata code-line-numbers="6"}
set seed 12345
use q2f q3e county using "/data/economic/cmf2012/extract.dta", clear
gen logprofit = log(q2f)
by county: collapse (count)  n=q3e (mean) logprofit
drop if n<10
graph twoway n logprofit
```

## No hagas esto {.smaller transition="fade"}

Un mal ejemplo, porque literalmente hace más trabajo para ti y para futuros replicadores, es redactar manualmente la información confidencial con texto que no es código legítimo:

```{.stata}
set seed NNNNN
use <vars removidas> county using "<ruta removida>", clear
gen logprofit = log(XXXX)
by county: collapse (count)  n=XXXX (mean) logprofit
drop if n<XXXX
graph twoway n logprofit
```

El programa redactado arriba ya no funcionará, y será muy tedioso des-redactar si un replicador posterior obtiene acceso legítimo a los datos confidenciales.

## Mejor {.smaller transition="fade"}

Simplemente reemplazar los datos confidenciales con reemplazo que son marcadores de posición válidos en el lenguaje de programación de tu elección ya es mejor. Aquí está la versión confidencial del archivo:

```{.stata code-line-numbers="2-6"}
//============ parámetros confidenciales =============
global confseed    12345
global confpath    "/data/economic/cmf2012"
global confprofit  q2f
global confemploy  q3e
global confmincell 10
//============ fin parámetros confidenciales =========
set seed $confseed
use $confprofit county using "${confpath}/extract.dta", clear
gen logprofit = log($confprofit)
by county: collapse (count)  n=$confemploy (mean) logprofit
drop if n<$confmincell
graph twoway n logprofit
```

## Mejor {.smaller transition="fade"}

y este podría ser el archivo liberado, parte del paquete de replicación:

```{.stata}
//============ parámetros confidenciales =============
global confseed    XXXX    // un número
global confpath    "XXXX"  // una ruta que te será comunicada
global confprofit  XXX     // Nombre de variable para ganancia T26
global confemploy  XXX     // Nombre de variable para empleo T26
global confmincell XXX     // un número
//============ fin parámetros confidenciales =========
set seed $confseed
use $confprofit county using "${confpath}/extract.dta", clear
gen logprofit = log($confprofit)
by county: collapse (count)  n=$confemploy (mean) logprofit
drop if n<$confmincell
graph twoway n logprofit
```

Aunque el código no funcionará tal como está, es fácil des-redactar, independientemente de cuántas veces referencien los valores confidenciales, ej., `q2f`, en cualquier lugar del código.


## Mejor {.smaller}

- Archivo principal
- Procesamiento condicional 
- Archivo separado para parámetros confidenciales que puede simplemente ser excluido de la solicitud de divulgación

## Mejor {.smaller}

Archivo principal `main.do`:

```{.stata}
//============ parámetros confidenciales =============
capture confirm file "$code/confidential/confparms.do"
if _rc == 0 {
    // el archivo existe
    include "$code/confidential/confparms.do""
} else {
    di in red "No se encontraron parámetros confidenciales"
}
//============ fin parámetros confidenciales =========

//============ parámetros no confidenciales =========
global safepath "$rootdir/releasable"
cap mkdir "$safepath"

//============ fin parámetros ======================
```

## Mejor {.smaller}

Archivo principal `main.do` (continuado)

```{.stata}
// ::::  Procesar solo si los datos confidenciales están presentes 

capture confirm  file "${confpath}/extract.dta"
if _rc == 0 {
   set seed $confseed
   use $confprofit county using "${confpath}/extract.dta", clear
   gen logprofit = log($confprofit)
   by county: collapse (count)  n=$confemploy (mean) logprofit
   drop if n<$confmincell
   save "${safepath}/figure1.dta", replace
} else { di in red "Omitiendo procesamiento de datos confidenciales" }

//============ en este punto, los datos son liberables ======
// ::::  Procesar siempre 

use "${safepath}/figure1.dta", clear
graph twoway n logprofit
graph export "${safepath}/figure1.pdf", replace
```

## Mejor {.smaller}

Archivo auxiliar `$code/confidential/confparms.do"` (no liberado)

```{.stata}
//============ parámetros confidenciales =============
global confseed    12345
global confpath    "/data/economic/cmf2012"
global confprofit  q2f
global confemploy  q3e
global confmincell 10
//============ fin parámetros confidenciales =========
```

## Mejor {.smaller}

Archivo auxiliar `$code/include/confparms_template.do` (esto se libera)

```{.stata}
//============ parámetros confidenciales =============
// Copia este archivo a $code/confidential/confparms.do y edita
global confseed    XXXX    // un número
global confpath    "XXXX"  // una ruta que te será comunicada
global confprofit  XXX     // Nombre de variable para ganancia T26
global confemploy  XXX     // Nombre de variable para empleo T26
global confmincell XXX     // un número
//============ fin parámetros confidenciales =========
```

## Mejor paquete de replicación

Así, el paquete de replicación tendría:

```{.bash}
...
code/main.do
README.md
include/confparms_template.do
releasable/figure1.dta
releasable/figure1.pdf
```

# Evitando datos confidenciales en tu código

## El problema

A menudo vemos código que "arregla" problemas en los datos codificando directamente un mapeo:

```{.r}
# ... 1000 líneas de código arriba...
# Mala práctica
data$name[data$name == "Joe Biden"] <- "Joseph Robinette Biden Jr."
data$county[data$county == "Tompins, NY"] <- "Tompkins County, NY"
# ... 500 líneas de código abajo ...
```

## ¿Por qué es esto un problema?

La información en las columnas `name` o `county` podría ser confidencial.

¡Al codificar esta información como parte de tus programas, has hecho el **código** confidencial!

- Ahora podrías tener que redactar el código antes de liberarlo

## Una solución

Como antes, podrías mover este código a un archivo separado:
    
```{.r} 
# ... 1000 líneas de código arriba...
# Mejor práctica
source("confidential/mappings.R")
# ... 500 líneas de código abajo ...
```

## Mejor solución

Si te das cuenta de que el mapeo es en realidad **datos**, entonces tratarlo como cualquier otro dato (mucho del cual también podría ser confidencial)
es tanto 

- *más robusto* y 
- *más manejable* 

mientras es *seguro*.

## Mejor solución

```{.r}

if (!file.exists("data/confidential/names_mapping.csv")) {
    names_confidential %>% 
        left_join(read_csv("data/confidential/names_mapping.csv"), by = "name") %>%
        # reemplazar name con name_alt si este último no es NA
        mutate(name = if_else(!is.na(name_alt), name_alt, name)) %>%
        # eliminar la columna name_alt
        select(-name_alt) -> names_clean
}

```

## Nota

- ¡Todavía podrías querer des-identificar los datos antes de liberarlos!
- El código, sin embargo, ahora está **libre de información confidencial**.

## Ejemplo de tutorial

- Ve [código R de muestra en este repositorio de Github](https://github.com/labordynamicsinstitute/reproducibility-confidential/tree/main/examples/confidential-merge) para un ejemplo donde tratamos los nombres de presidentes como datos confidenciales.
