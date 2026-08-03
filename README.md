# 云轩 PDF 阅读器

> 网页版 PDF 阅读器 · 纯本地运行 · 零服务器上传

一个基于 pdf.js 的纯前端 PDF 阅读器，所有文件在浏览器本地处理，**不会上传到任何服务器**。

## 功能

**阅读** — 单页连续滚动 / 双排对开页一键切换、缩放、全屏、页码跳转  
**工具** — 全文搜索、目录侧栏、上次阅读位置记忆（支持自动跳转）、打印  
**批注** — 选中文字 → 复制或添加批注，黄色高亮 + 气泡，悬停查看/点击编辑  
**个性化** — 暗色/亮色模式、最近打开（10 条）、设置菜单（可隐藏 PDF 内嵌批注）

## 优势

**即开即用** — 无需安装 App，浏览器打开即阅读，Mac / Windows / Linux / iPad 全平台兼容  
**隐私安全** — 所有文件在本地处理，不上传任何数据到服务器  
**开机自启** — 运行一次安装脚本，之后自动启动，跟原生 App 一样方便  
**零配置** — 依赖自动安装，一行命令搞定

## 预览

**亮色模式**

<img src="docs/images/light-mode.png">

**暗色模式**

<img src="docs/images/dark-mode.png">

**双页显示**

<img src="docs/images/two-page-view.png">

**搜索高亮**

<img src="docs/images/search-highlight.png">

**添加批注**

<img src="docs/images/annotation.png">

**批注注释**

<img src="docs/images/annotation-popup.png">

## 快速开始

```bash
git clone https://github.com/renhairong/PDF-Reader.git
cd PDF-Reader
npm install
./install-service.sh          # 开机自启，访问 http://localhost:8137
```

也可双击 `start.command` 手动启动。

## 更新

```bash
git pull
```

拉取最新代码后刷新浏览器即可，无需重启服务。

## 卸载开机自启

```bash
./install-service.sh --remove
```

## 技术栈

pdf.js · 原生 JavaScript 单页 · IndexedDB + localStorage · Python http.server

MIT © mrleocc
