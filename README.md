# cbt-llm-kit

Guided Cognitive Behavioral Therapy (CBT) thought records for any AI assistant. Clone, open with your preferred AI, and start recording.

## Features

- **12-step thought records** — structured flow based on Beck/Burns CBT model
- **Daily check-in** — reflect on the day's records and identify patterns
- **Pattern analysis** — track cognitive distortions, emotions, and safety behaviors over time
- **13 cognitive distortions** with descriptions and examples
- **19 emotions** and **14 physical sensations** for precise tracking
- **Core belief identification** across helplessness, unlovability, and worthlessness categories

## Install

```bash
curl -sL https://raw.githubusercontent.com/arktnld/cbt-llm-kit/main/install.sh | bash
```

The installer asks which AI you use (Claude Code, Gemini CLI, or Cursor) and sets up the commands in the current project directory.

## Commands

### `/cbt:record`

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

### `/cbt:checkin`

Daily reflection after completing your records. Reviews patterns from the day.

### `/cbt:analyze`

Analyze patterns across all records over time. Identifies frequent distortions, emotion trends, recurring safety behaviors, and emerging core beliefs.

## Data Files

- `data/schema.json` — record structure with all valid field values
- `data/questions.json` — 12-step record flow + 3-step check-in
- `data/cheat-sheet.md` — complete CBT reference guide

## Privacy

All records are stored locally in `records/`. No data is sent to external services.

## Acknowledgments

Inspired by [spec-kit](https://github.com/spec-kit/spec-kit) and its approach to AI-agent-agnostic tooling.

## License

MIT
