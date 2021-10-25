FROM registry1.dso.mil/ironbank/opensource/nodejs/nodejs16:16.5.0 AS builder
# FROM node AS builder

USER node

WORKDIR /home/node
COPY --chown=node:node . .
RUN yarn install --frozen-lockfile
RUN yarn build

# Stage 2
# FROM registry.il2.dso.mil/platform-one/devops/pipeline-templates/base-image/harden-nginx-20:1.20.1
# USER appuser
# COPY --from=builder --chown=appuser:appuser /home/node/build /var/www

FROM registry1.dso.mil/ironbank/opensource/nginx/nginx:1.21.1
USER nginx
COPY --from=builder --chown=nginx:nginx /home/node/build /etc/nginx/html

# FROM nginx
# COPY --from=builder --chown=nginx:nginx /home/node/build /usr/share/nginx/html
# EXPOSE 80

EXPOSE 8080

ENTRYPOINT [ "nginx",  "-g", "daemon off;" ]
