# HELLSINKI Theme for Termux

Tema terminal Termux dengan banner pixel art berwarna, info panel, dan prompt custom.

## Preview

```
  ──────────────────────────────────────────

  [H][E][L][L][S][I][N][K][I]  ← pixel art berwarna

  ┌──────────────────────────────────────┐
  [•] Notifikasi    : Selamat Malam
  [•] Sekarang Jam  : 20:35:34
  [•] Sekarang Hari : Jumat, 29 Mei 2026
  [•] Whoami anda   : root
  └──────────────────────────────────────┘

  ──────────────────────────────────────────

┌─[20:35:34]─────[root]───[0]
└─[~]─► 
```

## Cara Install

### 1. Clone repo
```bash
git clone https://github.com/USERNAME/hellsinki-theme.git
cd hellsinki-theme
```

### 2. Jalankan installer
```bash
bash install.sh
```

### 3. Restart Termux
Tutup dan buka ulang Termux, atau:
```bash
source ~/.bashrc
```

## Install Manual (tanpa clone)

Kalau mau install manual saja:

```bash
# Buat folder
mkdir -p ~/.hellsinki

# Copy file
cp banner.sh ~/.hellsinki/
cp prompt.sh ~/.hellsinki/
chmod +x ~/.hellsinki/banner.sh
chmod +x ~/.hellsinki/prompt.sh

# Tambah ke .bashrc
echo 'source "$HOME/.hellsinki/prompt.sh"' >> ~/.bashrc
echo 'bash "$HOME/.hellsinki/banner.sh"'   >> ~/.bashrc

# Terapkan
source ~/.bashrc
```

## Uninstall

```bash
# Hapus folder
rm -rf ~/.hellsinki

# Hapus baris dari .bashrc (hapus bagian antara === HELLSINKI THEME === dan === END HELLSINKI THEME ===)
nano ~/.bashrc
```

## Fitur

- Pixel art **HELLSINKI** berwarna (merah → oranye → pink → ungu)
- Info panel otomatis: salam sesuai waktu, jam real-time, tanggal, username
- Prompt dua baris dengan box-drawing characters
- Gradient separator line atas dan bawah
- Support Termux (Android) dan Linux biasa

## Requirements

- Bash 4+
- Terminal dengan dukungan True Color (Termux sudah support)
