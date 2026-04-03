# CommunityOS-Lite

Simple Telegram Bot management with LLM and knowledge base.

## ⚠️ Security Warnings

**⚠️ LOCAL ONLY - 绑定到 127.0.0.1，不要暴露到公网**

**⚠️ NO AUTHENTICATION - Admin UI 无认证，仅本地使用**

## Required Environment Variables

```bash
# Telegram Bot Token (from @BotFather)
TELEGRAM_BOT_TOKEN_XXX=your_bot_token

# LLM API Keys (at least one required)
MINIMAX_API_KEY=your_minimax_key     # Recommended - has free tier
OPENAI_API_KEY=your_openai_key
ANTHROPIC_API_KEY=your_anthropic_key
DEEPSEEK_API_KEY=your_deepseek_key
```

## Features

- 🤖 **Bot Management** - Create, edit, delete Telegram bots
- 🔑 **Global LLM Config** - Unified LLM settings (MiniMax, OpenAI, Anthropic, DeepSeek)
- 📚 **Text Knowledge Base** - Paste text directly, bot answers within knowledge scope
- 💬 **Auto Reply** - Bot auto-replies in groups without group config
- 🔒 **DM Control** - Toggle Allow DM to control private chat

## Quick Start

```bash
cd ~/.openclaw/workspace/skills/communityOS-Lite

# Create venv
python -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Configure environment
cp .env.example .env
# Edit .env with your API keys

# Run (binds to 127.0.0.1 only)
python admin/app.py
```

Visit: http://127.0.0.1:8877/lite

## Security Notes

1. **Local Only** - Server binds to 127.0.0.1, not exposed to internet
2. **No Built-in Auth** - Admin UI has no authentication
3. **Credentials Required** - Needs Telegram bot tokens and LLM API keys
4. **Outbound Network** - Makes calls to Telegram API and LLM providers
5. **Use Throwaway Keys** - For testing, use separate API keys

## Architecture

- `admin/app.py` - FastAPI backend (no external dependencies)
- `admin/lite.html` - Simple UI
- `bot_engine/` - Bot runtime (self-contained)
- `config/` - Configuration files

**Note:** The `harness` module is NOT required for Lite version.
