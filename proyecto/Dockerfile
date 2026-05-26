# Usamos la versión Alpine de Nginx por ser ultra ligera y segura
FROM nginx:alpine

# Metadata para darle nivel al proyecto
LABEL maintainer="tu-usuario-github"
LABEL version="1.0"

# Copiar el archivo de configuración personalizado de Nginx (para compresión y caché)
# Nginx por defecto ya sabe cómo manejar archivos estáticos, pero esto suma puntos:
RUN echo 'server { \
    listen 80; \
    server_name localhost; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html; \
        try_files $uri $uri/ =404; \
    } \
    # Configuración de caché para que las 50 imágenes carguen rápido \
    location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ { \
        root /usr/share/nginx/html; \
        expires 7d; \
        add_header Cache-Control "public, no-transform"; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Copiar los archivos de la web y las imágenes al directorio de Nginx
COPY . /usr/share/nginx/html

# Asegurar permisos correctos para que Nginx pueda leer las fotos
RUN chmod -R 755 /usr/share/nginx/html

# Exponer el puerto estándar HTTP
EXPOSE 80

# HEALTHCHECK: Comprueba que Nginx realmente está levantado y sirviendo la página
HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:80/ || exit 1