# ===============================
#  CYBER EXPLORE TERMINAL vFINAL
# ===============================

# Fungsi loading bar dengan step 10% dan blok █
loading_bar() {
    echo ""
    echo -e "\e[1;31mBERANI\e[0m \e[1;97mBEBAS BERKARYA\e[0m"
    echo ""
    local width=40
    for i in {0..100..10}; do
        percent=$i
        filled=$((percent * width / 100))
        bar=$(printf "%${filled}s" | tr ' ' '█')
        spaces=$((width - filled))
        printf "\r\e[1;31m[ SYSTEM LOADING ]\e[0m ➜ \e[1;97m[%s%${spaces}s] %3d%%\e[0m" "$bar" "" "$percent"
        sleep 0.1
    done
    echo ""
    echo ""
}

# Tampilkan figlet besar (merah untuk Cyber Explore, putih untuk HeriKeyzenlocker)
show_banner() {
    echo -e "\e[1;31m$(figlet -f standard "Cyber Explore")\e[0m"
    echo -e "\e[1;97m$(figlet -f standard "HeriKeyzenlocker")\e[0m"
}

# Tampilkan semua elemen
show_full() {
    command clear
    show_banner
    echo -e "\e[1;31m============================================================\e[0m"
    cat ~/.target_ascii.txt
    echo -e "\e[1;31m============================================================\e[0m"
    loading_bar
    echo -e "\e[1;31m============================================================\e[0m"
    echo "Selamat datang di terminal HeriKeyzenlocker" | lolcat
    echo "ketika perintah atau command" | lolcat
    echo -e "\e[1;31m============================================================\e[0m"
}

# Pertama kali buka Termux
show_full

# Override clear (loading bar muncul lagi)
alias clear='show_full'

# Oh My Zsh & plugin
export ZSH="$HOME/.oh-my-zsh"
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
    ZSH_THEME="robbyrussell"
    plugins=(git zsh-autosuggestions)
    source $ZSH/oh-my-zsh.sh
fi

# Prompt merah putih dua baris
PROMPT="%F{red}┌─[%F{white}⌐■_■%F{red}]─[%F{white}CyberExplore%F{red}@%F{white}HeriKeyzenlocker%F{red}]─[%F{white}%~%F{red}]─%F{white}➜%f
%F{red}└─[%F{white}::%F{red}]──>%f "
