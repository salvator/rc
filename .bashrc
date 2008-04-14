#export LANG='ru_RU.UTF-8'
#export LC_ALL='ru_RU.UTF-8'
alias screen='screen -U -h 10000'

source /usr/local/share/git-core/git-completion.bash
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
