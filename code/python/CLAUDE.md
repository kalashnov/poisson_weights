## Python environment

**Always use this project's own virtual environment: `./.venv`.**

- Run Python as `./.venv/bin/python`, never bare `python` or `python3`.
- Install packages only as `./.venv/bin/pip install <pkg>`.
- Never create, replace, activate, or delete an environment — no `python -m venv`,
  `virtualenv`, `uv venv`/`uv sync`, `conda`, `poetry`, or `pyenv` — and never
  install into the system or Homebrew Python.
- If a package is missing, or if `.venv` does not exist, **stop and ask.** Do not
  create or repair the environment on your own initiative.

These rules are enforced by a `PreToolUse` hook (`.claude/guard-python-env.sh`)
and by deny rules in `.claude/settings.local.json`. If the user explicitly asks
for an environment change, tell them the guard must be bypassed or amended first —
do not work around it.
