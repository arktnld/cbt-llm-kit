#!/bin/bash
set -e

CBT_HOME="$HOME/.cbt-llm-kit"
REPO="https://github.com/arktnld/cbt-llm-kit.git"

echo ""
echo "  cbt-llm-kit"
echo "  Guided CBT thought records for any AI assistant"
echo ""
echo "  Which AI do you use?"
echo ""
echo "    1) Claude Code"
echo "    2) Gemini CLI"
echo "    3) Cursor"
echo ""
printf "  Choose [1-3]: "
read -r choice </dev/tty

# Download data files
if [ -d "$CBT_HOME" ]; then
  echo ""
  echo "  Updating..."
  git -C "$CBT_HOME" pull origin main --quiet
else
  echo ""
  echo "  Downloading..."
  git clone --quiet "$REPO" "$CBT_HOME"
fi

mkdir -p "$CBT_HOME/records"

install_command() {
  local dir="$1"
  local name="$2"
  local src="$CBT_HOME/commands/$name.md"

  mkdir -p "$dir"
  sed "s|data/|$CBT_HOME/data/|g; s|records/|$CBT_HOME/records/|g" "$src" > "$dir/$name.md"
}

install_gemini_command() {
  local dir="$1"
  local name="$2"
  local src="$CBT_HOME/commands/$name.md"

  mkdir -p "$dir"

  local desc
  desc=$(sed -n 's/^description: *"\(.*\)"/\1/p' "$src")

  local body
  body=$(sed '1,/^---$/d; 1,/^---$/d' "$src" | sed "s|data/|$CBT_HOME/data/|g; s|records/|$CBT_HOME/records/|g; s|\\\$ARGUMENTS|{{args}}|g")

  cat > "$dir/cbt_$name.toml" <<TOMLEOF
[command]
description = "$desc"

[command.prompt]
content = """
$body
"""
TOMLEOF
}

case $choice in
  1)
    CMD_DIR=".claude/commands/cbt"
    for cmd in record checkin analyze; do
      install_command "$CMD_DIR" "$cmd"
    done
    ;;
  2)
    CMD_DIR=".gemini/commands"
    for cmd in record checkin analyze; do
      install_gemini_command "$CMD_DIR" "$cmd"
    done
    ;;
  3)
    CMD_DIR=".cursor/commands/cbt"
    for cmd in record checkin analyze; do
      install_command "$CMD_DIR" "$cmd"
    done
    ;;
  *)
    echo "  Invalid choice"
    exit 1
    ;;
esac

echo ""
echo "  Done! Commands installed to $CMD_DIR"
echo ""
echo "  Usage:"
echo "    /cbt:record   - Create a new thought record"
echo "    /cbt:checkin  - Daily reflection"
echo "    /cbt:analyze  - Analyze patterns over time"
echo ""
echo "  Records saved in: $CBT_HOME/records/"
echo ""
