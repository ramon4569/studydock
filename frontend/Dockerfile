# Frontend de StudyDock: nginx sirviendo los archivos estáticos en el puerto 8080
# Responsable: Persona C · Frontend/Docs · Semana 1
FROM nginx:alpine

# Se reemplaza la config principal por la nuestra (puerto 8080, pid y temporales en /tmp)
RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY public/ /usr/share/nginx/html/

# El usuario nginx ya existe en la imagen; le damos permisos sobre lo que necesita
RUN chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx

USER nginx
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
