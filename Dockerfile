FROM node:18-slim AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci  # Installed in a clean Linux environment

FROM node:18-slim
WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY . . 
EXPOSE 3000
CMD ["node", "index.js"]