# Custom Terminal Prompt
# Help: https://www.howtogeek.com/307701/how-to-customize-and-colorize-your-bash-prompt/
call_before_the_prompt () {
  if [ $? -eq 0 ]; then # set an error string for the prompt, if applicable
      __PROMPT_RETURN_INDICATOR="";
  else
      __PROMPT_RETURN_INDICATOR="⚠️  ";
  fi;

  __PROMPT_BRANCH="";
  __PROMPT_PREPEND="";
  if git branch &>/dev/null; then
    __PROMPT_BRANCH=$(git branch 2>/dev/null | grep \* |  cut -d " " -f 2);
    __PROMPT_PREPEND=" @ ";
  fi;
}

export PROMPT_COMMAND=call_before_the_prompt
export PS1='\[\e[0;32m\][\w]\[\e[0;37m\]$__PROMPT_PREPEND\[\e[1;35m\]$__PROMPT_BRANCH\[\e[0m\]\n$__PROMPT_RETURN_INDICATOR\[\e[1;36m\]\u \[\e[1;33m\]➜\[\e[0m\]  '

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH=/usr/local/bin:$PATH
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Code
source /usr/local/bin/virtualenvwrapper.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"
