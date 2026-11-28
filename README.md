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

## Equipo

- A: infraestructura
- B: backend e IA
- C: frontend y documentación
