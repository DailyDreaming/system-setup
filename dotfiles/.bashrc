export GOROOT=/usr/local/go
export GOPATH=/home/quokka/Projects/Proj1
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=$PATH:/opt/pycharm-2019.2/bin:/opt/deadbeef:/opt/elasticsearch/bin
export DSS_TEST_ES_PATH=/opt/elasticsearch/bin/elasticsearch
export GOOGLE_APPLICATION_CREDENTIALS=/home/quokka/.credentials/dev.json

alias sudo='sudo '
alias c='clear && source ~/.bashrc'
alias kubectl='/usr/bin/kubectl '
alias heptio-authenticator-aws='aws-iam-authenticator '
alias dk='docker kill "$(docker ps -q)" &> /dev/null'
# https://wikileaks.org/ciav7p1/cms/page_1179773.html
alias gitfix='git commit --amend -C HEAD'
alias daily-quote='python3 /usr/local/bin/quote_of_the_day.py | lolcat'

python3 /usr/local/bin/quote_of_the_day.py | lolcat

# toil
alias gittoil='git clone https://github.com/DataBiosphere/toil.git && cd toil'
alias mktoil='git clone https://github.com/DataBiosphere/toil.git && cd toil && virtualenv -p python3.6 v3nv && . v3nv/bin/activate && make prepare && make develop extras=[all]'
mktoilb() { git clone https://github.com/DataBiosphere/toil.git && cd toil && git checkout "$1" && virtualenv -p python3.6 v3nv && . v3nv/bin/activate && make prepare && make develop extras=[all]; }
gittoilb() { git clone https://github.com/DataBiosphere/toil.git && cd toil && git checkout "$1"; }
# dss
alias gitdss='git clone https://github.com/HumanCellAtlas/data-store.git && cd data-store'
alias mkdss='git clone https://github.com/HumanCellAtlas/data-store.git && cd data-store && virtualenv -p python3.6 v3nv && . v3nv/bin/activate && pip install -r requirements-dev.txt && source environment'
mkdssb() { git clone https://github.com/HumanCellAtlas/data-store.git && cd data-store && git checkout "$1" && virtualenv -p python3.6 v3nv && . v3nv/bin/activate && pip install -r requirements-dev.txt && source environment; }
gitdssb() { git clone https://github.com/HumanCellAtlas/data-store.git && cd data-store && git checkout "$1"; }
# dcp-cli
alias gitcli='git clone https://github.com/HumanCellAtlas/dcp-cli.git && cd dcp-cli'
alias mkcli='git clone https://github.com/HumanCellAtlas/dcp-cli.git && cd dcp-cli && virtualenv -p python3.6 v3nv && . v3nv/bin/activate && pip install -r requirements-dev.txt && make install'
mkclib() { git clone https://github.com/HumanCellAtlas/dcp-cli.git && cd dcp-cli && git checkout "$1" && virtualenv -p python3.6 v3nv && . v3nv/bin/activate && pip install -r requirements-dev.txt && make install; }
gitclib() { git clone https://github.com/HumanCellAtlas/dcp-cli.git && cd dcp-cli && git checkout "$1"; }

g() { grep -r "$1" .; }
ppjson() { cat "$1" | jq ''; }
git-diff() { git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative origin/$1..origin/$2; }
gs-json() { python3 /usr/local/bin/gs_json.py "$1"; }
switch() { python3 /usr/local/bin/switch.py "$1"; if [ "$1" = "hca-dev" ]; then export GOOGLE_APPLICATION_CREDENTIALS=/home/quokka/.credentials/hca-dev.json; fi;  if [ "$1" = "hca-prod" ]; then export GOOGLE_APPLICATION_CREDENTIALS=/home/quokka/.credentials/hca-prod.json; fi }
h() { history | grep -i "$1"; }
switch-terraform() { wget https://releases.hashicorp.com/terraform/${1}/terraform_${1}_linux_amd64.zip && sudo unzip ./terraform_${1}_linux_amd64.zip -d /usr/local/bin/ && sudo chmod +x /usr/local/bin/terraform && sudo rm terraform_${1}_linux_amd64.zip && terraform version; }
kill-port() { sudo kill -9 $(sudo lsof -t -i:$1); }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
