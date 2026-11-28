# StudyDock

App web donde pegas tus apuntes y una IA local (Ollama) te hace un resumen y un quiz. Todo corre con Docker Compose.

## Cómo correrlo

Hace falta tener Docker y Git.

```bash
git clone https://github.com/ramon4569/studydock.git
cd studydock
cp .env.example .env
docker compose up --build
```

- Frontend: http://localhost:8080
- Backend: http://localhost:3000/health

Para apagarlo: `docker compose down`

## Servicios

- **frontend**: nginx en el puerto 8080. Lo que va a `/api` lo manda al backend.
- **backend**: Node/Express en el puerto 3000.
- **db**: PostgreSQL (no se expone).
- **ollama**: la IA, se agrega en la entrega 2.

## Ramas

Cada uno trabaja en su rama (`feature/infra`, `feature/backend`, `feature/frontend`) y los cambios entran a `develop` por pull request. Los commits van con el formato `tipo(ámbito): descripción`.

## Cambios: todo PR nace de un RFC

Ningún código entra sin un RFC aprobado ([RFC-0005](docs/rfcs/0005-trazabilidad-pr-rfc-y-lineas-base.md)):

1. Se propone el cambio en `docs/rfcs/NNNN-titulo.md` con un PR titulado `docs(rfc): RFC-NNNN …`.
2. Con 2 aprobaciones el RFC pasa a `Aceptado` y se fusiona.
3. Los PR de implementación llevan `[RFC-NNNN]` en el título e `Implementa: RFC-NNNN` en la descripción.
4. El check `rfc-check` bloquea cualquier PR que no cite un RFC existente y aceptado.

Los RFC están en [`docs/rfcs/`](docs/rfcs/).

## Versiones y líneas base

Una línea base es una versión aprobada y congelada en `main`. Solo cambia mediante un RFC aceptado, y cada una se marca con un tag.

| Línea base | Versión | Contenido | Fecha | Estado |
|---|---|---|---|---|
| LB-0 | — (commit `4b4fead`) | Estructura inicial del proyecto | 25/11/2026 | Vigente |
| LB-1 | `v0.1.0` | Entrega 1: repositorio y reglas, Docker Compose (db, backend, frontend), CI, página de estado. RFC 0001, 0003, 0004 y 0005 | 28/11/2026 | En preparación |
| LB-2 | `v1.0.0` | Entrega 2: resumen y quiz con Ollama, historial y progreso, imágenes en GitHub Container Registry | 05/12/2026 | Planificada |

Versionado semántico: `v0.x.y` durante el desarrollo y `v1.0.0` en la entrega final.

Para crear una línea base: PR `develop → main` con 2 aprobaciones y el CI en verde, y después:

```bash
git switch main
git pull
git tag -a v0.1.0 -m "LB-1: Entrega 1"
git push origin v0.1.0
```

El detalle de cada línea base y de los cambios aprobados (RFC → PR → versión) está en [`docs/configuracion/lineas-base.md`](docs/configuracion/lineas-base.md).

## Equipo

- Ramón E.: infraestructura, DevOps y CI/CD
- Dubenny: backend e IA
- Jonh: frontend y documentación
