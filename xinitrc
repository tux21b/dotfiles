setxkbmap de
xset s 3600 3600	
feh --no-xinerama --bg-scale "$HOME/.wallpaper.png"
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
gnome-settings-daemon &
exec dbus-launch --exit-with-session i3
