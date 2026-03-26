FROM node:18

WORKDIR /app

# Copy only build folder
COPY build/ .

RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html