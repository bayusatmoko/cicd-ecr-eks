# FROM node:17.7-alpine3.14

# WORKDIR /usr/src/app

# COPY package*.json ./

# RUN npm install

# COPY . .

# EXPOSE 8000

# CMD ["npm","start"]

FROM node:16-bullseye-slim
RUN mkdir /app && chown -R node:node /app
WORKDIR /app
USER node
COPY --chown=node:node . /app
RUN npm ci --only=production && npm cache clean --force
EXPOSE 8000
CMD ["node", "index.js"]


