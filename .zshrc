
# instant promt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='nvim'

# dotfiles verwalten
alias dotfiles='/usr/bin/git --git-dir=$HOME/.local/dotfiles --work-tree=$HOME'

# Colored ls mit wbase
if [[ -x /bin/lsd ]]; then
  alias ls='lsd'
  else
    alias ls=ls\ --color=auto 
fi

alias grep=grep\ --color=auto

if [[ -x "/bin/bat" ]]; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export MANROFFOPT="-c"
fi

# Keybindings for substring search plugin. Maps up and down arrows.
bindkey -M main '^[OA' history-substring-search-up
bindkey -M main '^[OB' history-substring-search-down
bindkey -M main '^[[A' history-substring-search-up
bindkey -M main '^[[B' history-substring-search-up

# Keybindings for autosuggestions plugin
bindkey '^ ' autosuggest-accept
bindkey '^f' autosuggest-accept

# vim-mode: Change the color and shape of the terminal cursor with:
MODE_CURSOR_VICMD="green block"
MODE_CURSOR_VIINS="#20d08a blinking bar"
MODE_CURSOR_SEARCH="#ff00ff steady underline"

# Gray color for autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=124'

# fzf settings. Uses sharkdp/fd for a faster alternative to `find`.
# paste selected files and dirs into command line
FZF_CTRL_T_COMMAND='fd --type f --hidden --exclude .git --exclude .cache . $HOME'
#cd into dir
FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git . $HOME'
#CTRL-R - Paste the selected command from history onto the command-line
#FZF_CTRL_R_OPTS

#To use zplug, include the following line in your .zshrc:
source /usr/share/zsh/scripts/zplug/init.zsh

zplug "woefe/wbase.zsh"
#zplug "woefe/git-prompt.zsh", use:"{git-prompt.zsh,examples/wprompt.zsh}"
zplug "softmoth/zsh-vim-mode"
zplug "junegunn/fzf", use:"shell/*.zsh"
#zplug "sharkdp/fd", from:gh-r, as:command, rename-to:fd, use:"*x86_64-unknown-linux-gnu.tar.gz"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug 'plugins/ssh-agent', from:oh-my-zsh, ignore:oh-my-zsh.sh

# omz plugins
zplug "plugins/colored-man-pages", from:oh-my-zsh

# load the good stuff
#zplug "knu/z", use:z.sh

# theme
zplug "romkatv/powerlevel10k", as:theme, depth:1, if:"[[ $TERM != *linux* ]]"
zplug "themes/fishy", as:theme, from:oh-my-zsh, if:"[[ $TERM == *linux* ]]"

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load


## History substring search:
#if zplug check zsh-users/zsh-autosuggestions; then
#    ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)
#    ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}")
#fi
#
#
#if zplug check zsh-users/zsh-history-substring-search; then
#  zmodload zsh/terminfo
#  bindkey "$terminfo[kcuu1]" history-substring-search-up
#  bindkey "$terminfo[kcud1]" history-substring-search-down
#fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
