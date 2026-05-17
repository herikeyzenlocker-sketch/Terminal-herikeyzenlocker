#!/data/data/com.termux/files/usr/bin/bash
# RESTORE TERMUX HERIKEYZENLOCKER - VERSI FINAL

echo "🔧 Memulai pemulihan Termux..."

# 1. Izin penyimpanan
termux-setup-storage

# 2. Update & install paket yang diperlukan
pkg update -y && pkg upgrade -y
pkg install -y git zsh figlet ruby neofetch

# 3. Install lolcat
gem install lolcat

# 4. Clone repo backup (jika folder /sdcard/termux_backup belum ada)
if [ ! -d /sdcard/termux_backup ]; then
    echo "📦 Meng-clone repository backup..."
    git clone https://github.com/herikeyzenlocker-sketch/Terminal-herikeyzenlocker.git /sdcard/termux_backup
fi

# 5. Install Oh My Zsh (jika belum) - DULUAN, agar nanti bisa timpa .zshrc
if [ ! -d ~/.oh-my-zsh ]; then
    echo "🚀 Menginstall Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 6. Salin file .zshrc custom dari backup (SETELAH Oh My Zsh)
echo "📝 Menyalin konfigurasi .zshrc custom..."
cp /sdcard/termux_backup/.zshrc ~/

# 7. Pasang plugin auto-suggestions (jika belum)
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "🔌 Memasang plugin zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# 8. Ganti shell default ke Zsh (jika belum)
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "🐚 Mengganti shell default ke zsh..."
    chsh -s zsh
fi

echo "✅ Pemulihan selesai! Silakan TUTUP Termux paksa (usap dari recent apps) lalu buka kembali."
