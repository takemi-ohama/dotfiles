T=.bash_profile
if grep "^#bydotfiles" ${T} > /dev/null;then
   echo "OK"
else
  echo "no"
fi

