DOT=${HOME}/dotfiles/dot

find ${DOT} -type d | xargs -I dir mkdir -p ${HOME} 
cat ${DOT}/.bash_profile >> ${HOME}/.bash_profile
cat ${DOT}/.tmux.conf >> ${HOME}/.tmux.conf
