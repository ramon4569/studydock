# RFC-0003: Estrategia de ramas por módulo y Conventional Commits
- Estado: Aceptado (28/11/2026, aprobado en PR #1)
- Autor: Persona A
- Fecha: 2026-11-25
- Revisores: Persona B, Persona C

## Resumen
Se sustituye la estrategia de ramas cortas por tarea (propuesta técnica, sección 3) por **una rama por módulo** que vive todo el proyecto. Se mantienen `main`, `develop`, los PR obligatorios, el CI y Conventional Commits.

## Motivación
Somos 3 personas con un módulo fijo cada una y 2 semanas de plazo. Crear y borrar una rama por tarea (23 ramas) añade gestión sin aportar valor: cada módulo ya tiene un único responsable (CODEOWNERS), así que los conflictos entre ramas son mínimos.

## Propuesta

### Ramas
| Rama | Responsable | Origen → destino |
|---|---|---|
| `main` | Release manager | Recibe PR desde `develop`. Cada entrega lleva tag. |
| `develop` | Todos | Recibe PR desde las ramas de módulo. Rama por defecto. |
| `feature/infra` | Persona A | `develop` → `develop` (db/, docker-compose, .github/) |
| `feature/backend` | Persona B | `develop` → `develop` (backend/) |
| `feature/frontend` | Persona C | `develop` → `develop` (frontend/, docs/, README) |
| `hotfix/<tema>` | Quien lo detecte | `main` → `main` y `develop` |

### Cambios respecto a la propuesta técnica
| Regla | Propuesta original | Nueva |
|---|---|---|
| Ramas de trabajo | `feature/<área>-<tema>`, `rfc/…`, `docs/…` (cortas) | `feature/<módulo>` (permanentes) |
| Fusión en develop | Squash and merge | **Merge commit** (si no, la rama de módulo pierde el historial común y reaparecen conflictos) |
| Borrar rama tras fusionar | Sí | **No** |
| RFC | Rama `rfc/NNNN-…` propia | El RFC va en la rama del módulo del autor, en un commit `docs(rfc): …` |

### Se mantiene
- Push directo bloqueado en `main` y `develop`; todo por PR.
- Aprobaciones: 1 en `develop`, 2 en `main`. Review de CODEOWNERS obligatoria.
- Checks obligatorios: `lint-test` y `docker-smoke`.
- Fusión de `develop` a `main` con merge commit y tag semántico: `v0.1.0` (entrega 1, 28/11) y `v1.0.0` (entrega 2, 05/12).

### Flujo diario
```bash
git switch feature/<módulo>
git pull origin develop        # sincronizar a diario (merge, no rebase: la rama es compartida en remoto)
git commit -m "feat(<módulo>): ..."
git push                       # PR feature/<módulo> → develop al terminar cada funcionalidad
```
Se abre un PR por cada funcionalidad terminada, no uno por semana, para que la progresión quede registrada.

### Conventional Commits
`tipo(ámbito): descripción`. Tipos: `feat`, `fix`, `docs`, `test`, `ci`, `build`, `refactor`, `chore`. Ámbitos: `infra`, `db`, `backend`, `ai`, `frontend`, `rfc`.

## Alternativas
- **Ramas por tarea (original):** más trazable, pero excesivo para 3 personas y 2 semanas.
- **Trunk-based (todo en develop):** se pierde la revisión por PR que exige la práctica.

## Impacto
Protección de ramas en GitHub ajustada (develop: merge commit, sin borrado automático). Sin cambios en código, Docker ni CI.

## Riesgos
Ramas largas pueden divergir de `develop`. Mitigación: `git pull origin develop` diario y PR pequeños y frecuentes.

## Plan de implementación
Aplicado el 25/11: ramas creadas y reglas configuradas en GitHub.

## Preguntas abiertas
Ninguna.
