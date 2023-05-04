#!/bin/bash
input_image="\$1"
output_file="ascii_art.txt"
convert "$input_image" -resize 80x80 -colorspace Gray -normalize -resize 80x80! txt:- | sed -e 's/.*[(]//' -e 's/,.*//' -e 's/)//' | sort -n | uniq -c | awk '{print \$2,\$1}' > "$output_file"