#!/bin/bash
set -x;
# get sudo credentials for further usage;
sudo whoami;

# golang tools
go install github.com/incu6us/goimports-reviser/v3@latest ;
go install mvdan.cc/gofumpt@latest ;
go install github.com/segmentio/golines@latest ;

# rust tools
rustup component add rust-src;
rustup component add rust-analyzer;


# check if gradlew installed
if ! ls ~/tools/groovy-language-server/build/libs/groovy-language-server-all.jar; then
  mkdir -p ~/tools;
  
  sudo apt-get install -y gradle git;
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
