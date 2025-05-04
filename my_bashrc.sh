# DOT CONFIG

## Git Branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

## Kubernetes Context and Namespace
source ~/.config/dotconfig/bash-configs/kube-ps1/kube-ps1.sh

# Set the prompt to show the current directory, git branch, and Kubernetes context/namespace
## [dir] [branch] [kube_context:kube_namespace]
PS1="\[\e[1;92m\][\w]\[\e[33m\]\$(parse_git_branch) \[\033[00m\]\$(kube_ps1)\n$ "

## Custom Aliases
### Kubernetes
[ -f ~/.config/dotconfig/bash-configs/kube-aliases/.kubectl_aliases ] && source ~/.config/dotconfig/bash-configs/kube-aliases/.kubectl_aliases
### General
[ -f ~/.config/dotconfig/bash-configs/.custom_aliases ] && source ~/.config/dotconfig/bash-configs/.custom_aliases

