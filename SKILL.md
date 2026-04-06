# CommunityOS-Lite

面向 **Cursor Agent** 的完整说明已迁移至：

**[`.cursor/skills/community-os-lite/SKILL.md`](.cursor/skills/community-os-lite/SKILL.md)**

（含 YAML frontmatter、`name: community-os-lite`、触发词、准确端口 `127.0.0.1:8877`、数据路径与排错。）

以下仅作人类速查。

## 安全

- 仅本地使用；`/lite` 当前无认证，勿暴露到公网。

## 一键运行

```bash
pip install -r requirements.txt
cp .env.example .env
PYTHONPATH=. python admin/app.py
```

打开：http://127.0.0.1:8877/lite
