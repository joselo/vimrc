#!/bin/sh
# vimrc install script

# Check that Git is actually present
if ! git --version >/dev/null 2>&1; then
  echo "You need to install Git to clone the vimrc repository."
  exit 1
fi

# Check that Curl is present too
if ! curl --version >/dev/null 2>&1; then
  echo "You need to install Curl to download vim-plug."
  exit 1
fi

# Clone and install configuration.
echo 'Downloading vim-plug...'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Execute install.
if vim --version >/dev/null 2>&1; then
  vim +PlugInstall +qall
else
  echo "You don't have Vim installed at this moment."
    echo "Please, install it, then run:"
    echo "  vim +PlugInstall +qall"
fi

echo "REQUIREMENTS"
echo "------------"
echo ""
echo "Please Install the next tools"
echo ""
echo "- silversearcher-ag   # Ubuntu: sudo apt install silversearcher-ag"
echo "- bat                 # Ubuntu sudo apt install apt install bat"
echo "- fzf                 # git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install"
