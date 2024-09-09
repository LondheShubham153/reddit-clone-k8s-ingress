# Stage 1: Build
FROM node:19-alpine as build

WORKDIR /reddit-clone

COPY package*.json ./
RUN npm install
RUN npm install && \
    npm prune --production && \
    npm cache clean --force


COPY . .

# Stage 2: Production Image
FROM node:19-alpine

WORKDIR /reddit-clone

COPY --from=build /reddit-clone /reddit-clone

EXPOSE 3000
CMD ["npm", "run", "dev"]

