FROM node:8-alpine AS builder

COPY ./package.json ./package-lock.json /usr/src/app/

WORKDIR /usr/src/app

RUN npm install

# COPY source code
COPY ./ /usr/src/app

# Build UI
RUN npm run build

# Step 2:
FROM nginx

COPY --from=builder /usr/src/app/build /usr/share/nginx/html
