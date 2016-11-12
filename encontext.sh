#!/bin/bash

__encontext_sanitize() {
  __context=${1//[^a-zA-Z0-9]/} # http://stackoverflow.com/questions/89609/in-a-bash-script-how-do-i-sanitize-user-input
}

__encontext_create() {
  mkdir -p ~/.encontext
  __encontext_sanitize $1
  ln -s $(pwd -P) ~/.encontext/$__context
  (>&2 echo "creating new context ${1}") # http://stackoverflow.com/questions/2990414/echo-that-outputs-to-stderr
}

encontext () {
  __encontext_sanitize $1
  (cd -P ~/.encontext/$__context) || __encontext_create $__context
  export ENCNX_NAME=$__context
  export ENCNX_PATH=$(pwd -P)
}


# edit in context
alias e='mvim --servername $ENCNX_NAME --remote-silent'
# cd in context
alias c='cd $ENCNX_PATH'
alias w='echo $ENCNX_PATH'
alias n='echo $ENCNX_NAME'
