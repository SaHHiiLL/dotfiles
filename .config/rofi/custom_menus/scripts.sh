dir="$HOME/.config/rofi/custom_menus"
theme='real_style.rasi'

style_path=$dir/$theme


rofi_cmd() {

    if [ $XDG_CURRENT_DESKTOP = "sway" ]; then
        /home/Sahil/GitClones/rofi/build/rofi -dmenu \
        -p "" \
        -theme $style_path 
    elif [ $XDG_CURRENT_DESKTOP = "Hyprland" ]; then
        /home/Sahil/GitClones/rofi/build/rofi -dmenu \
        -p "" \
        -theme $style_path 
    else
        rofi -dmenu \
        -p "" \
        -theme $style_path 
    fi
}

input=$(rofi_cmd)

if [[ -n $input ]]; then
  zen-browser --new-tab "https://www.google.com/search?client=firefox-b-d&q=$(echo $input | jq -sRr @uri)" &
fi
