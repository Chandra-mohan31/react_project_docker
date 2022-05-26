FROM node:alpine as teamalpha

WORKDIR /var/app

COPY ./package.json ./
# COPY package.json .

RUN npm install

COPY ./ ./
# COPY . .

# CMD [ "npm","run","build" ]

RUN npm run build

# take the build folder and deploy to nginx

FROM nginx

EXPOSE 80

COPY --from=teamalpha /var/app/build /usr/share/nginx/html

