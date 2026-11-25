# RFC-0001: Arquitectura en 4 capas con Docker Compose
- Estado: En revisión
- Autor: Persona A
- Fecha: 2026-11-25
- Revisores: Persona B, Persona C

## Resumen
Toda la aplicación corre en contenedores orquestados con Docker Compose: frontend (nginx), backend (Node 20), base de datos (PostgreSQL 16) e IA local (Ollama). Se levanta con `docker compose up --build`.

## Motivación
Que cualquier integrante y el profesor ejecuten la app igual, sin instalar Node, PostgreSQL ni nginx.

## Propuesta
| Servicio | Imagen | Puerto | Volumen |
|---|---|---|---|
| frontend | nginx:alpine | 8080 (publicado) | - |
| backend | node:20-alpine | 3000 (publicado) | - |
| db | postgres:16 | interno | pgdata |
| ollama | ollama/ollama | interno 11434 | ollama |
| ollama-init | ollama/ollama | - | ollama |

- Red interna `studynet`. db y ollama no publican puertos.
- Healthchecks en db, backend y ollama; backend espera a `db` con `condition: service_healthy`.
- Configuración solo por `.env` (en Git solo `.env.example`).
- `docker-compose.override.yml` para desarrollo (monta `backend/src` y recarga).
- Esquema inicial en `db/init.sql` (documents, summaries, quizzes, quiz_attempts).

## Alternativas
- Instalar todo en local: no reproducible entre equipos.
- Kubernetes: excesivo para el alcance del proyecto.

## Impacto
Docker y Git son los únicos requisitos. El CI levanta solo db, backend y frontend.

## Riesgos
Ollama necesita ~8 GB de RAM; se mitiga con modelo pequeño y proveedor mock.

## Plan de implementación
S1: db, backend, frontend, healthchecks y volúmenes. S2: ollama y ollama-init.

## Preguntas abiertas
Ninguna.
