# ── Create directory and cd into it ────────────────────────────────────────
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# ── Extract any archive ───────────────────────────────────────────────────
extract() {
  if [[ ! -f "$1" ]]; then
    echo "extract: '$1' is not a valid file" >&2
    return 1
  fi
  case "$1" in
    *.tar.bz2) tar xjf "$1"    ;;
    *.tar.gz)  tar xzf "$1"    ;;
    *.tar.xz)  tar xJf "$1"    ;;
    *.tar.zst) tar --zstd -xf "$1" ;;
    *.bz2)     bunzip2 "$1"    ;;
    *.gz)      gunzip "$1"     ;;
    *.tar)     tar xf "$1"     ;;
    *.tbz2)    tar xjf "$1"    ;;
    *.tgz)     tar xzf "$1"    ;;
    *.zip)     unzip "$1"      ;;
    *.Z)       uncompress "$1" ;;
    *.7z)      7z x "$1"       ;;
    *)         echo "extract: unsupported format '$1'" >&2; return 1 ;;
  esac
}

# ── Show PATH entries one per line ────────────────────────────────────────
path() {
  echo "$PATH" | tr ':' '\n' | nl
}

# ── Quick git commit & push ───────────────────────────────────────────────
gcp() {
  git add -A && git commit -m "${1:-update}" && git push
}

# ── Find process by name ──────────────────────────────────────────────────
psgrep() {
  ps aux | grep -v grep | grep -i "$1"
}

# ── Get local & public IP ─────────────────────────────────────────────────
myip() {
  echo "Local:  $(ipconfig getifaddr en0 2>/dev/null || echo 'not connected')"
  echo "Public: $(curl -s ifconfig.me)"
}

# ── Quick HTTP server in current dir ──────────────────────────────────────
serve() {
  local port="${1:-8000}"
  echo "Serving on http://localhost:$port"
  python3 -m http.server "$port"
}
