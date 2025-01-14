# Mapa de colores
typeset -A host_repr
host_repr=('dieter-ws-a7n8x-arch' "%{$fg[cyan]%}ws" 'dieter-p4sci-arch' "%{$fg[cyan]%}p4")

# Colores y secciones del prompt
time_enabled="%{$fg[cyan]%}⏱ %*%{$reset_color%}"
time_disabled="%{$fg[cyan]%}⏱ %*%{$reset_color%}"
time=$time_enabled
local user="%(!.%{$fg[white]%}👤 %n%{$reset_color%}.%{$fg[white]%}👤 %n%{$reset_color%})"
local host="%{$fg[white]%}@${host_repr[$HOST]:-$HOST}%{$reset_color%}"
local pwd="%{$fg[cyan]%}📂 %c%{$reset_color%}"

# Prompt principal
PROMPT='${time} ${user}${host} ${pwd} $(git_prompt_info) '

# Git prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%}] %{$fg[cyan]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="] %{$fg[cyan]%}✔%{$reset_color%}"

# Código de salida
return_code_enabled="%(?..%{$fg[cyan]%}%? ↵%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled
RPS1='${return_code}'

# Manejo de la línea de comandos
function accept-line-or-clear-warning () {
    if [[ -z $BUFFER ]]; then
        time=$time_disabled
        return_code=$return_code_disabled
    else
        time=$time_enabled
        return_code=$return_code_enabled
    fi
    zle accept-line
}

zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning

