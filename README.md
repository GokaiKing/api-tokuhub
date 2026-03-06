<div align="center">
  <h1>TokuHub API</h1>
  <img src="https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java" />
  <img src="https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=spring-boot&logoColor=white" alt="Spring Boot" />
  <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL" />
  <img src="https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white" alt="Docker" />
  <img src="https://img.shields.io/badge/Swagger-85EA2D?style=for-the-badge&logo=Swagger&logoColor=black" alt="Swagger" />
</div>

---

## 🌍 Choose your language / Elige tu idioma
* [🇬🇧 English Version](#-english-version)
* [🇪🇸 Versión en Español](#-versión-en-español)

---

# 🇬🇧 English Version

## Project Description

API for a Tokusatsu-style series database and tracking website.

## 📑 Table of Contents (English)
* [Project Description](#project-description)
* [Run Locally](#run-locally)
* [Requirements](#requirements)
* [1. Clone the repository](#1-clone-the-repository)
* [2. Spin up the Database](#2-spin-up-the-database)
* [3. Connect to the Database (Optional)](#3-connect-to-the-database-optional)
* [4. Run the API](#4-run-the-api)
* [5. Test the Endpoints](#5-test-the-endpoints)

## Run Locally

Follow these steps to run the API in your local environment.

---

## Requirements
Before starting, make sure you have installed:

- **Java 17+**
- **Docker**
- **Maven** (optional, the project includes `mvnw`)
- An IDE (recommended: **IntelliJ IDEA**)

---

## 1. Clone the repository
```
git clone <REPOSITORY_URL>
cd <PROJECT_NAME>
``` 
Then open the project in your favorite IDE.

## 2. Spin up the Database

The database is run using Docker.
```
docker compose up -d
``` 
This will start the PostgreSQL container defined in `docker-compose.yml`.

## 3. Connect to the Database (Optional)

You can explore the database using tools like:
- DBeaver
- pgAdmin

### Connection settings:

| Parameter | Value |
|:---|---:|
| Host | localhost |
| Port | 5432 |
| Database | tokuhub_api_db |
| User | admin |
| Password | password123 |

## 4. Run the API

From the root of the project, run:
```
./mvnw spring-boot:run
``` 
The API will start at:
```
http://localhost:8080
``` 

## 5. Test the Endpoints

Once the application is running, you can access the interactive Swagger documentation:
```
http://localhost:8080/swagger-ui.html
``` 
From there, you will be able to test all available endpoints.

---
---

# 🇪🇸 Versión en Español

## Descripción del Proyecto

API para un sitio web de base de datos y seguimiento de series tipo Tokusatsu.

## 📑 Tabla de Contenidos (Español)
* [Descripción del Proyecto](#descripción-del-proyecto)
* [Correr Localmente](#correr-localmente)
* [Requisitos](#requisitos)
* [1. Clonar el repositorio](#1-clonar-el-repositorio)
* [2. Levantar la Base de Datos](#2-levantar-la-base-de-datos)
* [3. Conectarse a la Base de Datos (Opcional)](#3-conectarse-a-la-base-de-datos-opcional)
* [4. Ejecutar la API](#4-ejecutar-la-api)
* [5. Probar los Endpoints](#5-probar-los-endpoints)

## Correr Localmente

Sigue estos pasos para ejecutar la API en tu entorno local.

---

## Requisitos
Antes de comenzar, asegúrate de tener instalado:

- **Java 17+**
- **Docker**
- **Maven** (opcional, el proyecto incluye `mvnw`)
- Un IDE (recomendado: **IntelliJ IDEA**)

---

## 1. Clonar el repositorio
```
git clone <URL_DEL_REPOSITORIO>
cd <NOMBRE_DEL_PROYECTO>
``` 
Luego abre el proyecto en tu IDE favorito.

## 2. Levantar la Base de Datos

La base de datos se ejecuta mediante Docker.
``` 
docker compose up -d
``` 
Esto iniciará el contenedor de PostgreSQL definido en `docker-compose.yml`.

## 3. Conectarse a la Base de Datos (Opcional)

Puedes explorar la base de datos usando herramientas como:
- DBeaver
- pgAdmin

### Configuración de conexión:

| Parametro | Valor |
|:---|---:|
| Host | localhost |
| Puerto | 5432 |
| Base de Datos | tokuhub_api_db |
| Usuario | admin |
| Password | password123 |

## 4. Ejecutar la API

Desde la raíz del proyecto ejecuta:
``` 
./mvnw spring-boot:run
``` 
La API se iniciará en:
``` 
http://localhost:8080
``` 

## 5. Probar los Endpoints

Una vez que la aplicación esté corriendo, puedes acceder a la documentación interactiva de Swagger:
``` 
http://localhost:8080/swagger-ui.html
``` 
Desde ahí podrás probar todos los endpoints disponibles.
