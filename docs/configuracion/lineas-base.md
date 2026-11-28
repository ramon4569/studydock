# Líneas base y registro de cambios aprobados

Definido en [RFC-0005](../rfcs/0005-trazabilidad-pr-rfc-y-lineas-base.md). Una línea base es una versión aprobada y congelada en `main`; solo cambia mediante un RFC aceptado. Lo actualiza el responsable de versión al crear cada línea base.

## Líneas base

| Línea base | Versión | Referencia en Git | Fecha | Estado | Responsable de versión |
|---|---|---|---|---|---|
| LB-0 | — | commit `4b4fead` en `main` | 25/11/2026 | Vigente | Ramón E. |
| LB-1 | `v0.1.0` | tag `v0.1.0` en `main` | 28/11/2026 | Pendiente de tag | Ramón E. |
| LB-2 | `v1.0.0` | tag `v1.0.0` en `main` | 05/12/2026 | Planificada | Dubenny |

## Cambios aprobados

| RFC | Cambio | Estado del RFC | PR | Autor | Fecha | Entra en |
|---|---|---|---|---|---|---|
| RFC-0001 | Arquitectura en 4 capas con Docker Compose | Aceptado | #1 (infra), #2 (frontend) | Ramón E. / Jonh | 26/11 y 28/11/2026 | LB-1 |
| RFC-0003 | Ramas por módulo y Conventional Commits | Aceptado | #1 | Ramón E. | 26/11/2026 | LB-1 |
| RFC-0004 | Pipeline CI/CD con GitHub Actions | Aceptado | #1 | Ramón E. | 26/11/2026 | LB-1 |
| RFC-0002 | Ollama como proveedor de IA (con mock) | Borrador | — | Dubenny | — | LB-1 / LB-2 |
| RFC-0005 | Trazabilidad PR ↔ RFC y líneas base | Aceptado | #3 (propuesta), `[RFC-0005]` (implementación) | Ramón E. | 28/11/2026 | LB-1 |

## Cómo crear una línea base

```bash
# 1. PR develop -> main con 2 aprobaciones y todos los checks en verde
# 2. Tras fusionar:
git switch main
git pull
git tag -a v0.1.0 -m "LB-1: Entrega 1"
git push origin v0.1.0
# 3. Actualizar las tablas de este documento (estado, PR y fecha)
```
