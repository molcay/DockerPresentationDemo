# Step 1: Build
FROM node:8-alpine AS builder

# Copy package manager files for dependency installation
COPY ./package.json ./package-lock.json /usr/src/app/

# Change working directory in container
WORKDIR /usr/src/app

# Install dependencies
RUN npm install

# COPY source code
COPY ./ /usr/src/app

# Build UI
RUN npm run build

# Step 2:
FROM nginx

COPY --from=builder /usr/src/app/build /usr/share/nginx/html
