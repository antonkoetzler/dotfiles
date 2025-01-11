#!/bin/bash

# File to updates:
# 1. os
# 2. ~
# 3. ~/.config/nvim
# 4. Flutter

cd ~
flutter upgrade
git pull
cd .config/nvim
git pull
cd ../..
yay -Syu
