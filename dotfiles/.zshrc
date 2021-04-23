autoload -U add-zsh-hook
autoload -U compinit
compinit
autoload -U promptinit
promptinit

export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=/Users/js063531/Library/Android/sdk/platform-tools:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export REACT_EDITOR='code --wait'
export EDITOR='code --wait'
export ZSH="/Users/js063531/.oh-my-zsh"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export ANDROID_SDK=/Users/js063531/Library/Android/sdk
export GOPATH=$HOME/go
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home
if [ -f '/Users/js063531/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/js063531/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/js063531/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/js063531/google-cloud-sdk/completion.zsh.inc'; fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export SCARF_ANALYTICS=false
export ANDROID_SDK_ROOT=$ANDROID_SDK
export WDIO_EXTERNAL_HOST=10.188.162.69

ZSH_THEME="spaceship"
plugins=(
  history
  node
  osx
  docker
  docker-compose
  docker-machine
  dotenv
  bundler
  yarn
  npm
)

setopt correct
setopt auto_cd

plugins+=(zsh-better-npm-completion)

source $ZSH/oh-my-zsh.sh
source ~/.spaceship
source ~/.aliases
source ~/.permissions
source ~/.functions
source /Users/js063531/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
