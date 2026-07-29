#!/bin/bash
# 云轩 PDF 阅读器 — LaunchAgent 安装脚本（基于 python3，无需额外依赖）
# 用法：./install-service.sh            # 安装
#        ./install-service.sh --remove  # 卸载

set -e

SERVICE="com.yunxuan.pdfreader"
PLIST_DIR="$HOME/Library/LaunchAgents"
PLIST_PATH="$PLIST_DIR/$SERVICE.plist"
DIR="$(cd "$(dirname "$0")" && pwd)"

if [ "$1" = "--remove" ]; then
  echo "正在卸载服务..."
  launchctl bootout "gui/$(id -u)" "$PLIST_PATH" 2>/dev/null || true
  rm -f "$PLIST_PATH"
  echo "✅ 已卸载，不再开机自启"
  exit 0
fi

# 确保依赖已安装
if [ ! -f "$DIR/node_modules/pdfjs-dist/build/pdf.worker.mjs" ]; then
  echo "正在安装前端依赖（pdfjs-dist）..."
  npm install --prefix "$DIR" --ignore-scripts --no-audit --no-fund 2>&1 | tail -2
fi

# 生成 plist（替换项目路径占位符）
mkdir -p "$PLIST_DIR"
sed "s|/ABSOLUTE/PATH/TO/PROJECT|$DIR|g" \
    "$DIR/com.yunxuan.pdfreader.plist" > "$PLIST_PATH"

# 卸载旧的（如果有），再加载新服务
launchctl bootout "gui/$(id -u)" "$PLIST_PATH" 2>/dev/null || true
launchctl bootstrap "gui/$(id -u)" "$PLIST_PATH"

echo ""
echo "✅ 云轩 PDF 阅读器已设置为开机自启"
echo "   访问地址：http://localhost:8137"
echo "   日志文件：/tmp/com.yunxuan.pdfreader.log"
echo ""
echo "如需卸载，运行：./install-service.sh --remove"
