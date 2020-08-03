FROM node:alpine
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
CMD ["npm", "run", "start"]

# start new phase - lose anything not copied
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html