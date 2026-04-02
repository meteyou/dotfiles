# ── Editor ─────────────────────────────────────────────────────────────────
export EDITOR="vim"
export VISUAL="$EDITOR"

# ── Language ───────────────────────────────────────────────────────────────
export LANG="de_DE.UTF-8"
export LC_ALL="de_DE.UTF-8"

# ── PKG_CONFIG_PATH (Homebrew libraries) ──────────────────────────────────
_pkg_libs=(openssl libtiff gmp libpng ncurses mpfr icu4c readline webp unixodbc libpq)
for _lib in $_pkg_libs; do
  _pc="$HOMEBREW_PREFIX/opt/$_lib/lib/pkgconfig"
  [[ -d "$_pc" ]] && export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$_pc"
done
unset _lib _pc _pkg_libs

# ── PATH additions ────────────────────────────────────────────────────────
# Remove stale asdf install paths from PATH (asdf 0.18+ injects these)
export PATH=$(echo "$PATH" | tr ':' '\n' | grep -v '\.asdf/installs/' | tr '\n' ':' | sed 's/:$//')

# asdf version manager
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# local binaries (amp, etc.)
export PATH="$HOME/.local/bin:$PATH"

# opencode
[[ -d "$HOME/.opencode/bin" ]] && export PATH="$HOME/.opencode/bin:$PATH"

# antigravity
[[ -d "$HOME/.antigravity/antigravity/bin" ]] && export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# ── Tool config ───────────────────────────────────────────────────────────
# bat theme
export BAT_THEME="Catppuccin Mocha"

# fzf defaults
export FZF_DEFAULT_OPTS=" \
  --height=40% --layout=reverse --border \
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
  --color=selected-bg:#45475a"

# fzf: use fd if available
if command -v fd &>/dev/null; then
  export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"
fi
