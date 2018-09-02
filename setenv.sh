#!/bin/bash
VIMRC="~/.vimrc" #vim setting
TMUXC="~/.tmux.conf" #vim setting
PROG=$1
if [ $# = 0 ];then
	echo "請輸入變數範例如下："
	echo -e "$0 {vim|tmux|PS1} \n"
	exit 1
else
function Setconf(){
	if [[ $PROG ]] ;then
		echo "已有設定值，程式中止！"		
		exit 1
	else                                    
		PROG=$CC
		`cat >> $PROG << EOF
		`conf`
		EOF`
	fi
}
				
conf(){
case $PROG in
vim)
PROG=$VIMRC
echo "set autoindent"
echo "set smartindent"
echo "set tabstop=4"
echo "set shiftwidth=4"
echo "set showmatch"
;;
tmux)
PROG=$TMUXC
echo "setw -g mode-keys vi"
;;
#PS1)
#暫不執行
#;;
esac
}

Setconf

fi

# PS1 setting
#PS1='[\e[36m\u\e[31m@\e[32m\h\e[35m \W\e[0m] \e[33m# \e[0m' #root
#PS1="\e[31m\u\e[36m \W\e[0m $ " #user
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
