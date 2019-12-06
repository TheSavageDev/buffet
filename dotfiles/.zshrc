export REACT_EDITOR='code-insiders --wait'
export EDITOR='code-insiders --wait'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export ZSH="/Users/js063531/.oh-my-zsh"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export PATH=$PATH:/usr/local/mysql/bin
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

COMPLETION_WAITING_DOTS="true"

# Theme for ZSH
ZSH_THEME="spaceship"

# Plugins
plugins=(
  aws
  history
  node
  osx
  web-search
  docker
  docker-compose
  docker-machine
  dotenv
  bundler
  gatsby
  yarn
  npm
)

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Local non standard plugins
plugins+=(zsh-better-npm-completion)

# Source imports
source $ZSH/oh-my-zsh.sh
source ~/.spaceship
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# You can put your aliases in here or important them like I do from a .aliases
source ~/.aliases
source ~/.functions

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/js063531/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/js063531/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/js063531/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/js063531/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
