#!/bin/bash

# Colores para la terminal
VERDE='\033[0;32m'
ROJO='\033[0;31m'
AZUL='\033[0;34m'
NC='\033[0m' # Sin color

echo -e "${AZUL}🚀 Iniciando el sistema de despliegue automatizado del CV...${NC}"

# 1. Validar si Docker se está ejecutando
if ! docker info > /dev/null 2>&1; then
    echo -e "${ROJO}❌ Error: Docker no está activo. Por favor, abre Docker Desktop primero.${NC}"
    exit 1
fi

# 2. Limpieza preventiva
echo -e "${AZUL}🧹 Eliminando contenedores antiguos o huérfanos...${NC}"
docker-compose down --remove-orphans

# 3. Construcción y encendido
echo -e "${AZUL}📦 Construyendo la imagen y levantando el entorno...${NC}"
docker-compose up --build -d

# 4. Verificación del estado
echo -e "${AZUL}⏳ Esperando a que el Healthcheck verifique la app...${NC}"
sleep 5

STATUS=$(docker inspect --format='{{.State.Health.Status}}' cv_responsive_contenedor)

if [ "$STATUS" == "healthy" ]; then
    echo -e "${VERDE}========= ¡DESPLIEGUE EXITOSO! =========${NC}"
    echo -e "${VERDE}💻 Tu CV de 50 imágenes está listo en: http://localhost:8080${NC}"
    echo -e "${VERDE}🔄 Recuerda que puedes editar tus archivos y se actualizarán en vivo.${NC}"
    echo -e "${VERDE}========================================${NC}"
else
    echo -e "${ROJO}⚠️ El contenedor levantó, pero el Healthcheck reporta un estado: $STATUS${NC}"
fi