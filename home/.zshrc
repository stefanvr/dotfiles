source ~/.bashrc
alias reload="source ~/.zshrc"

#includes
source ~/.zsh/tab_title.zsh

#Colors
export CLICOLOR=1 # Enable coloured output from ls, etc
source ~/.zsh/colors.zsh

# Set prompt
setopt prompt_subst
PROMPT='$(~/.zsh/prompt $?)'
#
export SHELL=$(which zsh)
