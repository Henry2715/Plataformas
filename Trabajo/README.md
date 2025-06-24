# Sitio Web para la gestión de los recursos de Bienestar Universitario de la Universidad de Pamplona en la sede de Villa del Rosario
El presente proyecto tiene como objetivo el desarrollo de una plataforma web destinada a la gestión eficiente de los recursos y servicios proporcionados por Bienestar Universitario de la Universidad de Pamplona en la sede Villa del Rosario. Esta herramienta busca centralizar la información institucional, facilitar la interacción entre los usuarios y el área de bienestar, y optimizar los procesos administrativos y de atención dirigidos a la comunidad académica.
## Tecnologías usadas
- HTML, CSS, Javascript
- Bootstrap
## Como ejecutar
1. Clona el repositorio:
   ```bash
   git clone https://github.com/Henry2715/Plataformas.git
2. Entra a la carpeta Trabajo:
   cd Plataformas/Trabajo
3. Instala las dependencias:
   npm install
4. Inicia el servidor:
   npm start
Asegúrate de tener Node.js y npm instalados en tu máquina.
## Autores
- Stefanny Fajardo FRONTEND Y DOCUMENTACIÓN
-  Henry David Suarez BACKEND
-  Fabian Andres Arias BACKEND
## Estado
🚧 En desarrollo

# API REST – Sistema de Bienestar

## Base URL

```
http://localhost:5678
```

### Formato de respuesta

```json
{
  "data": <objeto | lista | null>,
  "message": "OK"
}
```

Errores devuelven el mismo esquema con `data:null` y un mensaje acorde.

---

## Endpoints

| Entidad | Método | Ruta | Descripción |
| ------- | ------ | ---- | ----------- |
|         |        |      |             |

| **Usuario**           | GET    | `/usuarios`                 | Listar usuarios          |
| --------------------- | ------ | --------------------------- | ------------------------ |
|                       | GET    | `/usuarios/{id}`            | Obtener un usuario       |
|                       | POST   | `/usuarios`                 | Crear usuario            |
|                       | PUT    | `/usuarios/{id}`            | Actualizar usuario       |
|                       | DELETE | `/usuarios/{id}`            | Eliminar usuario         |
| **ÁreaBienestar**     | GET    | `/areas-bienestar`          | Listar áreas             |
|                       | GET    | `/areas-bienestar/{id}`     | Obtener área             |
|                       | POST   | `/areas-bienestar`          | Crear área               |
|                       | PUT    | `/areas-bienestar/{id}`     | Actualizar área          |
|                       | DELETE | `/areas-bienestar/{id}`     | Eliminar área            |
| **TipoRequerimiento** | GET    | `/tipos-requerimiento`      | Listar tipos             |
|                       | GET    | `/tipos-requerimiento/{id}` | Obtener tipo             |
|                       | POST   | `/tipos-requerimiento`      | Crear tipo               |
|                       | PUT    | `/tipos-requerimiento/{id}` | Actualizar tipo          |
|                       | DELETE | `/tipos-requerimiento/{id}` | Eliminar tipo            |
| **Requerimiento**     | GET    | `/requerimientos`           | Listar requerimientos    |
|                       | GET    | `/requerimientos/{id}`      | Obtener requerimiento    |
|                       | POST   | `/requerimientos`           | Crear requerimiento      |
|                       | PUT    | `/requerimientos/{id}`      | Actualizar requerimiento |
|                       | DELETE | `/requerimientos/{id}`      | Eliminar requerimiento   |

---

## Ejemplos

### Crear usuario

**Request**

```http
POST /usuarios HTTP/1.1
Content-Type: application/json

{
  "nombre_completo": "Ana Pérez",
  "correo_electronico": "ana@uni.edu"
}
```

**Response 201**

```json
{
  "data": {
    "id": 2,
    "nombre_completo": "Ana Pérez",
    "correo_electronico": "ana@uni.edu"
  },
  "message": "Creado"
}
```

### Listar áreas de bienestar

```http
GET /areas-bienestar HTTP/1.1
```

```json
{
  "data": [
    { "id_area": 1, "nombre_area": "Salud" },
    { "id_area": 2, "nombre_area": "Cultura" }
  ],
  "message": "OK"
}
```

### Crear requerimiento (multipart)

```bash
curl -F id_usuario=1 \
     -F id_area=2 \
     -F id_tipo=3 \
     -F descripcion="Dolor de cabeza" \
     -F archivo=@reporte.pdf \
     http://localhost:5678/requerimientos
```

---

## Notas

* Todas las fechas usan el formato `YYYY-MM-DD HH:MM:SS`.
* En multipart usa la cabecera `Content-Type: multipart/form-data`.
* Para cambios parciales, envía solo los campos a modificar.


## --- POSTMAN ---
# API REST «Bienestar Universitario»
Servidor Flask (Puerto `5678`) con operaciones CRUD para **usuarios**, **áreas de bienestar**, **tipos de requerimiento** y **requerimientos**.

> Cambia `localhost:5678` si tu instancia corre en otra IP o puerto.

---

## Endpoints

### 1. `/usuarios`

| Acción | cURL |
| ------ | ---- |
| **Listar** | `curl -X GET http://localhost:5678/usuarios` |
| **Obtener** | `curl -X GET http://localhost:5678/usuarios/<id>` |
| **Crear** | ```bash\ncurl -X POST http://localhost:5678/usuarios \\\n     -H "Content-Type: application/json" \\\n     -d '{"nombre_completo":"Juan Pérez","correo_electronico":"juan@example.com"}'``` |
| **Actualizar** | ```bash\ncurl -X PUT http://localhost:5678/usuarios/<id> \\\n     -H "Content-Type: application/json" \\\n     -d '{"nombre_completo":"Juan P. Pérez"}'``` |
| **Eliminar** | `curl -X DELETE http://localhost:5678/usuarios/<id>` |

---

### 2. `/areas-bienestar`

| Acción | cURL |
| ------ | ---- |
| **Listar** | `curl -X GET http://localhost:5678/areas-bienestar` |
| **Obtener** | `curl -X GET http://localhost:5678/areas-bienestar/<id>` |
| **Crear** | ```bash\ncurl -X POST http://localhost:5678/areas-bienestar \\\n     -H "Content-Type: application/json" \\\n     -d '{"nombre_area":"Deportes"}'``` |
| **Actualizar** | ```bash\ncurl -X PUT http://localhost:5678/areas-bienestar/<id> \\\n     -H "Content-Type: application/json" \\\n     -d '{"nombre_area":"Bienestar Físico"}'``` |
| **Eliminar** | `curl -X DELETE http://localhost:5678/areas-bienestar/<id>` |

---

### 3. `/tipos-requerimiento`

| Acción | cURL |
| ------ | ---- |
| **Listar** | `curl -X GET http://localhost:5678/tipos-requerimiento` |
| **Obtener** | `curl -X GET http://localhost:5678/tipos-requerimiento/<id>` |
| **Crear** | ```bash\ncurl -X POST http://localhost:5678/tipos-requerimiento \\\n     -H "Content-Type: application/json" \\\n     -d '{"nombre_tipo":"Consulta Médica"}'``` |
| **Actualizar** | ```bash\ncurl -X PUT http://localhost:5678/tipos-requerimiento/<id> \\\n     -H "Content-Type: application/json" \\\n     -d '{"nombre_tipo":"Terapia Psicológica"}'``` |
| **Eliminar** | `curl -X DELETE http://localhost:5678/tipos-requerimiento/<id>` |

---

### 4. `/requerimientos`

> `tipo_cita` valores válidos: **Medica**, **Psicologia**, **Cultura**, **Deporte**.  
> Para `multipart/form-data`, usa “Body → form-data” en Postman.

| Acción | cURL |
| ------ | ---- |
| **Listar** | `curl -X GET http://localhost:5678/requerimientos` |
| **Obtener** | `curl -X GET http://localhost:5678/requerimientos/<id>` |
| **Crear (multipart)** | ```bash\ncurl -X POST http://localhost:5678/requerimientos \\\n     -F id_usuario=1 \\\n     -F id_area=1 \\\n     -F id_tipo=1 \\\n     -F descripcion="Dolor de cabeza crónico" \\\n     -F tipo_cita=Medica \\\n     -F archivo=@/ruta/archivo.pdf   # opcional``` |
| **Actualizar (JSON)** | ```bash\ncurl -X PUT http://localhost:5678/requerimientos/<id> \\\n     -H "Content-Type: application/json" \\\n     -d '{"descripcion":"Actualizada","tipo_cita":"Psicologia"}'``` |
| **Actualizar (multipart)** | ```bash\ncurl -X PUT http://localhost:5678/requerimientos/<id> \\\n     -F descripcion="Texto nuevo" \\\n     -F archivo=@/ruta/nueva.pdf``` |
| **Eliminar** | `curl -X DELETE http://localhost:5678/requerimientos/<id>` |

---

## Notas rápidas

* Todos los `id` deben existir (clave foránea) antes de crear un requerimiento.  
* Usa `-H "Content-Type: application/json"` solo cuando envíes JSON.  
* Para probar errores, omite campos requeridos y verifica la respuesta con código 400.
