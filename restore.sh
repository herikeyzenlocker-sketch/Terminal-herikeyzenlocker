#!/data/data/com.termux/files/usr/bin/bash
# RESTORE TERMUX HERIKEYZENLOCKER - VERSI FINAL

echo "🔧 Memulai pemulihan Termux..."

# Izin penyimpanan
termux-setup-storage

# Update & install paket yang diperlukan (tambah cmatrix, ncurses-utils, coreutils, toilet)
pkg update -y && pkg upgrade -y
pkg install -y git zsh figlet ruby cmatrix ncurses-utils coreutils toilet

# Install lolcat
gem install lolcat

# Clone repository backup (jika folder /sdcard/termux_backup belum ada)
if [ ! -d /sdcard/termux_backup ]; then
    echo "📦 Meng-clone repository backup..."
    git clone https://github.com/herikeyzenlocker-sketch/Terminal-herikeyzenlocker.git /sdcard/termux_backup
fi

# Install Oh My Zsh (jika belum)
if [ ! -d ~/.oh-my-zsh ]; then
    echo "🚀 Menginstall Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Salin file .zshrc custom
echo "📝 Menyalin konfigurasi .zshrc custom..."
cp /sdcard/termux_backup/.zshrc ~/

# Salin file .target_ascii.txt (ASCII art target)
if [ -f /sdcard/termux_backup/.target_ascii.txt ]; then
    cp /sdcard/termux_backup/.target_ascii.txt ~/
    echo "📝 Menyalin .target_ascii.txt"
fi

# Pasang plugin auto-suggestions (jika belum)
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "🔌 Memasang plugin zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# Ganti shell default ke Zsh (jika belum)
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "🐚 Mengganti shell default ke zsh..."
    chsh -s zsh
fi

echo "✅ Pemulihan selesai! Silakan TUTUP Termux paksa lalu buka kembali."
