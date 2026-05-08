#!/bin/sh
# Render can't reference RENDER_EXTERNAL_URL inside render.yaml envVars, so set it here.
set -eu
cd /directus
export PUBLIC_URL="${PUBLIC_URL:-$RENDER_EXTERNAL_URL}"
node cli.js bootstrap
exec pm2-runtime start ecosystem.config.cjs
