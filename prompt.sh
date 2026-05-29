#!/bin/bash
# ============================================
#   HELLSINKI THEME - Custom Prompt
#   Source this file in ~/.bashrc
# ============================================

# ANSI colors
_RED='\[\033[38;2;255;68;68m\]'
_DIM='\[\033[38;2;80;0;0m\]'
_WHITE='\[\033[1;37m\]'
_RST='\[\033[0m\]'

# Build the two-line prompt
hellsinki_prompt() {
  local TIME; TIME=$(date '+%H:%M:%S')
  local DIR; DIR=$(dirs +0)
  local EXIT=$?

  # Line 1: ┌─[time]─────[user]───[exit]
  PS1="${_DIM}┌─[${_RED}${TIME}${_DIM}]─────[${_RED}\u${_DIM}]───[${_RED}${EXIT}${_DIM}]\n"
  # Line 2: └─[path]─►
  PS1+="${_DIM}└─[${_WHITE}${DIR}${_DIM}]─►${_RST} "
}

PROMPT_COMMAND=hellsinki_prompt
