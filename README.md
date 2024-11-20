# dotfiles

1. Install dependencies

```bash
bash ./scripts/setup.sh
```

2. Clone the repository and run stow

```bash
cd ~
git clone  https://github.com/blasferna/dotfiles.git
cd dotfiles
stow nvim
stow tmux
stow wezterm
```

3. Install Tmux

...

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux source-file ~/.tmux.conf
```

4. Open Tmux and install plugins

Press `prefix` + `I` (capital i, as in **I**nstall) to fetch the plugin.
