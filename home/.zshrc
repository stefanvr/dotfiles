source ~/.bashrc
alias reload="source ~/.zshrc"

#includes
source ~/.zsh/tab_title.zsh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#Set prompt
setopt prompt_subst
PROMPT='$(~/.zsh/prompt $?)'

export SHELL=$(which zsh)

#Colors
autoload -U colors
colors
source ~/.zsh/colors.zsh
export LS_COLORS='no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.rb=00;31'
export CLICOLOR=1 # Enable coloured output from ls, etc

# Load completions for Ruby, Git, etc.
autoload -Uz compinit
compinit

# RVM
#-------------------------------------------------
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
