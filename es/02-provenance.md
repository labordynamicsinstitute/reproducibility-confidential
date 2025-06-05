# Mantenerse al día con la procedencia

- Licencias
- Simplificación para la reproducibilidad

# Licencias

## ¿De dónde viene el archivo?

- ¿Cómo podemos describir esto más tarde a alguien? 
  - Apuntar y hacer clic es largo de describir
  - ¿Cuáles son los derechos que tenemos? 

## ¿Qué es una licencia?

> Una licencia es un permiso o autorización oficial para hacer, usar o poseer algo (así como el documento de ese permiso o autorización).[^source1] [^source2]

[^source1]: [Cambridge Dictionary](https://dictionary.cambridge.org/dictionary/english/licence?a=british)
[^source2]: [Wikipedia](https://en.wikipedia.org/wiki/License)

## Ejemplos

- [Licencias Creative Commons](https://creativecommons.org/licenses/), utilizadas para productos artísticos y datos
- [Licencias de código abierto](https://opensource.org/licenses) (BSD, GPL, MIT, etc.), utilizadas para software (código)

## Licencia aplicada a los datos Geodist

- CEPII GeoDist está bajo una "[licencia Etalab 2.0](https://www.etalab.gouv.fr/wp-content/uploads/2018/11/open-licence.pdf)"

## ¿Podemos republicar el archivo?

# Descarga a través de código

## Lo más fácil:

**Stata**

```{.stata}
use "$URL" , clear
```

## ¿Por qué no?

- ¿estará allí en dos meses? ¿en 6 años?
- ¿qué pasa si la conexión a internet está caída?

## Fácil:

**Stata**

```{.stata}
global URL "https://www.cepii.fr/distance/dist_cepii.dta"
copy "$URL" (outputfile), replace
```

**R**

```{.r}
download.file(url="$URL",destfile="(outputfile)")
```

## Llegaremos a métodos aún mejores un poco más tarde

# Creando un README

- [README de plantilla](https://social-science-data-editors.github.io/template_README/template-README.html)
  - Citar tanto el conjunto de datos como el documento de trabajo
  - Agregar URL de datos y tiempo de acceso (¿puedes pensar en una forma de automatizar esto?)
  - Agregar un enlace a la licencia (también: descargar y almacenar la licencia)


## Enlace

Paso 1: [Stata](https://drive.google.com/file/d/10IH2TCnckH8TLeZ0P6cJlVgpyrqC4Q3L/view?usp=sharing), [R](https://drive.google.com/file/d/10_pxEathhgIhxdYl2YFZVhv3oaPgJt2u/view?usp=drive_link) [^fallback1]

[^fallback1]: [🔒Tag: stage1](https://github.com/codedthinking/day1/tree/stage1)
