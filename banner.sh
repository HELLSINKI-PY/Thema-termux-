#!/bin/bash
# ============================================
#   HELLSINKI THEME - Termux Banner
# ============================================

RED='\033[38;2;255;68;68m'
DIM='\033[38;2;74;0;0m'
PIK='\033[38;2;255;136;136m'
WHT='\033[1;37m'
RST='\033[0m'

# ---- Waktu WITA (UTC+8) ----
get_wita() {
  TZ='Asia/Makassar' date '+%H:%M:%S'
}
get_wita_hour() {
  TZ='Asia/Makassar' date '+%H'
}
get_hari() {
  TZ='Asia/Makassar' LC_TIME=id_ID.UTF-8 date '+%A, %d %B %Y' 2>/dev/null \
    || TZ='Asia/Makassar' date '+%A, %d %B %Y'
}

# ---- Greeting berdasarkan jam ----
get_greeting() {
  local h; h=$(get_wita_hour)
  h=$((10#$h))
  if   (( h <  5 )); then echo "Selamat Dini Hari"
  elif (( h < 11 )); then echo "Selamat Pagi"
  elif (( h < 15 )); then echo "Selamat Siang"
  elif (( h < 18 )); then echo "Selamat Sore"
  else echo "Selamat Malam"
  fi
}

# ---- Deteksi merek HP ----
get_phone() {
  local brand model
  if command -v getprop &>/dev/null; then
    brand=$(getprop ro.product.brand 2>/dev/null)
    model=$(getprop ro.product.model 2>/dev/null)
    if [[ -n "$brand" && -n "$model" ]]; then
      echo "$brand $model"
      return
    elif [[ -n "$brand" ]]; then
      echo "$brand"
      return
    fi
  fi
  if [[ -f /proc/cpuinfo ]]; then
    local hw; hw=$(grep -i "Hardware" /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)
    [[ -n "$hw" ]] && echo "$hw" && return
  fi
  echo "Android Device"
}

# ---- Separator dashed ----
sep() {
  printf "  ${DIM}"
  printf '─%.0s' {1..40}
  printf "${RST}\n"
}

# ---- Info row ----
info_row() {
  local label="$1" value="$2" vcolor="$3"
  printf "  ${DIM}[${RED}•${DIM}] ${PIK}%-16s${DIM}: ${RST}${vcolor}%s${RST}\n" "$label" "$value"
}

# ---- Main ----
clear

printf "\n"

# Info panel top border
printf "  ${DIM}┌"
printf '─%.0s' {1..38}
printf "┐${RST}\n"

info_row "Notifikasi"      "$(get_greeting)"        "$WHT"
info_row "Sekarang Jam"    "$(get_wita) WITA"        "$RED"
info_row "Sekarang Hari"   "$(get_hari)"             "$WHT"
info_row "Handphone anda"  "$(get_phone)"            "${PIK}"

# Info panel bottom border
printf "  ${DIM}└"
printf '─%.0s' {1..38}
printf "┘${RST}\n"

printf "\n"
sep
printf "\n"
