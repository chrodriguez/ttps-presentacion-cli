# Presentacion TTPS Ruby 2021

Este año pensé una presentación diferente, una presentación interactiva, que sea
código ruby desde la consola. Por eso armé este repositorio, así vamos
conociendo Ruby mientras presentamos de qué se trata la materia

## ¿Cómo?

La idea de este repositorio es el de proveer una clase que presenta las
diferentes páginas que uso cuando presento la materia usando una PPT. En
realidad no usamos PPT, sino que el material completo (incluida la presentación)
[está online](https://ttps-ruby.github.io/teoria).

## Uso

El uso de la clase, será a través de IRB, la consola de ruby:

```
irb -I . -r ttps_subject_presentation.rb
```

Luego de iniciada la consola, es posible invocar los métodos que presentan la
materia:

```ruby
ttps = TTPSSubjectPresentation.new
ttps.present
```
