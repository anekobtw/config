# nvim
before copying the config, install lazy.nvim first

```
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
```

# nvidia problems
i’ve been getting a black screen after closing the lid, likely due to nvidia not handling suspend properly with wayland. i couldn't fix the issue, so i’ve disabled lid-triggered suspend completely.

```
sudo nano /etc/systemd/logind.conf
```

add this:

```
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```

restart
```
sudo systemctl restart systemd-logind
```

# minimal sddm setup
copy the included configs:

```
sudo install -Dm644 sddm/10-minimal.conf /etc/sddm.conf.d/10-minimal.conf
sudo install -Dm644 sddm/breeze.theme.conf.user /usr/share/sddm/themes/breeze/theme.conf.user
```

then restart sddm (or reboot):

```
sudo systemctl restart sddm
```

