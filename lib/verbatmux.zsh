# todo: should be in /bin? need to define what an app is

verbatmux/new-pane () {
	tmux split-window -bhvl${1:-20} 'uze verbatmux; verbatmux/start'
}

verbatmux/start () {
	local c m
	while {read -sk1 c} {
		case $c {
			$'\n')   print -P ' %F{blue}⏎%f' ; c=c-m  ;;
			$'\e')   print -P ' %F{blue}\\e%f'        ;;
			$'\t')   print -P ' %F{blue}[tab]%f'      ;;
			\ )      print -P ' %F{blue}[space]%f'    ;;
			)      print -P ' %F{blue}^W%f'         ;;
			$'\x7f') print -n $'\b'                   ;; # backspace
			)      clear ; break                    ;;
			*)       print -n $c                      ;;
		}
		tmux send -t${1:-1} $c
	}
}
