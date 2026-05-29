#!/bin/bash
# ============================================
#   HELLSINKI THEME - Termux Banner
#   by Yahye Abdirahman
# ============================================

# ANSI True Color helper
rgb() { printf "\033[38;2;%s;%s;%sm" "$1" "$2" "$3"; }
bg()  { printf "\033[48;2;%s;%s;%sm" "$1" "$2" "$3"; }
RST='\033[0m'
BOLD='\033[1m'

# Pixel art block character
B="  "   # filled block (uses background color)
O="  "   # empty (transparent)

# ---- Pixel font (5×6 each letter, drawn row by row) ----
# Color per letter [R G B]
declare -A LC
LC[H]="255 45 0"
LC[E]="255 85 0"
LC[L0]="255 136 0"
LC[L1]="255 179 0"
LC[S]="255 45 120"
LC[I0]="221 0 255"
LC[N]="170 0 255"
LC[K]="255 0 102"
LC[I1]="255 68 0"

# Each letter: 6 rows × 5 cols (1=filled, 0=empty)
declare -A LR
LR[H,0]="10001"
LR[H,1]="10001"
LR[H,2]="11111"
LR[H,3]="10001"
LR[H,4]="10001"
LR[H,5]="10001"

LR[E,0]="11111"
LR[E,1]="10000"
LR[E,2]="11110"
LR[E,3]="10000"
LR[E,4]="10000"
LR[E,5]="11111"

LR[L0,0]="10000"
LR[L0,1]="10000"
LR[L0,2]="10000"
LR[L0,3]="10000"
LR[L0,4]="10000"
LR[L0,5]="11111"

LR[L1,0]="10000"
LR[L1,1]="10000"
LR[L1,2]="10000"
LR[L1,3]="10000"
LR[L1,4]="10000"
LR[L1,5]="11111"

LR[S,0]="01111"
LR[S,1]="10000"
LR[S,2]="01110"
LR[S,3]="00001"
LR[S,4]="00001"
LR[S,5]="11110"

LR[I0,0]="11111"
LR[I0,1]="00100"
LR[I0,2]="00100"
LR[I0,3]="00100"
LR[I0,4]="00100"
LR[I0,5]="11111"

LR[N,0]="10001"
LR[N,1]="11001"
LR[N,2]="10101"
LR[N,3]="10011"
LR[N,4]="10001"
LR[N,5]="10001"

LR[K,0]="10010"
LR[K,1]="10100"
LR[K,2]="11000"
LR[K,3]="11000"
LR[K,4]="10100"
LR[K,5]="10010"

LR[I1,0]="11111"
LR[I1,1]="00100"
LR[I1,2]="00100"
LR[I1,3]="00100"
LR[I1,4]="00100"
LR[I1,5]="11111"

# Letter order & keys
LETTERS=("H" "E" "L0" "L1" "S" "I0" "N" "K" "I1")

# Draw pixel art banner
draw_banner() {
  for row in 0 1 2 3 4 5; do
    printf "  "
    for key in "${LETTERS[@]}"; do
      read -r r g b <<< "${LC[$key]}"
      rowdata="${LR[$key,$row]}"
      for (( col=0; col<5; col++ )); do
        pixel="${rowdata:$col:1}"
        if [[ "$pixel" == "1" ]]; then
          printf "$(bg $r $g $b)  ${RST}"
        else
          printf "  "
        fi
      done
      printf " "
    done
    printf "\n"
  done
}

# ---- Info helpers ----
get_greeting() {
  local h; h=$(date +%H)
  if   (( h < 11 )); then echo "Selamat Pagi"
  elif (( h < 15 )); then echo "Selamat Siang"
  elif (( h < 18 )); then echo "Selamat Sore"
  else echo "Selamat Malam"
  fi
}

info_row() {
  local label="$1" value="$2" vcolor="$3"
  printf "  \033[38;2;80;0;0m[\033[38;2;255;68;68m•\033[38;2;80;0;0m] \033[38;2;255;136;136m%-14s\033[38;2;80;0;0m: ${RST}${vcolor}%s${RST}\n" "$label" "$value"
}

# ---- Main ----
clear

# Gradient separator line (top)
printf "  "
for i in $(seq 1 42); do
  r=$(( 255 * i / 42 ))
  g=$(( i < 21 ? i * 8 : (42 - i) * 4 ))
  b=$(( 255 - r ))
  printf "$(rgb $r $g $b)─${RST}"
done
printf "\n\n"

# HELLSINKI pixel banner
draw_banner

printf "\n"

# Info panel border top
printf "  \033[38;2;60;0;0m┌"
printf '%.0s─' {1..38}
printf "┐${RST}\n"

# Info rows
info_row "Notifikasi"   "$(get_greeting)"           "\033[1;37m"
info_row "Sekarang Jam" "$(date '+%H:%M:%S')"        "\033[38;2;255;68;68m"
info_row "Sekarang Hari" "$(date '+%A, %d %B %Y')"  "\033[1;37m"
info_row "Whoami anda"  "$(whoami)"                  "\033[38;2;255;68;68m"

# Info panel border bottom
printf "  \033[38;2;60;0;0m└"
printf '%.0s─' {1..38}
printf "┘${RST}\n\n"

# Gradient separator line (bottom)
printf "  "
for i in $(seq 1 42); do
  r=$(( 255 - 255 * i / 42 ))
  g=$(( i < 21 ? i * 4 : (42 - i) * 8 ))
  b=$(( 255 * i / 42 ))
  printf "$(rgb $r $g $b)─${RST}"
done
printf "\n\n"
