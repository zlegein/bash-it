alias k9="kill -9"

alias synology="ssh -p72 root@legein.synology.me"

alias stash='git stash'
alias unstash='git stash pop'
alias gdiff='git diff'
alias gsearch=searchGitLogs
alias gdel=removeBranchesWithPrefix
alias grcbi='gradle clean build install -x test -x javadoc'
alias hgw='cd ~/workspace/hilton/hilton-gw'
alias hc='cd ~/workspace/hilton/hilton-core'
alias ha='cd ~/workspace/hilton/hilton-arch'
alias hgwsd='gradle clean build appStartDebug -x test -x javadoc'
alias hgws='gradle clean build appStart -x test -x javadoc'

#Command line alias so we can switch to java8 or Java7
alias java7='export JAVA_HOME=$JAVA_7_HOME'
alias java8='export JAVA_HOME=$JAVA_8_HOME'

GRADLE_OPTS="-Xmx2G -Xms1G -XX:MaxPermSize=3G"

removeBranchesWithPrefix() {
  git for-each-ref --format="%(refname:short)" refs/heads/$1\* | xargs git branch -d
}

searchGitLogs() {
  TIMES="25"
  if [ -z "$2" ]
  then
    $TIMES=$2
  fi
  git log | grep -B 1 -A 3 -m$TIMES $1
}
