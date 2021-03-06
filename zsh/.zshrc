# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="ys"
export ZSH_THEME="robbyrussell"

# option {{{
setopt nolistbeep # ビープを鳴らさない
setopt nobeep
# }}}

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#export PATH="$HOME/.plenv/bin:$PATH"
#eval "$(plenv init -)"
alias ctags=/usr/local/Cellar/ ctags/5.8/bin/ctags
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
# postgresql環境変数
export PGDATA=/usr/local/var/postgres

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
### GOPATH
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"
#export ANDROID_HOME="/Applications/Android Studio.app/sdk/tools"
alias perldoc="perldoc -M Pod::Text::Color::Delight"
setopt nonomatch
## Setting for autojump
[[ -s /Users/htk291/.autojump/etc/profile.d/autojump.sh ]] && source /Users/htk291/.autojump/etc/profile.d/autojump.sh

## rake new_post['hoge']でエラーがでないようにする
autoload -U compinit && compinit -u

### peco start ---------------------

## <C+r> -> zsh_history | peco
function exists { which $1 &> /dev/null }
if exists peco; then
    function peco_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }
    zle -N peco_select_history
    bindkey '^R' peco_select_history
fi
## git addするファイルをpecoで選択▼
#function peco-select-gitadd() {
#    local SELECTED_FILE_TO_ADD="$(git status --porcelain | \
#                                  peco --query "$LBUFFER" | \
#                                  awk -F ' ' '{print $NF}')"
#    if [ -n "$SELECTED_FILE_TO_ADD" ]; then
#        BUFFER="git add $(echo "$SELECTED_FILE_TO_ADD" | tr '\n' ' ')"
#        CURSOR=$#BUFFER
#    fi
#    zle accept-line
#    # zle clear-screen
# }
# zle -N peco-select-gitadd
# bindkey "^g^a" peco-select-gitadd
## git addするファイルをpecoで選択▲

### peco end ---------------------
#eval "$(rbenv init -)"

## nodebrew
#export PATH="$PATH:$HOME/.nodebrew/current/bin"
## perl6
export PATH=$PATH:$HOME/perl6/bin
## bundler
export PATH="$HOME/.gem/ruby/2.0.0/bin:$PATH"
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
source ~/.mysqlenv/etc/bashrc
