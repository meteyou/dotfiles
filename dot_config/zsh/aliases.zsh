# ── Modern replacements ────────────────────────────────────────────────────
if command -v eza &>/dev/null; then
  alias ls="eza --icons=auto"
  alias ll="eza -la --icons=auto --git --group-directories-first"
  alias lt="eza --tree --icons=auto --level=2"
  alias la="eza -a --icons=auto"
else
  alias ll="ls -lah"
  alias la="ls -A"
fi

if command -v bat &>/dev/null; then
  alias cat="bat --paging=never"
  alias catp="bat --plain --paging=never"
fi

if command -v zoxide &>/dev/null; then
  alias cd="z"
fi

# ── Navigation ─────────────────────────────────────────────────────────────
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# ── Git ────────────────────────────────────────────────────────────────────
alias g="git"
alias gs="git status -sb"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gl="git log --oneline --graph --decorate -20"
alias gd="git diff"
alias gds="git diff --staged"
alias gco="git checkout"
alias gsw="git switch"
alias gb="git branch"
alias gpl="git pull --rebase"

# ── Laravel Sail ───────────────────────────────────────────────────────────
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

# ── Safety nets ────────────────────────────────────────────────────────────
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# ── Convenience ────────────────────────────────────────────────────────────
alias reload="exec zsh"
alias cls="clear"
alias grep="grep --color=auto"
alias df="df -h"
alias du="du -h"
alias mkdir="mkdir -pv"

# ── pi (force system Node.js) ─────────────────────────────────────────────
alias pi="/opt/homebrew/bin/node /opt/homebrew/bin/pi"

# ── chezmoi shortcuts ─────────────────────────────────────────────────────
alias cz="chezmoi"
alias cze="chezmoi edit"
alias cza="chezmoi apply"
alias czd="chezmoi diff"
