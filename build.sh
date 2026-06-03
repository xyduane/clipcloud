#!/bin/bash
# 本地构建：读取 .env 生成 dist/index.html
set -e
cd "$(dirname "$0")"

if [ ! -f .env ]; then
  echo "错误: 未找到 .env 文件，请复制 .env.example 为 .env 并填入真实值"
  exit 1
fi

source .env

mkdir -p dist
sed "s|__SUPABASE_URL__|${SUPABASE_URL}|g; s|__SUPABASE_KEY__|${SUPABASE_KEY}|g" \
  index.html > dist/index.html

echo "已生成 dist/index.html"
