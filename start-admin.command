#!/bin/zsh
# CommunityOS Lite 启动（双击或终端 ./start-admin.command）
# 使用脚本所在目录为项目根，优先 venv 里的 Python

DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR" || exit 1

if [[ -x "$DIR/venv/bin/python" ]]; then
  PY="$DIR/venv/bin/python"
else
  PY=python3
fi

pkill -f "$DIR.*admin/app.py" 2>/dev/null
find admin/ bot_engine/ -name "__pycache__" -exec rm -rf {} + 2>/dev/null

"$PY" admin/app.py > /tmp/communityos-lite-admin.log 2>&1 &

echo "✅ Lite 启动中..."
sleep 2

if curl -s --max-time 3 http://127.0.0.1:8877/api/health > /dev/null 2>&1; then
  echo "✅ http://127.0.0.1:8877/lite"
  open http://127.0.0.1:8877/lite 2>/dev/null
else
  echo "❌ 启动失败，日志：/tmp/communityos-lite-admin.log"
  tail -20 /tmp/communityos-lite-admin.log
fi
