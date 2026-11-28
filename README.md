# StudyDock

Asistente de estudio: pegas tus apuntes y la app te genera un resumen y un quiz usando una IA local (Ollama). Todo corre en contenedores con Docker Compose, así que no hace falta instalar Node, PostgreSQL ni nginx en tu máquina.

> Estado: **v0.1.0 (Entrega 1)**. Por ahora levantan la base de datos, el backend y el frontend, y el frontend muestra si el backend está respondiendo. Las vistas de apuntes, resumen, quiz y progreso llegan en la Entrega 2.

## Requisitos

- Docker Desktop (o Docker Engine con el plugin `compose`)
- Git

## Cómo levantarlo

```bash
git clone https://github.com/ramon4569/studydock.git
cd studydock
cp .env.example .env
docker compose up --build
```

En Windows (PowerShell) el `cp` funciona igual, o se puede usar `copy .env.example .env`.

Cuando termine de levantar:

| Qué | Dirección |
|---|---|
| Frontend | http://localhost:8080 |
| Backend (salud) | http://localhost:3000/health |
| Backend desde el frontend | http://localhost:8080/api/health |

Para apagarlo: `docker compose down` (con `-v` también se borra la base de datos).

## Servicios

| Servicio | Imagen | Puerto | Para qué |
|---|---|---|---|
| frontend | nginx:alpine | 8080 | Sirve la página y pasa `/api` al backend |
| backend | node:20-alpine | 3000 | API en Express |
| db | postgres:16 | interno | Guarda apuntes, resúmenes y quizzes |
| ollama | ollama/ollama | interno | IA local (Entrega 2) |

El frontend no llama al puerto 3000 directamente. Todo lo que empieza por `/api` lo recibe nginx y lo reenvía a `http://backend:3000` quitando el `/api`. Por ejemplo, `/api/health` llega al backend como `/health`. Así no hay problemas de CORS y el navegador solo habla con el 8080.

## Estructura del repo

```
backend/     API (Persona B)
frontend/    nginx + página estática (Persona C)
db/          esquema inicial init.sql (Persona A)
docs/        RFCs y arquitectura
.github/     CI, plantillas de PR e issues
```

## Cómo trabajamos

- Una rama por módulo: `feature/infra`, `feature/backend`, `feature/frontend`. Nadie hace push directo a `develop` ni a `main`.
- Cada funcionalidad va en su propio PR hacia `develop`, con la plantilla y `Closes #N`.
- Commits con Conventional Commits, por ejemplo `feat(frontend): muestra estado del backend`.
- Antes de trabajar: `git pull origin develop` en tu rama (merge, no rebase).
- Nunca se sube el `.env`, solo `.env.example`.

Las decisiones grandes están en `docs/rfcs/` (0001 arquitectura, 0002 proveedor de IA, 0003 ramas y commits, 0004 CI/CD).

## Equipo

| Persona | Módulo |
|---|---|
| A | Infraestructura y DevOps |
| B | Backend e IA |
| C | Frontend y documentación |
