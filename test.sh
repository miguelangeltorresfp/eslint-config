#!/usr/bin/env bash

set -e

PROJECT=$1
CONFIG=$2

cd packages/"$CONFIG"
yarn link

cd /tmp
git clone https://github.com/NiGhTTraX/"$PROJECT".git
cd "$PROJECT"

yarn i --silent
yarn link @nighttrax/eslint-config-"$CONFIG"
yarn run lint
