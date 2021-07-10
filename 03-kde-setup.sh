#!/bin/bash
ln /usr/bin/kioclient5 /usr/bin/kfmclient
ln /usr/bin/kwriteconfig5 /usr/bin/kwriteconfig
ln -s /etc/mime.types /home/kat/.config/mimeapps.list
xdg-mime default org.opensuse.yast.Packager.desktop application/x-rpm
xdg-settings set default-web-browser chromium.desktop
echo -e "## Manually set NightColor color correction by plasmoid control widget. ##"
kwriteconfig5 --file ksmserverrc \
    --group "General" \
        --key "loginMode" default
kwriteconfig5 --file kwinrc \
    --group "TabBox" \
        --key "HighlightWindows" false
kwriteconfig5 --file kwinrc \
    --group "TabBox" \
        --key "LayoutName" thumbnail_grid
kwriteconfig5 --file kwinrc \
    --group "TabBox" \
        --key "DelayTime" 0
kwriteconfig5 --file kwinrc \
    --group "Windows" \
        --key "BorderlessMaximizedWindows" true
kwriteconfig5 --file kwinrc \
    --group "ModifierOnlyShortcuts" \
        --key "Meta" \
            ["org.kde.kglobalaccel,/component/krunner_desktop,org.kde.kglobalaccel.Component,invokeShortcut,_launch"]
kwriteconfig5 --file kwinrc \
    --group "Compositing" \
        --key "AnimationSpeed" 0
kwriteconfig5 --file kwinrc \
    --group Plugins \
        --key "slidingpopupsEnabled" \
            --type "bool" false
kwriteconfig5 --file emaildefaults \
    --group "Defaults" \
        --key "Profile" default
kwriteconfig5 --file emaildefaults \
    --group "PROFILE_Default" \
        --key "EmailClient" \
            ["/usr/bin/thunderbird %u"]
kwriteconfig5 --file emaildefaults \
    --group "PROFILE_Default" \
        --key "TerminalClient" \
            --type "bool" false
kwriteconfig5 --file breezerc \
    --group "Common" \
        --key "ShadowSize" ShadowSmall
kwriteconfig5 --file kcmshell5rc \
    --group "Basic Settings" \
        --key "Indexing-Enabled" false
kwriteconfig5 --file baloofilerc \
    --group "Basic Settings" \
        --key "Indexing-Enabled" false
kwriteconfig5 --file kscreenlockerrc \
    --group "Greeter" --group "LnF" --group "General" \
        --key "showMediaControls" \
            --type "bool" false
kwriteconfig5 --file okularpartrc \
    --group "Core General" \
        --key "ObeyDRM" \
            --type "bool" false
kwriteconfig5 --file okularpartrc \
    --group "General" \
        --key "ShellOpenFileInTabs" \
            --type "bool" true
kwriteconfig5 --file yakuakerc \
    --group "Animation" \
        --key 'Frames' 0
kwriteconfig5 --file kdeglobals \
    --group "KDE" \
        --key "SingleClick" false
kwriteconfig5 --file kdeglobals \
    --group "General" \
        --key "fixed" \
            "IBM Plex Mono,9,-1,5,50,0,0,0,0,0"
kwriteconfig5 --file kdeglobals \
    --group "General" \
        --key "font" \
            "IBM Plex Sans,10,-1,5,50,0,0,0,0,0"
kwriteconfig5 --file kdeglobals \
    --group "General" \
        --key "menuFont" \
        "IBM Plex Sans,9,-1,5,50,0,0,0,0,0"
kwriteconfig5 --file kdeglobals \
    --group "General" \
        --key "smallestReadableFont" \
            "IBM Plex Sans,8,-1,5,50,0,0,0,0,0"
kwriteconfig5 --file kdeglobals \
    --group "General" \
        --key "toolBarFont" \
            "IBM Plex Sans,9,-1,5,50,0,0,0,0,0"
kwriteconfig5 --file kwinrc \
    --group "Windows" \
        --key "FocusPolicy" FocusFollowsMouse
kwriteconfig5 --file kwinrc \
    --group "Windows" \
        --key "AutoRaise" true
kwriteconfig5 --file kwinrc \
    --group "Windows" \
        --key "AutoRaiseInterval" 500
kwriteconfig5 --file kwinrc \
    --group "Windows" \
        --key "DelayFocusInterval" 500
kwriteconfig5 --file kwinrc \
    --group "Windows" \
        --key "FocusStealingPreventionLevel" 2
