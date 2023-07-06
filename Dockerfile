

FROM node:latest as node
ARG WORK_DIR/frontend
ENV PATH ${WORK_DIR}/node_modules/.bin:$PATH
RUN mkdir ${WORK_DIR}
WORKDIR ${WORK_DIR}
COPY package.json ${WORK_DIR}
COPY package-lock.json ${WORK_DIR}
RUN npm install @angular/cli
RUN npm install
RUN npm run build --prod
COPY . ${WORK_DIR}
EXPOSE 4200
CMD ng serve --host 0.0.0.0



# stage 1
# FROM node:latest as node
# WORKDIR /app
# COPY . .
# RUN npm install
# RUN npm run build --prod

# stage 2
# FROM nginx:alpine
# COPY --from=node /app/dist/docker-demo /usr/share/nginx/html


