# CommunityOS Telegram Bot

Simple Telegram Bot management with LLM and knowledge base.

## Features

- 🤖 **Bot Management** - Create, edit, delete Telegram bots
- 🔑 **Global LLM Config** - Unified LLM settings for all bots
- 📚 **Text Knowledge Base** - Paste text directly, bot answers within scope
- 💬 **Auto Reply** - Bot auto-replies in groups without group config
- 🔒 **DM Control** - Toggle Allow DM to control private chat

## Quick Start

```bash
# Clone
git clone https://github.com/pandarey0130-lab/communityOS-Lite.git
cd communityOS-Lite

# Install
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Configure
cp .env.example .env
# Edit .env with your tokens (optional if you set keys in Lite UI)
# LLM key for Lite UI is stored in admin/data/llm_config.json (gitignored).
# First run: copy admin/data/llm_config.example.json to admin/data/llm_config.json, then set api_key in the UI or file — never commit real keys.

# Run (project root must be on PYTHONPATH for package imports)
PYTHONPATH=. python admin/app.py
```

Visit: http://127.0.0.1:8877/lite

## How to Use

1. Go to **@BotFather** in Telegram → Create new bot → Copy token
2. Paste token in Lite UI → Click Save
3. Configure **LLM** in Lite (API key + provider) → Save
4. (Optional) Paste knowledge text → Bot answers only within this scope
5. **If you use the bot in a group — Telegram Bot Privacy:** New bots default to **Privacy mode ON**. In groups, Telegram only delivers **commands** (`/...`) or messages that **@mention your bot**. For normal group messages to reach the bot (so auto-reply works on plain chat), open **@BotFather** → **/mybots** → select your bot → **Bot Settings** → **Group Privacy** → **Turn off** (Disable).
6. Invite bot to Telegram group → **Done!**
7. Chat in group (or DM) → Bot replies when it receives your text

## LLM Providers

| Provider | Default Model | Notes |
|----------|---------------|-------|
| MiniMax | MiniMax-2.7 | Free tier available |
| OpenAI | GPT-4o | Paid |
| Anthropic | Claude 3.5 Sonnet | Paid |
| DeepSeek | DeepSeek Chat | Cheap |

## Architecture

```
admin/
  app.py      - FastAPI backend
  lite.html   - Simple UI
bot_engine/
  manager.py  - Bot instance manager
  bot_instance.py - Individual bot logic
  llm/        - LLM provider implementations
admin/data/
  bots.json, llm_config.json - Runtime config (fill via Lite UI; not committed with secrets)
```

## License

MIT
