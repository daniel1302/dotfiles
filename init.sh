#!/bin/bash
set -x;
# get sudo credentials for further usage;
sudo whoami;

# install software
if [ "$(uname)" == "Darwin" ]; then
  echo "Running for MacOS";
  brew install tmux ninja gradle git;

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo "Running on Linux";
  sudo apt-get update;
  sudo apt-get install -y tmux ninja gradle git;

elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  echo "Running on Windows x32"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    echo "Running on Windows x64"
fi

# todo: add install for go

# golang tools
go install github.com/incu6us/goimports-reviser/v3@latest ;
go install mvdan.cc/gofumpt@latest ;
go install github.com/segmentio/golines@latest ;
go install github.com/go-delve/delve/cmd/dlv@latest ;
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.50.1 ;
go install golang.org/x/tools/cmd/goimports@latest ;

# install rust
if ! command -v rustup; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y ;
fi;
#  sh -s -- -y

# rust tools
rustup component add rust-src;
rustup component add rust-analyzer;

if ! command -v tfenv; then
  git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv ;
  echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.profile ;
  source ~/.profile;
  tfenv install;
  tfenv use;
fi;


# check if gradlew installed
if ! ls ~/tools/groovy-language-server/build/libs/groovy-language-server-all.jar; then
  mkdir -p ~/tools;

  cd ~/tools; git clone https://github.com/GroovyLanguageServer/groovy-language-server.git;
  cd groovy-language-server; 
  ./gradlew build; 
fi;


if ! command -v lua-language-server; then
  mkdir -p ~/tools;

  sudo apt-get install -y git ninja-build;
  cd ~/tools; git clone https://github.com/LuaLS/lua-language-server;
  cd lua-language-server;
  ./make.sh;

  sudo cp bin/lua-language-server /usr/local/bin/lua-language-server ;
fi;

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm