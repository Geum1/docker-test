#Builder Stage

FROM node:alpine as Builder

WORKDIR '/usr/src/app'

COPY package.json ./

RUN npm install

COPY ./ ./

CMD [ "npm", "run", "build" ]

FROM nginx

COPY --from=builder /usr/src/app/build /user/shar/nginx/html