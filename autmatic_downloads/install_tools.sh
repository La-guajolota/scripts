#!/usr/bin/env bash
set -e

echo "Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y

echo "Instalando herramientas básicas..."
sudo apt install -y tmux nmap cmatrix btop network-manager nala apt-transport-https curl git

echo "Instalando Brave Browser..."
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg \
  https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] \
https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

echo "Instalando Fastfetch…"
if command -v fastfetch >/dev/null 2>&1; then
  echo "Fastfetch ya está instalado: $(fastfetch --version)"
else
  sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
  sudo apt update
  sudo apt install -y fastfetch
fi

echo "Instalando cava…"
sudo apt install -y cava

echo "Instalando duf…"
if command -v duf >/dev/null 2>&1; then
  echo "duf ya está instalado: $(duf --version)"
else
  if sudo apt install -y duf; then
    echo "duf instalado vía apt: $(duf --version)"
  else
    ARCH=$(dpkg --print-architecture)
    VERSION=$(curl -s https://api.github.com/repos/muesli/duf/releases/latest | grep -Po '"tag_name": "v\K[0-9\.]+')
    URL="https://github.com/muesli/duf/releases/download/v${VERSION}/duf_${VERSION}_linux_${ARCH}.deb"
    curl -Lo "duf_${VERSION}.deb" "$URL"
    sudo apt install -y ./"duf_${VERSION}.deb"
    rm "duf_${VERSION}.deb"
    echo "duf instalado desde release: $(duf --version)"
  fi
fi

echo "Instalando Rust (rustc y cargo)…"
if command -v rustc >/dev/null && command -v cargo >/dev/null; then
  echo "Rust ya está instalado: $(rustc --version), cargo $(cargo --version)"
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
  echo "Rust instalado: $(rustc --version), cargo $(cargo --version)"
fi

echo "Instalando chafa…"
if command -v chafa >/dev/null; then
  echo "chafa ya está instalado: $(chafa --version)"
else
  sudo apt install -y chafa || sudo snap install chafa --candidate
  echo "chafa instalado: $(chafa --version)"
fi

echo "Instalando Zsh y Oh My Zsh…"
if ! command -v zsh >/dev/null; then
  sudo apt install -y zsh
  echo "Zsh instalado: $(zsh --version)"
else
  echo "Zsh ya instalado: $(zsh --version)"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  echo "Oh My Zsh instalado."
else
  echo "Oh My Zsh ya existe"
fi

ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
for plugin in zsh-autosuggestions zsh-syntax-highlighting zsh-completions; do
  git clone "https://github.com/zsh-users/$plugin.git" "$ZSH_CUSTOM/plugins/$plugin" 2>/dev/null || echo "Plugin $plugin ya existe"
done

sed -i '/^plugins=/d' ~/.zshrc
echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)' >> ~/.zshrc

chsh -s "$(which zsh)" || echo "Fallo al cambiar shell; ejecútalo manualmente."

echo "Instalando tldr (TLDR Pages)…"
if command -v tldr >/dev/null 2>&1; then
  echo "tldr ya está instalado: $(tldr --version)"
else
  if sudo apt install -y tldr; then
    echo "tldr instalado vía apt: $(tldr --version)"
  else
    sudo snap install tldr
    echo "tldr instalado vía snap: $(tldr --version)"
  fi
fi

# ===== NUEVA SECCIÓN AÑADIDA =====
echo "Instalando FreeCAD…"
sudo apt install -y freecad
# ================================

echo ""
echo "Instalación completada. Versiones instaladas:"
echo "tmux: $(tmux --version)"
echo "nmcli: $(nmcli --version)"
echo "nmap: $(nmap --version | head -n1)"
echo "btop: $(btop --version)"
echo "cmatrix: $(cmatrix -V || echo 'sin versión')"
echo "nala: $(nala --version)"
echo "fastfetch: $(fastfetch --version || echo 'sin versión')"
echo "cava: $(cava --version || echo 'sin versión')"
echo "duf: $(duf --version || echo 'sin versión')"
echo "rustc: $(rustc --version || echo 'sin versión')"
echo "cargo: $(cargo --version || echo 'sin versión')"
echo "chafa: $(chafa --version || echo 'sin versión')"
echo "zsh: $(zsh --version || echo 'sin versión')"
echo "Oh My Zsh: $(basename ~/.oh-my-zsh)"
echo "tldr: $(tldr --version || echo 'sin versión')"
# ===== NUEVA LÍNEA AÑADIDA =====
echo "FreeCAD: $(freecad --version 2>/dev/null | head -n1 || echo 'sin versión')"
# ================================
echo ""
echo "Consejos:"
echo "- Usa 'tldr <comando>' para ver ejemplos sencillos."
echo "- Actualiza cache de tldr con 'tldr --update'."
echo "- Para aplicar Zsh, inicia nueva sesión o ejecuta 'exec zsh'."
echo "¡Listo!"