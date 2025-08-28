
syntax=docker/dockerfile:1

FROM node:20-bullseye AS deps
WORKDIR /app
COPY package.json ./
RUN npm i --no-audit --no-fund

FROM node:20-bullseye AS build
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npx --yes tailwindcss -i ./src/styles/globals.css -o ./public/build.css || true
RUN npm run build

FROM node:20-bullseye AS runner
WORKDIR /app
ENV NODE_ENV=production
COPY --from=build /app ./
EXPOSE 3010
CMD ["npm","run","start"]