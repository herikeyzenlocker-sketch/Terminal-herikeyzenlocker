#!/data/data/com.termux/files/usr/bin/bash
# RESTORE TERMUX HERIKEYZENLOCKER

echo "🔧 Memulai pemulihan Termux..."

# Minta izin akses penyimpanan
termux-setup-storage

# Update dan install paket
pkg update -y && pkg install -y git zsh figlet ruby neofetch

# Install lolcat
gem install lolcat

# Clone repository backup (jika belum)
if [ ! -d /sdcard/termux_backup ]; then
    git clone https://github.com/herikeyzenlocker-sketch/termux-herikeyzenlocker.git /sdcard/termux_backup
fi

# Salin file konfigurasi Zsh
cp /sdcard/termux_backup/.zshrc ~/

# Install Oh My Zsh (jika belum)
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Pasang plugin auto-suggestions (jika belum)
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Ganti shell default ke Zsh (jika belum)
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s zsh
fi

echo "✅ Pemulihan selesai! Silakan tutup Termux dan buka kembali."
