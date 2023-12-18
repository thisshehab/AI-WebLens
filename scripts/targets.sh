cat input.txt | awk -F" " '{print $1}' | awk -F":" '{print $1":"$2}' | sort -n | uniq | tee output/targets.txt
