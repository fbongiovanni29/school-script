cd ~
cat > ./mrB_cheatsheet.sh <<'EOF'
base=$(basename `pwd`)
parent="$(basename "$(dirname "$`pwd`")")"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
echo -e "$CYAN  ---------------\x18$RED*CHEATSHEET*\x18$CYAN----------------"
echo -e "$CYAN |\x18$RED\x18Directions$YELLOW File/Directory$GREEN Command$BLUE You Type!\x18$CYAN|"
echo -e "$CYAN  -------------------------------------------"
echo -e "$RED You are in the directory named:"
echo -e "$YELLOW $base" 
echo -e "$CYAN ---------------------------------------------"
echo -e "$RED To create a new file type"
echo -e "$GREEN touch\x18$BLUE name"
echo -e "$CYAN ---------------------------------------------"
echo -e "$RED To delete a file type"
echo -e "$GREEN rm\x18$BLUE name"
echo -e "$CYAN ---------------------------------------------"
echo -e "$RED The files in your directory are$YELLOW"
echo `ls $(file --no-pad  -F' '  * | grep -v directory | cut -d' ' -f1)`
echo -e "$RED Normally you will type\x18$GREEN ls\x18$RED to list these files"
echo -e "$CYAN ---------------------------------------------"
echo -e "$RED To make a new directory type"
echo -e "$GREEN mkdir\x18$BLUE name"
echo -e "$CYAN ---------------------------------------------"
echo -e "$RED To get into a subdirectory type"
echo -e "$GREEN cd\x18$BLUE name"
echo -e "$CYAN ---------------------------------------------"
echo -e "$RED Your parent directory is named"
echo -e "$YELLOW $parent"
echo -e "$RED to get here type \x18$GREEN../"
echo -e "$CYAN ---------------------------------------------"
echo -e "$RED Your subdirectories are:$YELLOW"
`printf "ls -d */"`
echo -e "$RED Normally you will type\x18$GREEN ls\x18$RED to list these directories"
echo -e "$CYAN ---------------------------------------------"
EOF
chmod +x mrB_cheatsheet.sh
cat > ~/.bash_profile <<'EOF'
export PATH=usr:$PATH
export PS1="\[\033[0;33m\]\w\033[32m\]\\[\033[0;34m\] $ \[\033[3;32m\]"
alias help-me='~/mrB_cheatsheet.sh'
EOF
source ~/.bash_profile