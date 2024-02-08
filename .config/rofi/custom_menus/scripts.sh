dir="$HOME/.config/rofi/custom_menus"
theme='real_style.rasi'

style_path=$dir/$theme


rofi_cmd() {
	rofi -dmenu \
    -p "" \
		-theme $style_path 
}

input=$(rofi_cmd)

if [[ -n $input ]]; then
  firefox --new-tab "https://www.google.com/search?client=firefox-b-d&q=$(echo $input | jq -sRr @uri)" &
fi
