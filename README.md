# tacit-knowledge-polanyi-skill

一个面向 Codex 的中文优先 skill，用来解释、比较和应用 Michael Polanyi 的“默会知识（Tacit Knowledge）”理论。

## 这个仓库包含什么

仓库内提供一个可安装的 Codex skill：

- `tacit-knowledge-polanyi/`

这个 skill 适合这些场景：

- 解释默会知识、缄默知识、隐性知识、显性知识
- 比较 tacit knowledge 与 explicit knowledge
- 分析学徒制、技能传承、组织学习、经验判断
- 把波兰尼理论应用到管理、教育、产品、研究、AI
- 生成中文讨论题、讲解提纲、案例分析框架

## 目录结构

```text
tacit-knowledge-polanyi-skill/
  README.md
  LICENSE
  tacit-knowledge-polanyi/
    SKILL.md
    agents/
      openai.yaml
    references/
      polanyi-notes.md
```

## 安装

### 方式一：从 GitHub 安装

把下面的 `<your-github-name>` 替换成你的 GitHub 用户名：

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo <your-github-name>/tacit-knowledge-polanyi-skill \
  --path tacit-knowledge-polanyi
```

安装完成后，重启 Codex 以加载新 skill。

### 方式二：手动安装

把 `tacit-knowledge-polanyi/` 整个目录复制到：

```text
~/.codex/skills/
```

最终结构应为：

```text
~/.codex/skills/tacit-knowledge-polanyi/SKILL.md
```

然后重启 Codex。

## 使用示例

```text
用 $tacit-knowledge-polanyi 解释默会知识和显性知识的区别
```

```text
用 $tacit-knowledge-polanyi 分析 AI 是否拥有默会知识
```

```text
用 $tacit-knowledge-polanyi 拆解一个企业里的技能传承问题
```

## 设计原则

- 默认中文优先
- 兼顾理论解释和实践应用
- 避免把默会知识简化为“没写文档”
- 强调默会知识与显性知识的互补关系

## 开源协议

本仓库采用 MIT License。
