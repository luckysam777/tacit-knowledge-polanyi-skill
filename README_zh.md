# 波兰尼默会知识 Skill

这是一个面向 Codex 的中文优先 skill，用来解释、比较和应用 Michael Polanyi 的“默会知识”理论。

## 适用场景

这个 skill 适合下面这些任务：

- 解释“默会知识”“缄默知识”“隐性知识”“显性知识”
- 比较 tacit knowledge 和 explicit knowledge
- 分析学徒制、技能传承、组织学习、经验判断
- 将波兰尼视角应用到管理、教育、产品、研究、AI
- 生成课堂讨论题、讲义提纲、案例分析骨架

## 仓库内容

本仓库包含一个可安装的 Codex skill：

- `tacit-knowledge-polanyi/`

目录结构如下：

```text
tacit-knowledge-polanyi-skill/
  README.md
  README_zh.md
  LICENSE
  tacit-knowledge-polanyi/
    SKILL.md
    agents/
      openai.yaml
    references/
      polanyi-notes.md
```

## 安装方式

### 从 GitHub 安装

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo luckysam777/tacit-knowledge-polanyi-skill \
  --path tacit-knowledge-polanyi
```

安装后重启 Codex。

### 手动安装

把 `tacit-knowledge-polanyi/` 目录复制到：

```text
~/.codex/skills/
```

最终路径应该是：

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

## 这个 skill 的特点

- 中文优先
- 同时兼顾理论解释和实践应用
- 不把默会知识简化成“没写下来的知识”
- 强调默会知识与显性知识的互补关系

## 适合谁用

- 教师、培训师
- 关注能力传承的管理者
- 阅读波兰尼的研究者和学生
- 讨论专业判断与经验知识的产品和工程团队
- 研究 AI 与知识形式问题的人

## 开源协议

本仓库采用 MIT License。
