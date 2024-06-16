#!/usr/bin/env bash

critical="󰂎"
one_fourths="󱊡"
half="󱊢"
three_fourths="󱊣"

c_critical="󰢟"
c_one_fourths="󱊤"
c_half="󱊥"
c_three_fourths="󱊦"

if [[ `ls /sys/class/power_supply/BAT* 2> /dev/null | wc -l` != "0" ]]; then
  battery_status="$(acpi -b)"
  charging_status=0
  charge=`echo $battery_status | cut -d: -f2- | cut -d, -f2 | tr -d '% '`
  if echo "$battery_status" | grep -q "Charging"; then
    charging_status=1
  fi
fi

if [[ $charging_status == "1" ]]; then
  if [[ $charge -ge 75 && $charge -le 100 ]]; then echo "$c_three_fourths $charge%"; fi
  if [[ $charge -ge 50 && $charge -le 75 ]]; then echo "$c_half $charge%"; fi
  if [[ $charge -ge 25 && $charge -le 50 ]]; then echo "$c_one_fourths $charge%"; fi
  if [[ $charge -ge 0 && $charge -le 25 ]]; then echo "$c_critical $charge%"; fi
elif [[ $charging_status == "0" ]]; then
  if [[ $charge -ge 75 && $charge -le 100 ]]; then echo "$three_fourths $charge%"; fi
  if [[ $charge -ge 50 && $charge -le 75 ]]; then echo "$half $charge%"; fi
  if [[ $charge -ge 25 && $charge -le 50 ]]; then echo "$one_fourths $charge%"; fi
  if [[ $charge -ge 0 && $charge -le 25 ]]; then echo "$critical $charge%"; fi
fi
