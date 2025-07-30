# Entornos en Stata

## TL;DR

- Crear entornos virtuales en Stata es factible
- Hacerlo estabiliza el código y lo hace más transportable

## Rutas de búsqueda en Stata {.smaller}

En Stata, típicamente no hablamos de entornos, pero la misma estructura básica aplica: Stata busca a lo largo de un orden establecido para sus comandos. 

## Rutas de búsqueda en Stata {.smaller}

Algunos comandos están incorporados en el ejecutable (el software que se abre cuando haces clic en el icono de Stata), pero la mayoría de otros comandos internos, y todos los comandos externos, se encuentran en una ruta de búsqueda. 


## Los directorios `sysdir` {.smaller}

:::: {.columns}

::: {.column width=40%}
El conjunto predeterminado de directorios que se pueden buscar, desde un Stata recién instalado, se puede consultar con el comando `sysdir`, y se verá algo así:

```stata
sysdir
```
:::

::: {.column width=60%}

```{.stata}
   STATA:  C:\Program Files\Stata18\
    BASE:  C:\Program Files\Stata18\ado\base\
    SITE:  C:\Program Files\Stata18\ado\site\
    PLUS:  C:\Users\lv39\ado\plus\
PERSONAL:  C:\Users\lv39\ado\personal\
OLDPLACE:  c:\ado\
```
:::

::::

## El orden de búsqueda `adopath` {.smaller}

:::: {.columns}

::: {.column width=40%}

Las rutas de búsqueda donde Stata busca comandos se consulta por `adopath`, y se ve similar, pero ahora tiene un orden asignado a cada entrada:

```stata
adopath
```

:::

::: {.column width=60%}

```{.stata}
  [1]  (BASE)      "C:\Program Files\Stata18\ado\base/"
  [2]  (SITE)      "C:\Program Files\Stata18\ado\site/"
  [3]              "."
  [4]  (PERSONAL)  "C:\Users\lv39\ado\personal/"
  [5]  (PLUS)      "C:\Users\lv39\ado\plus/"
  [6]  (OLDPLACE)  "c:\ado/"
```

:::

::::

## La ruta en funcionamiento {.smaller}

:::: {.columns}

::: {.column width=40%}


Para buscar un comando, Stata buscará en el primer directorio, luego en el segundo, y así sucesivamente, hasta que lo encuentre. Si no lo encuentra, devolverá un error. 

```stata
which reghdfe
```
:::

::: {.column width=60%}

```
command reghdfe not found as either built-in or ado-file
r(111);
```

:::

::::

## ¿Dónde se instalan los paquetes?

[^net-ref]: [Referencia de `net install`](https://www.stata.com/manuals/rnet.pdf). Estrictamente hablando, la ubicación donde se instalan los paquetes ado se puede cambiar a través del comando `net set ado`, pero esto rara vez se hace en la práctica, y no lo haremos aquí. 

:::: {.columns}

::: {.column width=40%}

Cuando instalamos un paquete (`net install`, `ssc install`)[^net-ref], solo una de las rutas (`sysdir`) es relevante: `PLUS`. 

:::

::: {.column width=60%}

```{.stata code-line-numbers="5"}
  [1]  (BASE)      "C:\Program Files\Stata18\ado\base/"
  [2]  (SITE)      "C:\Program Files\Stata18\ado\site/"
  [3]              "."
  [4]  (PERSONAL)  "C:\Users\lv39\ado\personal/"
  [5]  (PLUS)      "C:\Users\lv39\ado\plus/"
  [6]  (OLDPLACE)  "c:\ado/"
```

:::

::::

## Instalando paquetes {.smaller}

:::: {.columns}

::: {.column width=40%}

```stata
ssc install reghdfe
which reghdfe
```

:::

::: {.column width=60%}

```{.stata code-line-numbers="3|7"} 
. ssc install reghdfe
checking reghdfe consistency and verifying not already installed...
installing into C:\Users\lv39\ado\plus\...
installation complete.

. which reghdfe
C:\Users\lv39\ado\plus\r\reghdfe.ado
*! version 6.12.3 08aug2023
```
:::

::::

## Usando entornos en Stata {auto-animate=true}

:::: {.columns}

::: {.column width=40%}

Pero el directorio `(PLUS)` puede ser manipulado

:::

::: {.column width=60%}


```{.stata code-line-numbers="4|13-14"}
* Establecer el directorio raíz
global rootdir : pwd
* Definir una ubicación donde mantendremos todos los paquetes en ESTE proyecto (el "entorno")
global adodir "$rootdir/ado"
* asegurarse de que exista, si no crearlo.
cap mkdir "$adodir"
* Ahora simplifiquemos el adopath
* - eliminar las rutas OLDPLACE y PERSONAL
* - ¡NUNCA ELIMINAR LAS RUTAS DEL SISTEMA - cosas malas pasarán!
adopath - OLDPLACE
adopath - PERSONAL
* modificar la ruta PLUS para que apunte a nuestra nueva ubicación, y moverla hacia arriba en el orden
sysdir set PLUS "$adodir"
adopath ++ PLUS
* verificar la ruta
adopath
```

:::

::::

## Usando entornos en Stata {.smaller auto-animate=true transition="none"}

:::: {.columns}


::: {.column width=40%}


```{.stata code-line-numbers="13-14"}
* Establecer el directorio raíz
global rootdir : pwd
* Definir una ubicación donde mantendremos todos los paquetes en ESTE proyecto (el "entorno")
global adodir "$rootdir/ado"
* asegurarse de que exista, si no crearlo.
cap mkdir "$adodir"
* Ahora simplifiquemos el adopath
* - eliminar las rutas OLDPLACE y PERSONAL
* - ¡NUNCA ELIMINAR LAS RUTAS DEL SISTEMA - cosas malas pasarán!
adopath - OLDPLACE
adopath - PERSONAL
* modificar la ruta PLUS para que apunte a nuestra nueva ubicación, y moverla hacia arriba en el orden
sysdir set PLUS "$adodir"
adopath ++ PLUS
* verificar la ruta
adopath
```

:::

::: {.column width=60%}


```{.stata code-line-numbers="2"}
. adopath
  [1]  (PLUS)      "C:\Users\lv39\Documents/PROJECT123/ado/"
  [2]  (BASE)      "C:\Program Files\Stata18\ado\base/"
  [3]  (SITE)      "C:\Program Files\Stata18\ado\site/"
  [4]              "."
```

:::
::::

## Usando entornos en Stata {auto-animate=true}

:::: {.columns}

::: {.column width=40%}

Vamos a verificar nuevamente dónde está el paquete `reghdfe`:

```stata
which reghdfe
```
:::

::: {.column width=60%}

```{.stata code-line-numbers="2"}
. which reghdfe
command reghdfe not found as either built-in or ado-file
r(111);
```

:::

::::

## Usando entornos en Stata {.smaller auto-animate=true transition="none"}

Así que ya no se encuentra. ¿Por qué? Porque hemos eliminado la ubicación anterior (la antigua ruta `PLUS`) de la secuencia de búsqueda. Es como si no existiera.

:::: {.columns}

::: {.column width=50%}

Anteriormente:

```{.stata code-line-numbers="2"} 
. which reghdfe
C:\Users\lv39\ado\plus\r\reghdfe.ado
*! version 6.12.3 08aug2023
```
:::

::: {.column width=50%}


```{.stata code-line-numbers="2|3|4|5"}
. adopath
  [1]  (PLUS)      "C:\Users\lv39\Documents/PROJECT123/ado/"
  [2]  (BASE)      "C:\Program Files\Stata18\ado\base/"
  [3]  (SITE)      "C:\Program Files\Stata18\ado\site/"
  [4]              "."
```

:::

::::

## Instalando paquetes cuando un entorno está activo {.smaller}


Cuando ahora instalamos `reghdfe` nuevamente:

```{.stata code-line-numbers="3|7"}
. ssc install reghdfe
checking reghdfe consistency and verifying not already installed...
installing into C:\Users\lv39\Documents\PROJECT123\ado\plus\...
installation complete.

. which reghdfe
C:\Users\lv39\Documents\PROJECT123\ado\plus\r\reghdfe.ado
*! version 6.12.3 08aug2023
```

Ahora lo vemos en el directorio **específico del proyecto**, que podemos distribuir con todo el proyecto. 


## Instalando versiones precisas de paquetes de Stata {.smaller}

Imaginemos que necesitamos una versión anterior de `reghdfe`. 

- En general, **no** es posible en Stata instalar una versión anterior de un paquete de manera directa. 
- *Puedes* tener éxito con el [archivo Wayback Machine de SSC](https://web.archive.org/web/20141226200440/http://fmwww.bc.edu/RePEc/bocode/). 

## Repositorios de paquetes

La mayoría de repositorios de paquetes tienen versiones:

- R: CRAN, Bioconductor
- Python: PyPI
- Julia: registro de paquetes Julia predeterminado "General".

Stata no lo hace (a partir de 2024). **Pero** ve [el sitio completo](https://larsvilhuber.github.io/self-checking-reproducibility/12-environments-in-stata.html#installing-precise-versions-of-packages) para un enfoque.

## Conclusiones {auto-animate=true .smaller}

De los desiderata anteriores de *entornos*:

-  ✅  **Aislado**: Instalar un paquete nuevo o actualizado para un proyecto no romperá tus otros proyectos, y viceversa. 
-  ✅  **Portable**: Transportar fácilmente tus proyectos de una computadora a otra, *incluso a través de diferentes plataformas*. 
-  ❌ **Reproducible**: Registra las versiones exactas de paquetes de las que dependes, y asegura que esas versiones exactas sean las que se instalen donde quiera que vayas.


## Conclusiones {.smaller}


- [x]  tu código funciona sin problema, después de toda la depuración.
- [x] tu código funciona sin intervención manual, y con poco esfuerzo
- [x] realmente produce todas las salidas
- [x] tu código genera un archivo de registro que puedes inspeccionar, y que podrías compartir con otros.
- [x] ❓ funcionará en la computadora de otra persona
