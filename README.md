# Tacit Knowledge (Polanyi) Skill for Codex

A Chinese-first Codex skill for explaining, comparing, and applying Michael Polanyi's concept of tacit knowledge across management, education, research, product work, and AI discussion.

## Overview

This repository contains one installable Codex skill:

- `tacit-knowledge-polanyi`

The skill is designed for tasks such as:

- explaining tacit knowledge, explicit knowledge, and related terminology
- comparing tacit and explicit knowledge in a compact, practical way
- analyzing apprenticeship, skill transfer, organizational learning, and expert judgment
- applying a Polanyi lens to management, teaching, product design, research, and AI
- generating Chinese-first teaching prompts, discussion questions, and case-analysis structures

## Why This Skill Exists

Polanyi's idea is often referenced, but practical explanations are usually either too abstract or too shallow. This skill aims to bridge that gap:

- conceptually precise enough for theory discussion
- practical enough for management and training use
- optimized for Chinese-language prompting by default

## Repository Layout

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

## Installation

### Install from GitHub

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo luckysam777/tacit-knowledge-polanyi-skill \
  --path tacit-knowledge-polanyi
```

Restart Codex after installation so the skill can be discovered.

### Manual Installation

Copy the `tacit-knowledge-polanyi/` directory into:

```text
~/.codex/skills/
```

The final structure should look like:

```text
~/.codex/skills/tacit-knowledge-polanyi/SKILL.md
```

Then restart Codex.

## Example Prompts

```text
Use $tacit-knowledge-polanyi to explain the difference between tacit knowledge and explicit knowledge.
```

```text
Use $tacit-knowledge-polanyi to analyze whether AI can be said to possess tacit knowledge.
```

```text
Use $tacit-knowledge-polanyi to break down a knowledge-transfer problem inside a company.
```

```text
用 $tacit-knowledge-polanyi 解释默会知识和显性知识的区别。
```

## Skill Characteristics

- Chinese-first by default
- structured for both conceptual explanation and practical application
- avoids reducing tacit knowledge to "undocumented information"
- treats tacit and explicit knowledge as complementary rather than mutually exclusive

## Intended Audience

- educators and trainers
- managers working on capability transfer
- researchers or students reading Polanyi
- product and engineering teams discussing expertise and judgment
- AI practitioners exploring the limits of codification

## Open Source License

This repository is released under the MIT License.

## 中文说明

这是一个面向 Codex 的中文优先 skill，用来解释和应用波兰尼的“默会知识”理论。仓库里已经包含可直接安装的 skill 目录，适合管理、教育、产品、研究、AI 等场景。安装后重启 Codex 即可使用。
