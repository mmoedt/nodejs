#!/bin/bash

npm install -D \
    eslint@^8 \
    eslint-config-prettier@^9 \
    eslint-plugin-react@^7 \
    eslint-plugin-prettier@^5 \
    npm-check-updates@^16 \
    serve@^14 \
    typescript@^4 \
    typescript-eslint@^8

# for package.json

cp -iv package.json package.orig.json

cat package.json | jq '. + { "engines": { "node": ">= 18.15.0 < 19.0.0" } }' | sponge package.json

cat package.json | jq '.scripts += { "lint": "eslint src", "format": "prettier src --write", }' | sponge package.json

