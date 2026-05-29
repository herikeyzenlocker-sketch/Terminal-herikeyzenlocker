#!/data/data/com.termux/files/usr/bin/bash
# RESTORE TERMUX HERIKEYZENLOCKER - VERSI FINAL

echo "🔧 Memulai pemulihan Termux..."

# 1. Izin penyimpanan
termux-setup-storage

# 2. Update & upgrade
pkg update -y && pkg upgrade -y

# 3. Install paket utama
pkg install -y git zsh figlet ruby cmatrix ncurses-utils coreutils toilet

# 4. Install lolcat
gem install lolcat

# 5. Clone repository backup (jika belum ada)
if [ ! -d /sdcard/termux_backup ]; then
    echo "📦 Meng-clone repository backup..."
    git clone https://github.com/herikeyzenlocker-sketch/Terminal-herikeyzenlocker.git /sdcard/termux_backup
fi

# 6. Salin file .zshrc dan .target_ascii.txt ke home
cp /sdcard/termux_backup/.zshrc ~/
cp /sdcard/termux_backup/.target_ascii.txt ~/

# 7. Install Oh My Zsh (setujui perubahan shell)
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 8. Pasang plugin auto-suggestions
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# 9. Ganti shell default ke zsh (jika belum)
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s zsh
fi

# 10. Muat ulang konfigurasi (atau tutup Termux lalu buka lagi)
echo "✅ Pemulihan selesai! Silakan TUTUP Termux paksa lalu buka kembali."
