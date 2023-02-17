#~/.startup.sh

setxkbmap -layout us,il,ru -option grp:alt_shift_toggle


params_bool_enable=(
"Tapping Enabled" 
"Natural Scrolling Enabled" 
"Middle Emulation Enabled" 
)

Touchpad_ID=` xinput | grep Touchpad | awk ' {print substr($6, 4, 5)} ' `

for value in "${params_bool_enable[@]}"; do 
	xinput set-prop $Touchpad_ID `xinput list-props $Touchpad_ID | grep "$value (" | awk '{	print substr($0, index($0, "(")+1, 3) }';` 1
done

# De-cache dmenu
rm ~/.cache/dmenu_run

/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
# /usr/bin/pw-jack &
/usr/bin/wireplumber &

~/.fehbg &
slstatus &

# Load xresources file
xrdb ~/.Xresources

while :; do
	ssh-agent dwm
done
