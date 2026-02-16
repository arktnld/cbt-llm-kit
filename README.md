<div align="center">
    <h1>cbt-llm-kit</h1>
    <h3><em>Guided CBT thought records for any AI assistant.</em></h3>
</div>

<p align="center">
    <strong>A structured Cognitive Behavioral Therapy toolkit that turns your AI assistant into a guided thought record companion. 12-step records, daily check-ins, and pattern analysis — all stored locally.</strong>
</p>

<p align="center">
    <a href="https://github.com/arktnld/cbt-llm-kit/blob/main/LICENSE"><img src="https://img.shields.io/github/license/arktnld/cbt-llm-kit" alt="License"/></a>
    <a href="https://github.com/arktnld/cbt-llm-kit/stargazers"><img src="https://img.shields.io/github/stars/arktnld/cbt-llm-kit?style=social" alt="GitHub stars"/></a>
</p>

---

## What is cbt-llm-kit?

cbt-llm-kit provides structured CBT (Cognitive Behavioral Therapy) thought recording through your AI assistant. Based on the Beck/Burns cognitive model, it guides you through identifying automatic thoughts, examining evidence, recognizing cognitive distortions, and building alternative perspectives.

Your AI reads the schema, questions, and cheat sheet — then walks you through each step, one question at a time. Records are saved as local JSON files for privacy.

## Get Started

### 1. Install

Run the installer from any project directory where you want the commands available:

```bash
curl -sL https://raw.githubusercontent.com/arktnld/cbt-llm-kit/main/install.sh | bash
```

The installer will ask which AI you use, then set up `data/`, `records/`, and the slash commands in your current directory.

### 2. Create a thought record

Open your AI assistant in the project and run:

```
/cbt:record
```

The AI will guide you through all 12 steps:

```
AI: What happened? Where, when, and with whom?

You: I was at the grocery store. The security guard kept watching me
     and the cashier acted strange.

AI: What went through your mind at that moment?

You: It's my fault — as if I had done something wrong.

AI: What did you feel? Which emotion and what intensity from 0 to 100%?

You: Discomfort at 50, rejection at 70.

...continues through all 12 steps...
```

### 3. Daily check-in

After recording one or more situations, reflect on the day:

```
/cbt:checkin
```

The AI reads your records, summarizes them, and walks you through identifying patterns — common distortions, recurring emotions, and safety behaviors.

### 4. Analyze patterns over time

After several days of recording:

```
/cbt:analyze
```

The AI reads all your records and identifies trends: most frequent distortions, how emotion intensity changes over time, recurring safety behaviors, and emerging core beliefs.

## Supported AI Assistants

| Assistant | Support | Command Format |
|-----------|---------|----------------|
| [Claude Code](https://www.anthropic.com/claude-code) | ✅ | `/cbt:record` |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | ✅ | `/cbt_record` |
| [Cursor](https://cursor.sh/) | ✅ | `/cbt:record` |

More AI assistants coming soon.

## The 12-Step Record Flow

Each thought record follows this structured sequence:

| Step | Field | Question |
|------|-------|----------|
| 1 | Situation | What happened? Where, when, and with whom? |
| 2 | Automatic thought | What went through your mind? |
| 3 | Emotions (before) | What did you feel? Intensity 0-100% |
| 4 | Physical sensations | What did your body feel? |
| 5 | Behavior | What did you do at the time? |
| 6 | Evidence for | What supports this thought? |
| 7 | Evidence against | What contradicts this thought? |
| 8 | Alternative thought | A more balanced way to see it? |
| 9 | Safety behavior | Anything you do to avoid anxiety? |
| 10 | Cognitive distortions | Which distortion is present? |
| 11 | Core beliefs | Deeper belief about yourself? |
| 12 | Emotions (after) | How do the emotions feel now? |

## 13 Cognitive Distortions

The schema includes all 13 Beck/Burns cognitive distortions:

| # | Distortion | Example |
|---|-----------|---------|
| 1 | Mind reading | "He looked at me because he suspects me" |
| 2 | Personalization | "It's my fault" |
| 3 | Catastrophizing | "Everything will go wrong" |
| 4 | Selective abstraction | "One person criticized, so it was bad" |
| 5 | Arbitrary inference | "Nobody called, they don't like me" |
| 6 | Overgeneralization | "I failed once, I always fail" |
| 7 | Magnification/minimization | "My mistake was huge, my success was luck" |
| 8 | All-or-nothing thinking | "If it's not perfect, it's a failure" |
| 9 | Fortune telling | "The interview will be a disaster" |
| 10 | Emotional reasoning | "I feel like a failure, so I am one" |
| 11 | Labeling | "I'm useless" |
| 12 | Should statements | "I should be stronger" |
| 13 | Disqualifying the positive | "I passed, but it was luck" |

## Data Files

| File | Description |
|------|-------------|
| `data/schema.json` | Record structure with all valid field values — 13 distortions, 19 emotions, 14 physical sensations, 3 core belief categories |
| `data/questions.json` | 12-step record flow + 3-step daily check-in |
| `data/cheat-sheet.md` | Complete CBT reference — cognitive model, distortions table, questioning techniques, exposure hierarchy |

## Privacy

All records are stored locally in `records/`. No data is sent to external services.

## Acknowledgments

Inspired by [spec-kit](https://github.com/spec-kit/spec-kit) and its approach to AI-agent-agnostic tooling.

## License

This project is licensed under the terms of the MIT open source license. See [LICENSE](./LICENSE) for details.
