# Utilities
# ---------------------------------------------------------------------------------------

# working with these dotfiles made easier
alias reload='source ~/.bashrc'
alias ea='vim ~/.bashrc && reload' # Edit aliases

#alias standard command
alias lsh='ls -lhGFr'
alias lsa='ls -lhaGFr'

# Git
# ---------------------------------------------------------------------------------------
alias ga='git commit --amend'
alias gd='git diff'
alias gl='git log --pretty=format:"%C(yellow)%h%C(reset)|%C(bold blue)%an%C(reset)|%s" | column -s "|" -t | less -FXRS'
alias glr='git log --pretty="format:* %s" --merges --grep "pull request" | sed -e "s/Merge pull request #[0-9]\{1,\} from kabisaict\///" -e "s/_/ /g"'
alias glog='git log --pretty=format:"%C(yellow)%h%C(reset) %C(green)%ar%C(reset) %C(bold blue)%an%C(reset) %C(red)%d%C(reset) %s" --graph --abbrev-commit --decorate'
alias gp='git push'
alias gpom='git push origin master'
alias gs='git status -b -s --ignore-submodules=dirty'
alias gw='git whatchanged --oneline'

# Commit pending changes and quote all args as message
function gg() {
    git commit -v -a -m "$*"
}

