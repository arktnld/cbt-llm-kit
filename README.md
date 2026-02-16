# cbt-llm-kit

A [spec-kit](https://github.com/spec-kit/spec-kit) extension for guided Cognitive Behavioral Therapy (CBT) thought records.

Works with 16 AI providers: Claude, Gemini, Copilot, Cursor, Qwen, OpenCode, Windsurf, Kilo Code, Auggie, Roo, CodeBuddy, Qoder, Amazon Q, Amp, SHAI, Bob.

## Features

- **12-step thought records** — structured flow based on Beck/Burns CBT model
- **Daily check-in** — reflect on the day's records and identify patterns
- **Pattern analysis** — track cognitive distortions, emotions, and safety behaviors over time
- **13 cognitive distortions** with descriptions and examples
- **19 emotions** and **14 physical sensations** for precise tracking
- **Core belief identification** across helplessness, unlovability, and worthlessness categories

## Installation

```bash
# From catalog
specify extension add cbt

# From local directory (development)
specify extension add --dev /path/to/spec-kit-cbt

# From GitHub
specify extension add https://github.com/arktnld/cbt-llm-kit
```

## Commands

### `/cbt.record`

Create a new thought record. Guides you through all 12 steps:

1. Situation — what happened
2. Automatic thought — what went through your mind
3. Emotions (before) — with intensity 0-100
4. Physical sensations
5. Behavior — what you did
6. Evidence for the thought
7. Evidence against the thought
8. Alternative thought
9. Safety behavior
10. Cognitive distortions
11. Core beliefs
12. Emotions (after) — re-rated intensity

### `/cbt.checkin`

Daily reflection after completing your records. Reviews patterns from the day.

### `/cbt.analyze`

Analyze patterns across all records over time. Identifies frequent distortions, emotion trends, recurring safety behaviors, and emerging core beliefs.

## Configuration

Copy `cbt-config-template.yml` to `cbt-config.yml` and customize:

```yaml
language: "en"        # "en" or "pt-br"
records_path: "records/"
```

## Data Files

- `data/schema.json` — record structure with all valid field values
- `data/questions.json` — 12-step record flow + 3-step check-in
- `data/cheat-sheet.md` — complete CBT reference guide

## Privacy

All records are stored locally in `records/`. No data is sent to external services.
Add `records/*.json` to your `.gitignore` if you don't want records in version control.

## Built with spec-kit

This extension is built on [spec-kit](https://github.com/spec-kit/spec-kit), a framework for creating AI-agent-agnostic development tools. spec-kit handles automatic command conversion across 16 AI providers — you write commands once in markdown, and spec-kit distributes them to Claude, Gemini, Copilot, Cursor, and more.

## License

MIT
