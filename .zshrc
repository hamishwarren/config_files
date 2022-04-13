fortune -s
echo


# Change defualt text editor to neovim
export EDITOR=~/.local/bin/nvim.appimage


# Pyenv Configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


# Add stuff to PATH
path+=('~/shell_scripts')
path+=('/usr/local/go/bin')
export PATH


# Zsh History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000000000 # number of lines loaded on shell startup
SAVEHIST=1000000000 # nunber of lines stored
setopt EXTENDED_HISTORY # add timestamp to hisrory
setopt HIST_FIND_NO_DUPS # skip duplicates when scrolling with crtl-r
setopt INC_APPEND_HISTORY # read and write to history after each command
setopt SHARE_HISTORY # share history between shell instances
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space.

# Completion Configuration 
autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# Alias
alias ls="ls --color=auto"
alias ll="ls -alh --color=auto"
alias la="ls -a --color=auto"
alias reload=". ~/.zshrc"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias vi=~/.local/bin/nvim.appimage
alias nv=~/.local/bin/nvim.appimage
alias path="print -l $path"
alias lines="wc -l * 2>>/dev/null"
alias pipenvls="pipenv run pip list"
alias defaultterm="sudo update-alternatives --config x-terminal-emulator"
alias sshagent="eval `ssh-agent` && ssh-add -t 20"
alias sshkill="kill $SSH_AGENT_PID"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# Database entry 
alias dbc="sudo -i -u postgres psql"
alias db="psql -U postgres"
alias dbmed="psql -U postgres medirota_test"
alias pglog="tail -f /var/log/postgresql/postgresql-12-main.log | grep --line-buffer -v 'statement: BEGIN\|TIME ZONE\|django_migrations\|django_session\|COMMIT\|search_path\|SAVEPOINT\|get_unread_count\|default_transaction\|duration\|get_practice\|by_week_count\|fn_list_submittals_settings\|SELECT 1'"
# Easy access to config files
alias zshrc="$EDITOR ~/.zshrc"
alias nvimconf="$EDITOR ~/.config/nvim/init.lua"
alias netrc="$EDITOR ~/.netrc"
alias hgrc="$EDITOR ~/.hgrc"
alias tmuxconf="$EDITOR ~/.tmux.conf"


# Terminal Prompt Configuration
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg
precmd() {
    vcs_info
}
setopt prompt_subst
PROMPT='%F{6}%n@%m%f in %F{3}%~%f ${vcs_info_msg_0_} $ '


# Keybndings
bindkey -e # Use emacs keybindings even if our EDITOR is set to vi


