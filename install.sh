#!/bin/bash
# ============================================
#   HELLSINKI THEME - Auto Installer
#   Run: bash install.sh
# ============================================

RED='\033[38;2;255;68;68m'
GRN='\033[38;2;0;255;65m'
YLW='\033[38;2;255;179;0m'
DIM='\033[38;2;80;0;0m'
RST='\033[0m'

log()  { printf "${DIM}[${RED}•${DIM}]${RST} $1\n"; }
ok()   { printf "${DIM}[${GRN}✓${DIM}]${RST} $1\n"; }
warn() { printf "${DIM}[${YLW}!${DIM}]${RST} $1\n"; }

INSTALL_DIR="$HOME/.hellsinki"
BASHRC="$HOME/.bashrc"

echo ""
printf "${RED}  ██╗  ██╗███████╗██╗     ██╗     ███████╗██╗███╗  ██╗██╗  ██╗██╗${RST}\n"
printf "${RED}  ██║  ██║██╔════╝██║     ██║     ██╔════╝██║████╗ ██║██║ ██╔╝██║${RST}\n"
printf "${RED}  ███████║█████╗  ██║     ██║     ███████╗██║██╔██╗██║█████╔╝ ██║${RST}\n"
printf "${RED}  ██╔══██║██╔══╝  ██║     ██║     ╚════██║██║██║╚████║██╔═██╗ ██║${RST}\n"
printf "${RED}  ██║  ██║███████╗███████╗███████╗███████║██║██║ ╚███║██║  ██╗██║${RST}\n"
printf "${RED}  ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝╚═╝╚═╝  ╚══╝╚═╝  ╚═╝╚═╝${RST}\n"
echo ""
printf "  ${DIM}Theme Installer — Termux Edition${RST}\n"
echo ""

# 1. Create install directory
log "Membuat direktori instalasi..."
mkdir -p "$INSTALL_DIR"
ok "Direktori: $INSTALL_DIR"

# 2. Copy scripts
log "Menyalin file..."
cp "$(dirname "$0")/banner.sh"  "$INSTALL_DIR/banner.sh"
cp "$(dirname "$0")/prompt.sh"  "$INSTALL_DIR/prompt.sh"
chmod +x "$INSTALL_DIR/banner.sh"
chmod +x "$INSTALL_DIR/prompt.sh"
ok "File disalin"

# 3. Patch .bashrc
MARKER="# === HELLSINKI THEME ==="
if grep -q "$MARKER" "$BASHRC" 2>/dev/null; then
  warn ".bashrc sudah ada entry HELLSINKI, skip patch."
else
  log "Menambahkan ke .bashrc..."
  cat >> "$BASHRC" << EOF

$MARKER
source "\$HOME/.hellsinki/prompt.sh"
bash "\$HOME/.hellsinki/banner.sh"
# === END HELLSINKI THEME ===
EOF
  ok ".bashrc diperbarui"
fi

echo ""
printf "  ${GRN}✓ Instalasi selesai!${RST}\n"
printf "  Restart Termux atau jalankan:  ${YLW}source ~/.bashrc${RST}\n"
echo ""
