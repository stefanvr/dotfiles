# Utilities
# ---------------------------------------------------------------------------------------

# working with these dotfiles made easier
alias reload='source ~/.bashrc'
alias ea='vim ~/.bashrc && reload' # Edit aliases

#alias standard command
alias lsh='ls -lhGFr'
alias lsa='ls -lhaGFr'

#tmux stuff
#export TERM="screen-256color"
#alias tmux="tmux -2"

#generic
alias cls='clear'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# Git
# ---------------------------------------------------------------------------------------
alias gl='git log --pretty=format:"%C(yellow)%h%C(reset)|%C(bold blue)%an%C(reset)|%s" | column -s "|" -t | less -FXRS'
alias glr='git log --pretty="format:* %s" --merges --grep "pull request" | sed -e "s/Merge pull request #[0-9]\{1,\} from kabisaict\///" -e "s/_/ /g"'
alias glog='git log --pretty=format:"%C(yellow)%h%C(reset) %C(green)%ar%C(reset) %C(bold blue)%an%C(reset) %C(red)%d%C(reset) %s" --graph --abbrev-commit --decorate'
alias gs='git status -b -s --ignore-submodules=dirty'
alias gw='git whatchanged --oneline'

alias gd='git diff'
alias gmc='git ls-files --unmerged | cut -f2 | uniq' # git merge conflicts

alias gb='git branch'
alias gbl='git branch -l'
alias gbr='git branch -r'
alias gbp='git remote prune origin'
alias gbco='git checkout -t'
alias gbrd='git push origin --delete '

alias gss='git stash save'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsd='git stash drop'

alias gp='git push'
alias push='git push'
alias pull='git pull --rebase'
alias gpom='git push origin master'
alias gf='git fetch'
alias gfom='git fetch origin master'

alias gb='git branch'
alias gco='git checkout'
alias grh='git reset --hard'
alias gra='git clean -f'

alias gaa='git add --all'
alias gaf='git add'

alias gam='git commit --amend'
alias gcm='git commit -m'
alias gca='git commit -va -m'
# Commit pending changes and quote all args as message
function gg() {
    git commit -v -a -m "$*"
}

function f() {
    find . -name "$*"
}


alias be='bundle exec'

alias mci='mvn clean install'
alias mcp='mvn clean install -DskipTests'

# vagrant
# ---------------------------------------------------------------------------------------
alias vu='vagrant up'
alias vd='vagrant halt'
alias vs='vagrant ssh'
alias vsc='vagrant ssh-config'
alias vboxd='vagrant destroy'
alias vboxa='vagrant box add'
alias vboxr='vagrant box remove'

alias vv='vu && vs'
alias vr='vboxd && vu && vs'

# postgres
# ---------------------------------------------------------------------------------------
alias pgs='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgr='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log restart -m fast'
alias pgx='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop'
alias pgi='initdb /usr/local/var/postgres -E utf8'

# docker
#$(boot2docker shellinit)

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:/Users/stefanvr/Kabisa/android/android-sdk-macosx/tools:/Users/stefanvr/Kabisa/android/android-sdk-macosx/platform-tools:$PATH"

#elixir
export PATH="$PATH:/path/to/elixir/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/Applications/IntelliJ IDEA 14 CE.app/Contents/plugins/maven/lib/maven2/bin"

#if which jenv > /dev/null; then eval "$(jenv init -)"; fi
