# Frontend - Persona C
FROM nginx:alpine

RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY public/ /usr/share/nginx/html/

# para que corra sin root
RUN chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx
USER nginx

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
