# El README


## Tres partes del README

- Disponibilidad de datos (y citas)
- Requisitos del computador
- Descripción del procesamiento

## Comience con la última parte

Eso es fácil: has estado manteniendo instrucciones claras desde el principio, ¿verdad?

- Ejecutar "`main.do`" o `run.sh`
- Describir qué partes podrían omitirse
- Describir qué hacen las diversas partes
- Describir qué partes usan datos confidenciales

¡Has estado haciendo eso **desde el día 1!**

## Requisitos del computador

En la mayoría de entornos confidenciales, como FSRDC/IRE, esta parte está fuera de tu control. ¡Pero descríbela de todos modos!



## Requisitos del computador

- Descripción aproximada de computadoras/nodos utilizados
  - tamaño de memoria (¡pero interesado en el uso real, no en el máximo de lo que tiene el sistema!)
  - ¡tiempo de cómputo! ¿Cuánto tiempo toma una ejecución limpia, de arriba a abajo?
  - número de nodos: ¿algún procesamiento paralelo?
- Software
  - Versión del software (Stata 17, nivel de actualización)
  - ¡Todos los paquetes! Idealmente, versión del paquete (`which estout`)

## Requisitos del computador (FSRDC)

- ¿Utilizaste PBS? Claro que sí.

¡Incluye los archivos `qsub`! (O si utilizaste `qstata` o similar, describe eso).

```{.bash code-line-numbers="3"}
...
run.sh
qsub-complete.sh
```


## Disponibilidad de datos

- Esto es fácil: ¡son los datos que solicitaste tener incluidos en tu proyecto FSRDC!
- ¡Así que tenías esta información desde el **Día -90** del proyecto!

## Disponibilidad de datos redux

Para describir la disponibilidad de datos, divídela en dos: 

- cómo OBTUVISTE acceso a los datos (eso es antiguo) 
- cómo pueden OTROS obtener acceso a los mismos datos (¡eso podría ser diferente!)
- Los dos no siempre son lo mismo, pero ambos son relevantes. 

## Ejemplos {transition="fade" .smaller}

Los ejemplos incluyen 

- [esta excelente descripción](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) de un artículo de [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):

## Ejemplos {transition="fade" .smaller}

Los ejemplos incluyen 

- [esta excelente descripción](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) de un artículo de [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):


> 1. Todos los resultados en el artículo utilizan microdatos confidenciales de la Oficina del Censo de EE.UU. Para obtener
acceso a los microdatos del Censo, sigue las instrucciones aquí sobre cómo escribir una propuesta para acceso
a los datos a través de un Centro Federal de Datos de Investigación Estadística:
https://www.census.gov/ces/rdcresearch/howtoapply.html.
> -

## Ejemplos {transition="fade" .smaller}

Los ejemplos incluyen 

- [esta excelente descripción](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) de un artículo de [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):

> 2. Debes solicitar los siguientes conjuntos de datos en tu propuesta:
>   - Base de Datos Longitudinal de Negocios (LBD), 2002 y 2007
>   - Base de Datos de Comercio Exterior – Importación (IMP), 2002 y 2007
>   - Encuesta Anual de Manufactura (ASM), incluyendo el Suplemento de Uso de Redes de Computadoras (CNUS), 1999
>   - [...]
>   - Encuesta Anual de Insumos Mágicos (ASMI), 2002 y 2007

## Ejemplos {transition="fade" .smaller}

Los ejemplos incluyen 

- [esta excelente descripción](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) de un artículo de [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):


> 3. Referencia 
>   - "Tecnología y Fragmentación de la Producción: Abastecimiento Doméstico versus Extranjero" por Teresa Fort, número de proyecto br1179 en la propuesta. 
> Esto te dará acceso a   los programas y conjuntos de datos de entrada requeridos para reproducir los resultados. 
> Solicitar una búsqueda de archivos   con el DOI del artículo ("10.1093/restud/rdw057") debería generar los mismos resultados. 
> -

## Ejemplos {transition="fade" .smaller}

Los ejemplos incluyen 

- [esta excelente descripción](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) de un artículo de [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):

>   NOTA: Los archivos relacionados con el proyecto están disponibles por 10 años a partir de 2015. 


## Ejemplos {transition="fade" .smaller}

Los ejemplos incluyen 

- [esta descripción](https://social-science-data-editors.github.io/guidance/Requested_information_dcas.html#example-for-confidential-data) por Fadlon y Nielsen sobre datos daneses

> La información utilizada en el análisis combina varios registros administrativos daneses (como se describe en el artículo). El uso de datos está sujeto al Reglamento General de Protección de Datos (GDPR) de la Unión Europea según las nuevas regulaciones danesas de mayo de 2018. Los datos se almacenan físicamente en computadoras en Statistics Denmark y, debido a consideraciones de seguridad, los datos no pueden transferirse a computadoras fuera de Statistics Denmark. 

## Ejemplos {transition="fade" .smaller}

Los ejemplos incluyen 

- [esta descripción](https://social-science-data-editors.github.io/guidance/Requested_information_dcas.html#example-for-confidential-data) por Fadlon y Nielsen sobre datos daneses

> Los investigadores interesados en obtener acceso a los datos de registro empleados en este artículo deben presentar una solicitud escrita para obtener la aprobación de Statistics Denmark. La solicitud debe incluir una descripción detallada del proyecto propuesto, su propósito y su contribución social, así como una descripción de los conjuntos de datos requeridos, variables y población de análisis. 

## Ejemplos {transition="fade" .smaller}

Los ejemplos incluyen 

- [esta descripción](https://social-science-data-editors.github.io/guidance/Requested_information_dcas.html#example-for-confidential-data) por Fadlon y Nielsen sobre datos daneses

> Las solicitudes pueden ser presentadas por investigadores que estén afiliados con instituciones danesas aceptadas por Statistics Denmark, o por investigadores fuera de Dinamarca que colaboren con investigadores afiliados con estas instituciones.

(Ejemplo tomado de [Fadlon y Nielsen, AEJ:Applied 2021](https://doi.org/10.1257/app.20170604)).


## Ejemplos {.smaller transition="fade" } 

También otorga permiso a los archivos de tu proyecto:

> Otorgo a cualquier investigador con el permiso de proyecto aprobado por el Censo apropiado el uso de mis archivos de investigación exactos siempre que esos archivos estuvieran entre los que solicitaron cuando se obtuvo la aprobación (un requisito de la Oficina del Censo). Estos archivos se pueden encontrar buscando el DOI de 
[este archivo/ este artículo] entre las copias de seguridad/archivos hechos en [mes del archivo].

## No olvides citar los datos {.smaller}

> Bureau of the Census. (año de publicación). American Community Survey-Master Address File Crosswalk YYYY-YYZZ [Archivo de Datos]. Federal Statistical Research Data Center [distribuidor].
> 
> Graf, Tobias; Grießemer, Stephan; Köhler, Markus; Lehnert, Claudia; Moczall, Andreas; Oertel, Martina; Schmucker, Alexandra; Schneider, Andreas; Seth, Stefan; Thomsen, Ulrich; vom Berge, Philipp (2023): "Versión débilmente anónima de la Muestra de Biografías Integradas del Mercado Laboral (SIAB) – Versión 7521 v1". Centro de Datos de Investigación de la Agencia Federal de Empleo (BA) en el Instituto de Investigación del Empleo (IAB). <https:/doi.org/10.5164/IAB.SIAB7521.de.en.v1>


- Más ejemplos en [Zotero para FSRDC](https://www.zotero.org/groups/2245704/fsrdc) (posiblemente no el más actual).
- Idealmente, cada centro de datos de investigación tendría "páginas de destino" para los datos (el ejemplo del IAB sí las tiene)



## Tres partes del README: cronología

| | |
|---------|----------|
|- Disponibilidad de datos (y citas):|**Inicio del proyecto, editar al final**|
|- Requisitos del computador: | Mitad del proyecto|
|- Descripción del procesamiento: | Mitad del proyecto|
| | |

con el final realmente solo una última lectura/edición.
