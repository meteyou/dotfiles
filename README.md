# 🏠 dotfiles

My personal dotfiles – managed with [chezmoi](https://www.chezmoi.io/).

The goal: get a fresh Mac up and running with my full development setup using
**a single command**. All configurations, shell aliases, tools, and themes are
installed and configured automatically.

---

## ✨ What's Inside

| Area                  | Details                                                                                                   |
|-----------------------|-----------------------------------------------------------------------------------------------------------|
| **Shell**             | Zsh with [Powerlevel10k](https://github.com/romkatv/powerlevel10k), Autosuggestions & Syntax Highlighting |
| **Modern CLI Tools**  | `eza` (ls), `bat` (cat), `zoxide` (cd), `fzf`, `ripgrep`, `fd`                                            |
| **Theme**             | [Catppuccin Mocha](https://github.com/catppuccin/catppuccin) for `bat` and `fzf`                          |
| **Version Manager**   | [asdf](https://asdf-vm.com/) for languages & runtimes                                                     |
| **Git Aliases**       | Compact shortcuts (`gs`, `gl`, `gp`, `gcp`, …)                                                            |
| **Utility Functions** | `extract` (archives), `mkcd`, `myip`, `serve`, `psgrep`                                                   |
| **Package Manager**   | [Homebrew](https://brew.sh/) – packages are installed automatically                                       |

## 📁 Repo Structure

```
.
├── dot_zshrc                              # Main Zsh configuration
├── dot_p10k.zsh                           # Powerlevel10k prompt configuration
├── dot_config/
│   └── zsh/
│       ├── aliases.zsh                    # Shell aliases (git, navigation, tools, …)
│       ├── exports.zsh                    # Environment variables, PATH, tool config
│       ├── functions.zsh                  # Helper functions (extract, mkcd, serve, …)
│       └── create_local.zsh               # Template for machine-specific config
└── run_once_before_install-packages.sh.tmpl   # Automatic package installation (Homebrew)
```

## 🚀 Installation

### Prerequisites

- macOS (tested on Apple Silicon)
- Xcode Command Line Tools (`xcode-select --install`)

### Quick Start (one command)

If chezmoi is **not** installed yet:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply meteyou
```

This command will:
1. Install chezmoi
2. Clone this repo
3. Automatically install all Homebrew packages (including Homebrew itself)
4. Apply all configurations

### If chezmoi is already installed

```bash
chezmoi init meteyou
chezmoi apply
```

## 🔄 Daily Workflow

| Command                 | Shortcut       | Description                            |
|-------------------------|----------------|----------------------------------------|
| `chezmoi edit ~/.zshrc` | `cze ~/.zshrc` | Edit a file in the source directory    |
| `chezmoi diff`          | `czd`          | Preview changes before applying        |
| `chezmoi apply`         | `cza`          | Apply changes to the home directory    |
| `chezmoi cd`            | –              | Jump into the chezmoi source directory |

### Push changes

```bash
chezmoi cd
git add -A && git commit -m "update dotfiles" && git push
```

### Pull updates on another machine

```bash
chezmoi update
```

## 🖥️ Machine-Specific Configuration

The file `~/.config/zsh/local.zsh` is created on the first `chezmoi apply` but
**never overwritten**. Use it for machine-specific settings:

```bash
# ~/.config/zsh/local.zsh
export SOME_API_KEY="..."
alias myproject="cd ~/Projects/myproject"
```

## 📝 License

Personal configuration – feel free to use it as inspiration. ⭐
