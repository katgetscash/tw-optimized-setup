#!/bin/bash

# add repositories
sudo zypper ar http://download.opensuse.org/repositories/games/openSUSE_Tumbleweed/ games
sudo zypper ar https://download.opensuse.org/repositories/Emulators/openSUSE_Tumbleweed/Emulators.repo
sudo zypper ar -cfp 90 https://download.opensuse.org/repositories/Emulators:Wine/openSUSE_Tumbleweed/Emulators:Wine.repo
sudo zypper refresh

# install gaming packages
sudo zypper in openarena nestopia mumble pcsxr snes9x mupen64plus-ui-console m64py wine-staging steam linuxconsoletools lutris obs-studio lutris gamemoded libgamemode0 libgamemode0-32bit

# To use with Lutris, open Lutris, navigate to Configure Wine, choose the System options tab, click Show advanced options, and under Command prefix, type gamemoderun and click Save.
# To use Gamemode with Steam games, open Steam and right click on the properties of a game, click on SET LAUNCH OPTIONS, and type in:
# <'gamemoderun %command%'>
#You can check the status of Gamemode by typing the following into a Terminal window:
# <`gamemoded -s`>

# Sources:
# <`https://www.reddit.com/r/openSUSE/comments/gfp4zg/how_to_set_up_opensuse_for_gaming/`>
# <'https://gabrielbeaver.me/2019/12/opensuse-thoughts-and-recommendations/#:~:text=gaming%3A`>
