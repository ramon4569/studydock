# RFC-0005: Trazabilidad PR ↔ RFC, líneas base y registro de cambios
- Estado: En revisión
- Autor: Ramón E. (Persona A)
- Fecha: 2026-11-28
- Revisores: Dubenny (Persona B), Jonh (Persona C)

## Resumen
Todo Pull Request debe nacer de un RFC aceptado y citar su número. Cada entrega se congela como **línea base** (tag en `main`) y cada cambio aprobado queda anotado en un registro que relaciona RFC, PR y versión.

## Motivación
El docente exige que cada PR esté asociado a un RFC. Hasta ahora el RFC se escribía en el mismo PR que lo implementaba, así que no había una aprobación previa ni una forma de saber qué cambios entran en cada versión.

## Propuesta

### 1. Ciclo de un cambio
1. Se redacta `docs/rfcs/NNNN-titulo.md` con `Estado: En revisión`.
2. **PR de propuesta** con título `docs(rfc): RFC-NNNN …` que solo contiene el RFC. 48 h de comentarios.
3. Con 2 aprobaciones el autor cambia el estado a `Aceptado` y se fusiona.
4. **PR de implementación**: título `[RFC-NNNN] tipo(ámbito): …` y en la descripción `Implementa: RFC-NNNN`. Un RFC puede tener varios PR.
5. Al cerrar la implementación el RFC pasa a `Implementado` y el cambio se anota en el registro.

### 2. Control automático
Workflow `.github/workflows/rfc.yml`, job `rfc-check` (check obligatorio en `develop` y `main`). Falla si:
- el título o la descripción no contiene `RFC-NNNN`;
- no existe `docs/rfcs/NNNN-*.md`;
- el RFC no está `Aceptado` o `Implementado` (salvo en el propio PR de propuesta, `docs(rfc): …`).

Se ejecuta también al editar el título o la descripción.

### 3. Líneas base
Una línea base es una versión aprobada y congelada del repositorio que solo cambia mediante RFC.

| Línea base | Versión | Dónde | Cuándo |
|---|---|---|---|
| LB-0 | — | commit `4b4fead` en `main` | Estructura inicial (25/11) |
| LB-1 | `v0.1.0` | tag en `main` | Entrega 1 (28/11) |
| LB-2 | `v1.0.0` | tag en `main` | Entrega 2 (05/12) |

Crear una línea base = PR `develop → main` (2 aprobaciones) + tag anotado `git tag -a vX.Y.Z -m "LB-N"`.

### 4. Registro de cambios aprobados
`docs/configuracion/lineas-base.md` lista cada línea base y, por cada cambio aprobado: RFC, PR, autor, fecha y versión en la que entra. Lo actualiza el responsable de versión al crear cada línea base.

## Alternativas
- Asociar PR a issues en lugar de RFC: el docente pide RFC explícitamente.
- Revisión manual sin check: depende de la memoria de cada revisor.

## Impacto
Nuevo workflow `rfc.yml`, plantilla de PR con el campo `Implementa: RFC-XXXX`, documento de líneas base. Los PR abiertos deben añadir su RFC al título.

## Riesgos
Más pasos por cambio. Mitigación: un RFC agrupa varios PR del mismo tema; correcciones pequeñas usan el RFC del módulo ya aceptado.

## Plan de implementación
1. PR de propuesta con este RFC.
2. PR `[RFC-0005]` con `rfc.yml`, plantilla y registro de líneas base.
3. Activar `rfc-check` como obligatorio en `develop` y `main`.
4. Crear LB-1 (`v0.1.0`) hoy.

## Preguntas abiertas
Ninguna.
