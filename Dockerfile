# ---- builder ----
FROM node:20-alpine AS builder
WORKDIR /app

# pnpm
RUN corepack enable

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

COPY . .
RUN pnpm check
RUN pnpm build

# ---- runtime (distroless) ----
FROM gcr.io/distroless/nodejs20-debian12 AS runtime
WORKDIR /app

# Copy only the bundled output
COPY --from=builder /app/dist ./dist

# Run
CMD ["dist/main.js"]
