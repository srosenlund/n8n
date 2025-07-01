#!/bin/bash
set -e

echo "🔧 Enabling Corepack and setting pnpm version..."
corepack enable
corepack prepare pnpm@8.15.0 --activate

echo "🔄 Installing dependencies with frozen lockfile..."
pnpm install --frozen-lockfile

echo "🏗️ Running monorepo build..."
pnpm run build

echo "✅ Build script completed successfully."
