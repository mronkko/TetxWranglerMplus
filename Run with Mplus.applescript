tell application "TextWrangler"
	set loc to file of window 1
	set ploc to POSIX path of loc
end tell


# Open a terminal and run in that 

tell application "Terminal"
	if not (exists front window) then do script ""
	activate
	do script "cd \"`dirname '"& ploc &"'`\"" in front window
	do script "~/Applications/mplus6.11/mplus '"& ploc &"'" in front window

end tell

# Open the result in text wrangler
do shell script "open -a TextWrangler \"`echo '" & ploc & "' | perl -pe 's|\\.[^/]*?$||'`.out\""