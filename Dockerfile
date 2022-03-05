FROM node:17-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
RUN npm run build

RUN chown -R node /app/node_modules

USER node

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html