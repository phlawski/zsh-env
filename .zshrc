# ============================
# Uncomment this if you want to profile the zsh startup
# ============================
# zmodload zsh/zprof

# ============================
# Antidote (plugin manager)
# ============================
source $HOME/.antidote/antidote.zsh
antidote load

# ============================
# History
# ============================
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=10000
setopt inc_append_history    # append commands to history immediately
setopt share_history         # share history across all sessions
setopt hist_ignore_dups      # ignore duplicate commands
setopt hist_reduce_blanks    # remove extra spaces

# ============================
# Bindkeys (convenient history search)
# ============================
bindkey "${key[Up]}" history-substring-search-up
bindkey "${key[Down]}" history-substring-search-down

# ============================
# Kubernetes (optional)
# ============================
if command -v kubectl &>/dev/null; then
  # kubectl helper commands
  compdef kubecolor=kubectl
  source $HOME/.kube-ps1/kube-ps1.sh
  export KUBE_PS1_SEPARATOR=''
  export KUBE_PS1_PREFIX=''
  export KUBE_PS1_SUFFIX=''
  export KUBE_PS1_NAMESPACE_FUNCTION=current_ns
  export PS1='$(kube_ps1)'$PS1
  export KUBECOLOR_PRESET="protanopia-dark"

  # function to get current namespace
  current_ns () {
    echo $(kubectl get sa -o=jsonpath='{.items[0]..metadata.namespace}')
  }
fi

# ============================
# Aliases
# ============================
alias top="btop"

# ============================
# Uncomment this if you want to profile the zsh startup
# ============================
# zprof
