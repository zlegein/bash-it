alias k9="kill -9"

alias synology="ssh -p72 admin@legein.synology.me"

alias stash='git stash'
alias unstash='git stash pop'
alias gdiff='git diff'
alias gsearch=searchGitLogs
alias gdel=removeBranchesWithPrefix
alias gwdebug='echo hilton_gw_admin/GW@dm1nr0cks!'
alias glist='git branch -r --merged develop | grep -E "(story|task[s]?|bugfix|feature|project|release)"'
alias grcbi='gradle clean build install -x test -x javadoc'
alias hgw='cd ~/workspace/hilton/hilton-gw'
alias hc='cd ~/workspace/hilton/hilton-core'
alias ha='cd ~/workspace/hilton/hilton-arch'
alias hgwsd='gradle clean build appStartDebug -x test -x javadoc'
alias hgws='gradle clean build appStart -x test -x javadoc'
alias pulldx=refreshDXRepos
alias dx=dxGoto
alias dxk='docker rm -f $(docker ps -a -fname=dx* -q)'
alias dxrmi='docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")'
alias dxnuke='docker rm -f $(docker ps -a -q) && docker rmi -f $(docker images -q)'
alias dxs='docker-compose -f dx-docker/compose/pot-nodejs-develop.yml up --build'
alias gwtoken='curl --header "Authorization: Basic OHVtdGttZW05QUdBTzJkNVFoN2FuTEVTVjV6djdnUUg6N29UR3NoQUt2SlVnQUFuQQ==" "https://test.hiltonapi.com/v1/oauth/accesstoken?grant_type=client_credentials" | python -c "import json,sys;obj=json.load(sys.stdin);print obj['access_token'];";'
alias staginguser1='node ~/workspace/hilton/devtools/dci/getCookie.js QWGwufi4cI7JwBB24LdnaceI2lka SjZKhiSEV0dfh6ozG6edtPuTF7Ya staginguser1 Pass1234 $1'
alias huffhines='node ~/workspace/hilton/devtools/dci/getCookie.js QWGwufi4cI7JwBB24LdnaceI2lka SjZKhiSEV0dfh6ozG6edtPuTF7Ya huffhines Pass1234 $1'

alias node8='export export NODE_ICU_DATA=$NODE_8_ICU_DATA && nvm use 8'
alias node7='export export NODE_ICU_DATA=$NODE_7_ICU_DATA && nvm use 7'


export JAVA_7_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home'
export JAVA_8_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home'

#Command line alias so we can switch to java8 or Java7
alias java7='export JAVA_HOME=$JAVA_7_HOME'
alias java8='export JAVA_HOME=$JAVA_8_HOME'

alias ejava='echo $JAVA_HOME'

GRADLE_OPTS="-Xmx2G -Xms1G -XX:MaxPermSize=3G"

dxGoto() {
  case "$1" in
    sh)
      DIR="dx-shared"
      ;;
    sha)
      DIR="dx-shared-api"
      ;;
    shui)
      DIR="dx-shared-ui"
      ;;
    comui)
      DIR="dx-components-ui"
      ;;
    chui)
      DIR="dx-checkin-ui"
      ;;
    rui)
      DIR="dx-reservations-ui"
      ;;
    api)
      DIR="dx-api"
      ;;
    lh)
      DIR="dx-lighthouse-api"
      ;;
    mock)
      DIR="dx-mock-api"
      ;;
    *)
      DIR=""
  esac

  if [ "$DIR" == '' ]; then
    echo "Heading over to funky town!"
  else
    echo "Heading over to $DIR town!"
  fi

  cd ~/workspace/hilton/dx/$DIR

}

refreshDXRepos() {
  for i in `ls -d dx*`;
    do echo "----> $i";
    cd $i;
    git checkout develop;
    git pull;
    cd - > /dev/null 2>&1;
  done
}

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
