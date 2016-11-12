#!/bin/bash

encontext () {
  export ENCNX_NAME=$1
  export ENCNX_PATH=$(pwd)
}

# edit in context
alias e='mvim --servername $ENCNX_NAME --remote-silent'
# cd in context
alias c='cd $ENCNX_PATH'
alias w='echo $ENCNX_PATH'
alias n='echo $ENCNX_NAME'
