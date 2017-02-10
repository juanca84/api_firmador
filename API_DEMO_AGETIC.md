# API REST DEMO AGETIC

## Obtener datos de una persona

Este servicio devuelve los datos de una persona en especifico

GET:

```sh
/api/personas
```
Parámetros de entrada y salida:

| Campo          | Tipo         | Descripción                                                                                                                          |
|----------------|--------------|--------------------------------------------------------------------------------------------------------------------------------------|
| doc            | Integer      | Número de documento de la persona. Dato obligatorio.                                                                                 |
|----------------|--------------|--------------------------------------------------------------------------------------------------------------------------------------|
| fna            | Date         | Fecha de nacimiento de la persona. Dato obligatorio.                                                                                 |



Ejemplo de consumo:

```sh
curl -X GET http://localhost:3000/api/personas\?doc\=12659588\&fna\=19/01/2014

Servicio que obtiene los datos de una determinada persona usando su número de documento y su fecha de nacimiento.
```

Ejemplo de respuesta exitosa:
```sh
{
  "documento": "12659588",
  "nombres": "AGUSTIN JORDAN",
  "apellido_primero": "SEGOVIA",
  "apellido_segundo": "ESCALERA",
  "fecha_nacimiento": "19/01/2014",
  "id_doc": 159,
  "pdf": "JVBERi0xLjQKMSAwIG9iago8PAovVGl0bGUgKP7/KQovQ3Jl...+CnN0YXJ0eHJlZgo0OTQ2NwolJUVPRgo=\n"
}
```


## Obtener datos de una empresa

Este servicio devuelve los datos de una empresa determinada.

GET:

```sh
/api/empresas
```

Parámetros de entrada y salida:

| Campo          | Tipo         | Descripción                                                                                                                          |
|----------------|--------------|--------------------------------------------------------------------------------------------------------------------------------------|
| nit            | String       | Número de Identificación Tributaria o Nombre de la Razón Social. Dato obligatorio.                                                   |




Ejemplo de consumo 1:

```sh
curl -X GET http://localhost:3000/api/empresas?nit=1022579028

Servicio que obtiene los datos de una determinada empresa usando su NIT.
```

Ejemplo de respuesta exitosa:
```sh
{
  "nit": "01022579028",
  "razon_social": "LOS AMIGOS DEL LIBRO LTDA.",
  "id_doc": 163,
  "pdf": "JVBERi0xLjQKMSAwIG9iago8PAovVGl0bGUgKP7/KQovQ3JlYXRvciAo/v8A\ndwBrA...DE4IDAgUgo+PgpzdGFydHhyZWYKNDg1ODYK\nJSVFT0YK\n"
}
```

Ejemplo de consumo 2:

```sh
curl -X GET http://localhost:3000/api/empresas?nit=LABOCAST

Servicio que obtiene los datos de una determinada empresa usando su razón social.
```

Ejemplo de respuesta exitosa:
```sh
{
  "nit": "00283672023",
  "razon_social": "LABOCAST S.R.L.",
  "id_doc": 166,
  "pdf": "JVBERi0xLjQKMSAwIG9iago8PAovVGl0bGUgKP7/KQovQ3JlYXRvciAo/v8A\ndwBrA...DE4IDAgUgo+PgpzdGFydHhyZWYKNDg1ODYK\nJSVFT0YK\n"
}
```

## Actualizar archivo PDF

Este servicio actualiza un archivo PDF de un determinado documento.

PUT:

```sh
api/documentos/:id

```
Parámetros de entrada y salida:

| Campo          | Tipo         | Descripción                                                                                                                          |
|----------------|--------------|--------------------------------------------------------------------------------------------------------------------------------------|
| :id            | Integer      | Identificador de documento que será actualizado. Dato obligatorio.                                                                   |
|----------------|--------------|--------------------------------------------------------------------------------------------------------------------------------------|
| pdf            | String       | Nuevo archivo PDF en base 64 que será actualizado. Dato obligatorio.                                                                                  |




Ejemplo de consumo:

```sh
curl -H 'Content-Type: application/json' -X PUT http://localhost:3000/api/documentos/2 -d '{"pdf":"JVBERi0xLjQKMSAwIG9iago8PAovVGl0bGUgKP7/KQo...dGFydHhyZWYKMTUzMzYK\nJSVFT0YK\n"}'

Servicio que actualiza un archivo PDF de un determinado documento.
```

Ejemplo de respuesta exitosa:
```sh
{
  "mensaje": "La actualización se realizó correctamente."
}
```
