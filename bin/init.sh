DOT=${HOME}/dotfiles/dot

find ${DOT} -type d | xargs -I dir mkdir -p ${HOME} 

T=.bash_profile
if ! grep "^#bydotfiles" ${HOME}/${T} > /dev/null;then
  cat ${DOT}/${T} >> ${HOME}/${T}
fi


