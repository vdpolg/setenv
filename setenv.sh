#!/bin/bash
#名稱           版本	日期		作者	備註
#設定常用環境	v1.1	20180903	arthuR	setenv

VIMRC=~/.vimrc #vim setting
TMUXC=~/.tmux.conf #vim setting
VAR=$1
var(){ #變數名
case $VAR in
vim)PROG=$VIMRC;;
tmux)PROG=$TMUXC;;
PS1)
echo -e "建構中…，程式中止 \n"
exit 1;;
*)
echo "error!!"
echo -e "$0 {vim|tmux|PS1} \n"
exit 1
;;
esac
}
conf(){ #設定檔
var
case $PROG in
$VIMRC)
echo "set autoindent"
echo "set smartindent"
echo "set tabstop=4"
echo "set shiftwidth=4"
echo "set showmatch"
echo "set nu"
;;
$TMUXC)
echo "setw -g mode-keys vi"
;;
PS1)
echo -e "建構中…，程式中止 \n"
exit 1
;;
esac
}
function runconf(){ #執行檔
var
	if [[ -f $PROG ]] ;then
		echo "已有設定值，程式中止！"
		exit 1
	else
cat >> $PROG << EOF
`conf`
EOF
fi
}

if [ $# = 0 ];then
	echo "請輸入變數範例如下："
	echo -e "$0 {vim|tmux|PS1} \n"
	exit 1
else
echo "開始執行"
runconf
fi

# PS1 setting
#PS1='[\e[36m\u\e[31m@\e[32m\h\e[35m \W\e[0m] \e[33m# \e[0m' #root
#PS1="\e[31m\u\e[36m \W\e[0m $ " #user
PS1="\u \W$ "
# alias
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias l.='ls -d .* --color=auto'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
# alias p='/shell/pro_phone.sh'
