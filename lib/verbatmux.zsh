# todo: should be in /bin? need to define what an app is

verbatmux () {
	local c m
	while {read -sk1 c} {
		case $c {
			$'\n')   print  ⏎ ; c=c-m ;;
			$'\e')   print -nP '%F{blue}[ESC]%f'   ;;
			\ )      print -P  '%F{blue}[space]%f' ;;
			$'\x7f') print -n $'\b'                ;; # backspace
			)      clear ; break                 ;;
			*)       print -n $c                   ;;
		}
		tmux send -t${T:=0} $c
	}
}
