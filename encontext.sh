#!/bin/bash

encontext () {
  context=${1//[^a-zA-Z0-9]/} # http://stackoverflow.com/questions/89609/in-a-bash-script-how-do-i-sanitize-user-input
  context_path=~/.encontext/contexts/$context

  if [ -d $context_path ]
  then
    cd -P $context_path
  else
    mkdir -p ~/.encontext/contexts
    ln -s $(pwd -P) $context_path
    (>&2 echo "creating new context ${context}") # http://stackoverflow.com/questions/2990414/echo-that-outputs-to-stderr
  fi
  export ENCONTEXT_NAME=$context
  export ENCONTEXT_PATH=$(pwd -P)
}


# edit in context
alias e='mvim --servername $ENCONTEXT_NAME --remote-silent'
# cd in context
alias c='cd $ENCONTEXT_PATH'
alias x='echo ENCONTEXT_NAME=$ENCONTEXT_NAME ENCONTEXT_PATH=$ENCONTEXT_PATH'
