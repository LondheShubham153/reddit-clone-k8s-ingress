# Stage 1: Build the application
FROM node:19-alpine3.15 AS builder

WORKDIR /reddit-clone

COPY package.json package-lock.json ./

COPY . .

# Stage 2: Create a smaller production image
FROM node:19-alpine3.15

WORKDIR /reddit-clone

COPY --from=builder /reddit-clone /reddit-clone

EXPOSE 3000
CMD ["npm", "run", "dev"]

