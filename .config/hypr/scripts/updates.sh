#!/bin/bash

update_count="$(yay -Qu | wc -l)"
update_count_aur="$(yay -Qua | wc -l)"
total_updates=$((update_count + update_count_aur))
echo "$total_updates"
