# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"


if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirma $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"    

#Add in powerlevel10k
zinit ice depth=1;  zinit light romkatv/powerlevel10k 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Add in zsh plugin 
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab



#load completion 
autoload -U compinit && compinit 

#History 
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase 
setopt appendhistory 
setopt sharehistory 
setopt hist_ignore_space 
setopt hist_ignore_all_dups
setopt  hist_save_no_dups
setopt hist_ignore_dups 
setopt hist_save_no_dups

#completion styling 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no 
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'


# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found 

zinit cdreplay -q 

alias c="clear"
alias ll="ls -la"
alias ls="eza --no-user --no-permissions --long --color=always --icons=always --no-time"
alias vim="nvim"
alias cat="bat"
alias update="sudo pacman -Syu"
# shell integration 
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd  zsh)"

# Battery 
plugins=(... battery)
RPROMPT='$(battery_pct_prompt) ...'
BATTERY_CHARGING="⚡️"


#chpwd hook 
chpwd() {
  ls
}


