# Stage 1 — serve with nginx
FROM nginxinc/nginx-unprivileged:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY concepts/loaddesk/index.html /usr/share/nginx/html/index.html
EXPOSE 8080