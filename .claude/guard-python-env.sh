cmd=$(jq -r '.tool_input.command // ""')
blocked=""
if printf '%s' "$cmd" | grep -qE '(^|[;&|(]|&&|\|\|)[[:space:]]*(sudo[[:space:]]+)?(python[0-9.]*[[:space:]]+-m[[:space:]]+venv|virtualenv([[:space:]]|$)|uv[[:space:]]+(venv|sync|add|remove|lock)|conda[[:space:]]+(create|install|remove|env|activate|deactivate)|poetry[[:space:]]+(install|add|remove|env|lock)|pyenv[[:space:]]+(install|global|local|virtualenv))'; then
  blocked="creates or mutates a Python environment"
fi
if printf '%s' "$cmd" | grep -qE '(^|[;&|(]|&&|\|\|)[[:space:]]*(sudo[[:space:]]+)?(pip[0-9]*[[:space:]]+(install|uninstall)|python[0-9.]*[[:space:]]+-m[[:space:]]+pip[[:space:]]+(install|uninstall)|uv[[:space:]]+pip[[:space:]]+(install|uninstall))' \
   && ! printf '%s' "$cmd" | grep -qE '(^|[[:space:]/])\.venv/bin/(pip|python)'; then
  blocked="installs packages outside the project .venv"
fi
if printf '%s' "$cmd" | grep -qE '(^|[;&|(]|&&|\|\|)[[:space:]]*(sudo[[:space:]]+)?rm[[:space:]]+(-[a-zA-Z]+[[:space:]]+)*[^;|&]*\.venv'; then
  blocked="deletes the project .venv"
fi
if [ -n "$blocked" ]; then
  jq -nc --arg r "Blocked: this command $blocked. This project pins its own .venv; environment changes require explicit user instruction. Ask the user before proceeding." \
    '{hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"deny",permissionDecisionReason:$r}}'
fi
exit 0
