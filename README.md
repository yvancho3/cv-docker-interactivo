# CV Interactivo con Docker 🐋

Este proyecto contiene un currículum vitae interactivo de 50 páginas, desplegado utilizando contenedores de Nginx optimizados con Docker.

## Características:
- Diseño responsive y fluido.
- Optimización de caché y Lazy Loading para las 50 imágenes.
- Enlaces SVG a redes sociales.

## ¿Cómo ejecutar el proyecto?

1. Clona este repositorio o descarga el archivo ZIP.
2. Abre una terminal (Git Bash o PowerShell) en la raíz del proyecto.
3. Ejecuta el siguiente comando para construir y levantar el contenedor:

\`\`\`bash
docker-compose down --remove-orphans; docker-compose up --build -d
\`\`\`

4. Abre tu navegador y entra a: **http://localhost:8080**
