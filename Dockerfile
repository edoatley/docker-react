FROM node:alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# start new phase - lose anything not copied
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html