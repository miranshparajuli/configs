if status is-interactive
set -x LANG en_US.UTF-8
set -g fish_greeting ""

alias i="doas apk add"
alias u=" doas apk del "
alias s="apk search"
alias upd="doas apk upgrade && doas apk fix "

alias fm="xplr"
alias b="bat --plain"
alias ls="eza --long --color=always --icons=always --no-time --no-user --no-permissions --git --group-directories-first"
alias t="eza --tree --icons=always --group-directories-first"
alias check="uptime -p ;free  -h "
alias ff="fastfetch"

alias py="python"
alias c="cargo"

fish_add_path /home/mrijann/.cargo/bin
starship init fish | source
export PATH=$HOME/.nimble/bin:$PATH
fish_add_path ~/.nimble/bin

set -U fish_color_command blue --underline
end
fastfetch
