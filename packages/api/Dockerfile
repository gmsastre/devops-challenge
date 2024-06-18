FROM node:18.12.0

WORKDIR /usr/src/app

COPY ../../package.json ../../pnpm-lock.yaml ./

RUN npm install -g pnpm

RUN pnpm install

COPY . .

EXPOSE 3001

CMD ["pnpm", "run", "dev"]
