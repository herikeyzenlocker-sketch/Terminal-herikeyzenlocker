clear
figlet "Cyber Explore" | lolcat
figlet "HeriKeyzenlocker" | lolcat
echo "============================================================" | lolcat
cat ~/.troot_ascii.txt | lolcat
echo "============================================================" | lolcat
echo "Selamat datang di terminal HeriKeyzenlocker" | lolcat
echo "ketika perintah atau command" | lolcat
echo "============================================================" | lolcat

# Fungsi anti-clear (sama seperti di atas)
clear() {
    command clear
    figlet "Cyber Explore" | lolcat
    figlet "HeriKeyzenlocker" | lolcat
    echo "============================================================" | lolcat
    cat ~/.troot_ascii.txt | lolcat
    echo "============================================================" | lolcat
    echo "Selamat datang di terminal HeriKeyzenlocker" | lolcat
    echo "ketika perintah atau command" | lolcat
    echo "============================================================" | lolcat
}

# Oh My Zsh & plugin
export ZSH="$HOME/.oh-my-zsh"
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
    ZSH_THEME="robbyrussell"
    plugins=(git zsh-autosuggestions)
    source $ZSH/oh-my-zsh.sh
fi

# Prompt kustom
PROMPT="%F{green}%n%f@%F{blue}%m%f:%F{cyan}%~%f➜ "
