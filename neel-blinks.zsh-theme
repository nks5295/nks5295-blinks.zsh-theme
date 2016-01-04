# based off of
#	Blinks theme - https://github.com/blinks zsh theme
#	aranasaurus blinks theme mods - https://github.com/aranasaurus/zemm-blinks.zsh-theme
#	Steve Losh's zsh theme - http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

# battery status from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# make sure BATTERY_SCRIPT is an environment variable pointing to the battery.py file
function _battery_status() {
	echo `$BATTERY_SCRIPT` 2>/dev/null
}

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{red}%}±%{%f%k%b%}"
  else
    echo ' '
  fi
}

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{${bkg}}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%K{${bkg}}%B%F{green}%}%n%{%B%F{red}%}[∴]%{%B%F{blue}%}%m%{%B%F{green}%} %{%b%F{yellow}%K{${bkg}}%}%~%{%B%F{green}%}$(git_prompt_info)%E%{%f%k%b%}
%{%K{${bkg}}%}$(_prompt_char)%{%K{${bkg}}%B%F{cyan}%} %\Ø%{%f%k%b%} '

#RPROMPT='$(_battery_status)'						# This line displays battery status on right prompt
#RPROMPT='$(_battery_status)%{%f%k%b%}'				# This line displays battery status on right prompt
#RPROMPT='!%{%B%F{cyan}%}%!%{%f%k%b%}'				# This line shows history number on right prompt
RPROMPT='%{%F{blue}%}%@ - %D{%B %d}%{%f%k%b%}'		# This line displays time and date on right prompt
