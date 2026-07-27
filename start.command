#!/bin/bash
cd "$(dirname "$0")"
echo "正在启动 PDF 阅读器服务器..."
python3 -m http.server 8137 &
sleep 1
open http://localhost:8137
echo "服务已启动，浏览器已打开。按 Control+C 停止服务。"
wait
