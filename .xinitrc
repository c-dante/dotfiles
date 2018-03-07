# Start gnome
exec gnome-session

# Hack to fix pulse audio
pulseaudio -k
pulseaudio --start

