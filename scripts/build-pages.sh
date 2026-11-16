#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
cp -R "$root/app" "$root/lib" "$root/public" "$root/tsconfig.json" "$root/package.json" "$tmp/"
rm -rf "$tmp/app/api"
ln -s "$root/node_modules" "$tmp/node_modules"
cat > "$tmp/next.config.mjs" <<'CONFIG'
export default {output:'export',basePath:'/ManuscriptPilot', images:{unoptimized:true}};
CONFIG
(cd "$tmp" && NEXT_PUBLIC_STATIC_DEMO=1 "$root/node_modules/.bin/next" build --webpack)
rm -rf "$root/out"
cp -R "$tmp/out" "$root/out"
touch "$root/out/.nojekyll"
