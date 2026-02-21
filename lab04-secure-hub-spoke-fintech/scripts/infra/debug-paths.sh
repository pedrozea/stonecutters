#!/usr/bin/env bash
set -euo pipefail

# Colores para mejor legibilidad en logs de CI (GitHub Actions, Azure DevOps, etc.)
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Raíz del repo: GitHub Actions usa GITHUB_WORKSPACE; Azure DevOps usa BUILD_SOURCESDIRECTORY
ROOT="${GITHUB_WORKSPACE:-${BUILD_SOURCESDIRECTORY:-.}}"

echo -e "${BLUE}================== DEBUG DE RUTAS ===================${NC}"

echo -e "\n${GREEN}1. Directorio de Trabajo Actual (pwd):${NC}"
pwd

echo -e "\n${GREEN}2. Raíz del repo (GITHUB_WORKSPACE o BUILD_SOURCESDIRECTORY):${NC}"
echo "$ROOT"

echo -e "\n${GREEN}3. Estructura de la raíz (2 niveles):${NC}"
# tree para ver la raíz; si no está instalado, usar find
if command -v tree &>/dev/null; then
  tree -L 2 "$ROOT" 2>/dev/null || true
else
  find "$ROOT" -maxdepth 2 -not -path '*/\.*' 2>/dev/null | head -80
fi

echo -e "\n${GREEN}=====================================================${NC}"
