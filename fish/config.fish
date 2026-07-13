if status is-interactive
set -x LANG en_US.UTF-6
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

set -g fish_color_keyword ff659a --bold    
set -g fish_color_command ae83ff --underline    
set -g fish_color_param 68d9ef      
set -g fish_color_redirection ae83ff 
set -g fish_color_end ae83ff          
set -g fish_color_error ff659a --bold  

set -g fish_color_quote a8e22e           
set -g fish_color_escape fd973f           
set -g fish_color_param_substitution fd973f
set -g fish_color_operator ffffff        
set -g fish_color_comment 7c6370 --italics
set -g fish_color_autosuggestion 7c6370    

set -g fish_pager_color_background --background=111113
set -g fish_pager_color_prefix ff659a --bold
set -g fish_pager_color_completion ffffff 
set -g fish_pager_color_description fd973f 
set -g fish_pager_color_selected_background --background=ae83ff
set -g fish_pager_color_selected_prefix 111113 --bold
set -g fish_pager_color_selected_completion 111113
set -g fish_pager_color_selected_description 222224


end

fastfetch

