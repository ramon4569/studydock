# RFC-0004: Pipeline CI/CD con GitHub Actions
- Estado: En revisión
- Autor: Persona A
- Fecha: 2026-11-25
- Revisores: Persona B, Persona C

## Resumen
Cada PR pasa automáticamente por lint, tests y una prueba de humo en contenedores. Cada tag `v*.*.*` publica las imágenes en GitHub Container Registry.

## Motivación
Evitar que llegue a develop o main código que no compila o no arranca.

## Propuesta
| Workflow | Disparador | Qué hace |
|---|---|---|
| ci.yml | PR a develop/main, push a develop | `lint-test` (npm ci, lint, test con `AI_PROVIDER=mock`) y `docker-smoke` (compose up --wait de db, backend y frontend + curl a /health y :8080) |
| release.yml | tag `v*.*.*` | build y push de backend y frontend a `ghcr.io/<repo>/<servicio>:<tag>` y `:latest` |
| dependabot.yml | semanal | PRs de actualización npm, Dockerfiles y Actions hacia develop |

- `lint-test` y `docker-smoke` son checks obligatorios en main y develop.
- Caché de npm con `actions/setup-node`.
- Permisos mínimos; se usa `GITHUB_TOKEN`, sin contraseñas personales.
- El CI no descarga el modelo de IA (usa mock).

## Alternativas
- GitLab CI / Jenkins: el repo está en GitHub, Actions no requiere infraestructura extra.

## Impacto
Requiere `backend/package-lock.json` en el repo y Dockerfiles de backend y frontend funcionales.

## Riesgos
CI lento por builds: se mitiga con imágenes alpine y sin Ollama.

## Plan de implementación
S1: ci.yml. S2: release.yml y dependabot.yml; primer tag v1.0.0.

## Preguntas abiertas
Ninguna.
