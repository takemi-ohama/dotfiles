

case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  alias ll="ls -lahG"
  ;;
linux*)
  alias ls='ls --color'
  alias ll='ls -lah --color'
  ;;
esac

export PATH="${HOME}/dotfiles/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH"

