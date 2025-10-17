source $HOME/.antidote/antidote.zsh

# history
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=10000
setopt inc_append_history
setopt share_history

# antidote
antidote load

compdef kubecolor=kubectl

# options
fpath=($ZSH/completion $fpath)
bindkey "${key[Up]}" history-substring-search-up
bindkey "${key[Down]}" history-substring-search-down

# exports
export SAVEHIST=999999999

# kube ps-1
source $HOME/.kube-ps1/kube-ps1.sh
export KUBE_PS1_SEPARATOR=''
export KUBE_PS1_PREFIX=''
export KUBE_PS1_SUFFIX=''
export KUBE_PS1_NAMESPACE_FUNCTION=current_ns
export PS1='$(kube_ps1)'$PS1
export KUBECOLOR_PRESET="protanopia-dark"

# aliases
alias top="btop"

# functions
current_ns () {
	echo $(kubectl get sa -o=jsonpath='{.items[0]..metadata.namespace}')
}
