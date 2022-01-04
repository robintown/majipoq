sed -zr 's/<[^>]+>/ /g' $argv[1] | sed -r 's/^\s+//g' | sed -r 's/\s+$//g' | sed -r '/^\s*$/d' | sed -r 's/ +/ /g'
