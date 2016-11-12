#!/bin/bash

encontext () {
  context=${1//[^a-zA-Z0-9]/} # http://stackoverflow.com/questions/89609/in-a-bash-script-how-do-i-sanitize-user-input
  context_path=~/.encontext/$context

  if [ -d $context_path ]
  then
    cd -P $context_path
  else
    mkdir -p ~/.encontext
    ln -s $(pwd -P) $context_path
    (>&2 echo "creating new context ${context}") # http://stackoverflow.com/questions/2990414/echo-that-outputs-to-stderr
  fi
  export ENCNX_NAME=$context
  export ENCNX_PATH=$(pwd -P)
}


# edit in context
alias e='mvim --servername $ENCNX_NAME --remote-silent'
# cd in context
alias c='cd $ENCNX_PATH'
alias w='echo $ENCNX_PATH'
alias n='echo $ENCNX_NAME'
alias x='echo $ENCNX_NAME $ENCNX_PATH'
