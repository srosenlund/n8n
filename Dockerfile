FROM node:20.19.1

WORKDIR /app

RUN corepack enable && corepack prepare pnpm@8.15.0 --activate

COPY . .

RUN pnpm install --frozen-lockfile

RUN pnpm run build

ENV PORT=5678
EXPOSE 5678

CMD ["node", "packages/cli/bin/n8n"]
