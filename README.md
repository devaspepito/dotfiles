# archDotfiles

1. Clone the repository

```
git clone https://github.com/devaspepito/archDots.git ~
```

2. Copy the config files to .config folder

```
cp -r ~/archDots/.config/* ~/.config/
```

3. Copy the .zshrc and .tmux.conf files to home

```
cp -r ~/archDots/.zshrc ~ && cp -r ~/archDots/.tmux.conf ~
```

4. Copy powermenu and wifimenu to .local/bin folder

```
cp -r ~/archDots/.local/bin/* ~/.local/bin/
```

# Based config of dotfiles

1. Rofi theme is based on ericmurphyxyz in this [commit](https://github.com/ericmurphyxyz/dotfiles/tree/ba56c55ab756e95f4f7c0c583563c7840d3c6ce1)
2. WifiMenu and PowerMenu theme is based on ericmurphyxyz in this [commit](https://github.com/ericmurphyxyz/dotfiles/tree/ba56c55ab756e95f4f7c0c583563c7840d3c6ce1)
