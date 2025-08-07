# Only needed for multi-service setup
FROM docker.io/nginxinc/nginx-unprivileged:latest
RUN rm -rf /etc/nginx/nginx.conf /etc/nginx/conf.d
COPY nginx.conf /etc/nginx/nginx.conf
