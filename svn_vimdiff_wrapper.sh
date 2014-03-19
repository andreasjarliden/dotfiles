base=$1
merged=$2
mine=$3
combined=$4
vim -d -c "wincmd J" "$combined" "$merged" "$base" "$mine"
