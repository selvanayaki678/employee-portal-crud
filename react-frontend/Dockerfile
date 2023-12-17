FROM node:12.13.0
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
EXPOSE 3000
ENTRYPOINT ["npm", "start"] 