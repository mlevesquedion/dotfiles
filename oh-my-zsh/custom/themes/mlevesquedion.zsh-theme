ZSH_THEME_GIT_PROMPT_PREFIX="%F{#ff79c6}["
ZSH_THEME_GIT_PROMPT_DIRTY="%F{#ffb86c}#"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{#ff79c6}]"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%B%F{#bd93f9}$(compresspath $PWD) $(git_prompt_info)
%(?:%F{#50fa7b}:%F{#ff5555})❱%{$reset_color%} '
