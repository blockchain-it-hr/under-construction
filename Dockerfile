FROM node:10 as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM node:10
WORKDIR /app
COPY --from=builder /app/package.json .
COPY --from=builder /app/dist ./dist
RUN npm install serve

CMD ["npm", "run", "serve"]