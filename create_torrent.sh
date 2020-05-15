#!/bin/bash
PLMAXES=([15]=$((2**15)) [16]=$((2**16)) [17]=$((2**17)) [18]=$((2**18)) \
        [19]=$((2**19)) [20]=$((2**20)) [21]=$((2**21)) [22]=$((2**22)) [23]=$((2**23)) [24]=$((2**24)))
#if [[ -L "$file" && -d "$file" ]]; then
tsize=`du -sb "$1" | cut -f1` #tinh dung luong cua folder hay file
# sau do duyet xem chon piece phu hop
for ((i=15; i<25; i++)); do
	
	echo "$tsize / ${PLMAXES[$i]}"
	sum=$(echo "$tsize / ${PLMAXES[$i]}" | bc)
	echo $sum
	if [[ $sum -le 2000 ]]; then
		echo 'hello'
		pl=$i
		echo $i
		break # gap thang piece phu hop dau tien
	else
		pl=$i # neu ko co thang thoa man se lay thang piece 24
	fi
	
done
mktorrent --piece-length=${pl} -v -p -a '' "$1" # tao tor

# ref http://tldp.org/LDP/abs/html/comparison-ops.html
