system:
  root_password: $6$k2THkTrMxNt24ZBe$EbMoL5p8MxJSBA/efr2K3H0pt7RCThMSZGCQ6R80R7ier1nk5XUgYo7aRME4FHuQUdWiuL.Gk/2H8a.PmN9Rr/

sudoers:
  groups:
    wheel:
      - 'ALL=(ALL) NOPASSWD: ALL'

bash:
  profile: |
    shopt -s checkwinsize
    shopt -s histappend
    unset MAILCHECK
    export EDITOR=vim
    export PATH=$PATH:~/.bin
    export HISTSIZE=10000000
    export HISTCONTROL=ignoredups
    export HISTTIMEFORMAT='%F %T '
    export PROMPT_COMMAND='history -a'
    export LSCOLORS='Gxfxcxdxdxegedabagacad'
    export PS1='\[\033[01;35m\]\u@\H\[\033[01;34m\] \W \$\[\033[00m\] '
    alias grep='grep --color=auto'
    alias ls='ls --color=auto'

sshd_config:
  Port: 22
  Protocol: 2
  LogLevel: INFO
  PasswordAuthentication: 'yes'
  UseDNS: 'no'
  PermitRootLogin: 'yes'
  PrintMotd: 'yes'
  Subsystem: 'sftp internal-sftp'

salt:
  minion:
    master: salt
    mine_functions:
      network.ip_addrs: []
