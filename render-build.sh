#!/bin/bash
set -e

echo "🔧 Forcing Node 20.19.1..."
export PATH="/opt/render/project/.nodebrew/node/v20.19.1/bin:$PATH"
node -v

echo "🔧 Enabling Corepack and setting pnpm version..."
corepack enable
corepack prepare pnpm@8.15.0 --activate

echo "🔄 Installing dependencies with frozen lockfile..."
pnpm install --frozen-lockfile

echo "🏗️ Running monorepo build with increased Node memory..."
export NODE_OPTIONS="--max_old_space_size=2048"
pnpm run build

echo "✅ Build script completed successfully."
