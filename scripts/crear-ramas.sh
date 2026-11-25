#!/usr/bin/env bash
# Uso: bash scripts/crear-ramas.sh   (desde la raíz del repo, con el commit inicial en main)
set -e
git switch main
git push -u origin main
git switch -c develop && git push -u origin develop

crear() { git switch develop && git switch -c "$1" && git push -u origin "$1"; }

# ---- Semana 1 (entrega sáb 28/11) ----
for r in rfc/0001-arquitectura-docker-compose rfc/0004-pipeline-cicd \
         feature/infra-docker-compose feature/db-init-sql feature/ci-pipeline \
         rfc/0002-proveedor-ia-ollama feature/backend-esqueleto-health feature/backend-proveedor-mock \
         rfc/0003-ramas-y-commits feature/frontend-esqueleto docs/readme-inicial; do crear "$r"; done

# ---- Semana 2 (entrega sáb 05/12) ----
for r in feature/infra-ollama feature/cd-release feature/ci-dependabot \
         feature/backend-crud-documentos feature/backend-endpoint-resumen feature/backend-endpoint-quiz \
         feature/backend-progreso feature/ia-ollama-provider \
         feature/frontend-documentos feature/frontend-resumen-quiz feature/frontend-progreso docs/readme-tecnico; do crear "$r"; done

git switch develop
