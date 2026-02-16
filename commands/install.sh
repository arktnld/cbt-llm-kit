#!/bin/bash
set -e

REPO="https://github.com/arktnld/cbt-llm-kit.git"
TMP_DIR=$(mktemp -d)

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

echo ""
echo "  Which language?"
echo ""
echo "    1) English"
echo "    2) Portugues (BR)"
echo ""
printf "  Choose [1-2]: "
read -r lang_choice </dev/tty

case $lang_choice in
  2) lang="pt-br" ;;
  *) lang="en" ;;
esac

# Download to temp
echo ""
echo "  Downloading..."
git clone --quiet "$REPO" "$TMP_DIR"

# Copy data files to current directory
cp -r "$TMP_DIR/data" .
mkdir -p records

# Save language preference
echo "$lang" > data/language

install_gemini_command() {
  local dir="$1"
  local name="$2"
  local src="$TMP_DIR/commands/$name.md"

  mkdir -p "$dir"

  local desc
  desc=$(sed -n 's/^description: *"\(.*\)"/\1/p' "$src")

  local body
  body=$(sed '1,/^---$/d; 1,/^---$/d' "$src" | sed "s|\\\$ARGUMENTS|{{args}}|g")

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
    mkdir -p "$CMD_DIR"
    for cmd in record checkin analyze; do
      cp "$TMP_DIR/commands/$cmd.md" "$CMD_DIR/$cmd.md"
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
    mkdir -p "$CMD_DIR"
    for cmd in record checkin analyze; do
      cp "$TMP_DIR/commands/$cmd.md" "$CMD_DIR/$cmd.md"
    done
    ;;
  *)
    echo "  Invalid choice"
    rm -rf "$TMP_DIR"
    exit 1
    ;;
esac

rm -rf "$TMP_DIR"

echo ""
echo "  Done! Installed in $(pwd)"
echo ""
echo "  Usage:"
echo "    /cbt:record   - Create a new thought record"
echo "    /cbt:checkin  - Daily reflection"
echo "    /cbt:analyze  - Analyze patterns over time"
echo ""
echo "  Records saved in: records/"
echo ""
