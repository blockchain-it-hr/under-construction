FROM node:10 as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .

FROM node:10
WORKDIR /app
COPY --from=builder /app/package.json .
COPY --from=builder /app/dist ./dist
RUN npm install serve

CMD ["npm", "run", "serve"]