#!/bin/bash
# baraction.sh script for spectrwm status bar

SLEEP_SEC=5  # set bar_delay = 5 in /etc/spectrwm.conf

function Volume() {
    echo "VOL: +@fg=0;$(awk -F"[][]" '/dB/ { print $2 }' <(pulsemixer sget Master))+@fg=2;"
}

Battery() {
    batt="/sys/class/power_supply/BAT0"

    capac="$(cat "$batt"/capacity)"
    bstatus="$(cat "$batt"/status)"

    bstat="$(echo "$bstatus" | sed 's/Charging/↑/;s/Discharging/↓/;s/Full//;s/Unknown//')"

    echo "+@fg=0;BAT: $bstat$capac%+@fg=5;"
}

WiFi() {
	ssid=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\: -f2)
        if [ -z $ssid ]; then ssid="None"; fi
	echo "WIFI: +@fg=0;$ssid+@fg=5;"
}

#loops forever outputting a line every SLEEP_SEC secs
while :; do
    echo " $(WiFi) // $(Battery)"
    sleep $SLEEP_SEC
done
