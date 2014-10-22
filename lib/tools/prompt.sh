function update.git-completion () {
  # https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  wget -P ~/bin/ https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
}

function update.git-prompt () {
  wget -P ~/bin/ https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh
}

toprompt () {
	echo "[$txtpur\$SRV_NAME$txtrst]$ "
	#export PS1="[$txtblun\$SRV_NAME$txtrst]$ "
	#export PS1="[$txtred\$SRV_NAME$txtrst]$ "
	#export PS1="[$txtgrn\$SRV_NAME$txtrst]$ "
	######export PS1="[$txtylw\$SRV_NAME$txtrst]$ "
	#export PS1="[$txtpur\$SRV_NAME$txtrst]$ "
	#######export PS1="[$txtcyn\$SRV_NAME$txtrst]$ "
	#export PS1="[$txtwht\$SRV_NAME$txtrst]$ "
}
#PROMPT_COMMAND=toprompt; print_before_the_prompt
#PROMPT_COMMAND='echo "comes before the prompt"'

#PS1='->'
#PS1='\$ '
#export PS1="[$txtcyn\$SRV_NAME$txtrst]$ "
#PS1="[$txtcyn\$SRV_NAME$txtrst]$ "
#PS1='\d@\t\n\u@\h:\!:\#:\w$ '
#PS1="\d, \t\n\u@\h:\!:\#:\w\n[$txtcyn\$SRV_NAME$txtrst]$ "

function activate.git-prompt () {
  source ~/bin/git-prompt.sh
  PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
  #PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_SHOWCOLORHINTS=true
}

function activate.git-completion () {
  source ~/bin/git-completion.bash
  # Show Git branch in bash prompt 
  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWSTASHSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true
  export GIT_PS1_SHOWUPSTREAM="verbose"
}


#export PS1=''''[33[01;32m]u@h[33[00m] [33[01;34m]w[33[00m]$(__git_ps1 " [33[01;33m](%s)[33[00m]") $ ''''

#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#PS1='$color_blue[\u@\h:\w] $color_green testc $color_yellow $(__git_ps1 "(%s)")\n$ $reset_color'

function activate.bash-git-prompt () {
  if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    # gitprompt configuration

    # Set config variables first
    # GIT_PROMPT_ONLY_IN_REPO=1

    # GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

    # GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
    # GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

    # as last entry source the gitprompt script
    # GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh
    # GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
  fi
}

print_before_the_prompt () {
    #printf "\n $txtred%s: $bldgrn%s $txtpur%s\n$txtrst" "$USER" "$PWD" "$(vcprompt)"
    #printf "\n$txtblu%s@%s: $bldgrn%s $bldblu%s $txtpur%s\n$txtrst" "$USER" "`hostname -s`" "$PWD" "`dirs`" "$(__git_ps1 '(%s)')"
    printf "\n$txtblu%s@%s: $bldgrn%s $bldblu%s $txtpur%s\n$txtrst" "$USER" "`hostname -s`" "$PWD" "`dirs`" "$(__git_ps1 '(%s)')"
}

function activate.prompt-git-before () {
  PROMPT_COMMAND=print_before_the_prompt
}

function activate.liquidprompt () {
  # You can prefix the LP_PS1 variable with anything you want using the LP_PS1_PREFIX. The following example activate a custom window's title:
  LP_PS1_PREFIX="\[\e]0;\u@\h: \w\a\]"
  # To postfix the prompt, use the LP_PS1_POSTFIX variable. For example, to add a newline and a single character:
  LP_PS1_POSTFIX="\n"
  
  #Note: the prompt_tag function is convenient way to add a prefix. You can thus add a keyword to your different terminals:
  # [:~/code/liquidprompt] develop ± prompt_tag mycode
  # mycode [:~/code/liquidprompt] develop ±
  
  # if you just want to have a liquidprompt displaying the user and the host, with a normal full path in blue and only the git support:
  # export LP_PS1=`echo -ne "[\${LP_USER}\${LP_HOST}:\${BLUE}\$(pwd)\${NO_COL}] \${LP_GIT} \\\$ "`
  # Note that you need to properly escape dollars in a string that wil be interpreted by bash at each prompt.
  
  # To erase your new formatting, just bring the LP_PS1 to a null string:
  # export LP_PS1=""
  
  if [ -f /usr/local/share/liquidprompt ]; then
    . /usr/local/share/liquidprompt
  fi

  # If you'd like to reconfigure options, you may do so in ~/.liquidpromptrc.
  # A sample file you may copy and modify has been installed to
  #  /usr/local/share/liquidpromptrc-dist

  # Don't modify the PROMPT_COMMAND variable elsewhere in your shell config;
  # that will break things.
}

function mate.liquidpromptrc () {
  mate ~/.liquidpromptrc
}

function open.liquidprompt () {
  open https://github.com/escribano/liquidprompt
}