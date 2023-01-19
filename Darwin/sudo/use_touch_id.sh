search='auth       sufficient     pam_smartcard.so'
insert='auth       sufficient     pam_tid.so'
file='/etc/pam.d/sudo'

grep -q "$insert" "$file" && exit 0

tmpfile=$(mktemp /tmp/sudo.XXXXXX)

while read line; do
    echo "$line" | grep -q "$search"
    [ $? -eq 0 ] && echo "$insert" >>"$tmpfile"
    echo "$line" >>"$tmpfile"
done <"$file"

sudo mv "$tmpfile" "$file"
