system:
  root_password: $6$k2THkTrMxNt24ZBe$EbMoL5p8MxJSBA/efr2K3H0pt7RCThMSZGCQ6R80R7ier1nk5XUgYo7aRME4FHuQUdWiuL.Gk/2H8a.PmN9Rr/

sudoers:
  groups:
    wheel:
      - 'ALL=(ALL) NOPASSWD: ALL'

users:
  seth.miller:
    fullname: Seth Miller
    groups:
      - wheel
    ssh_auth_file:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7U7LOdmxhQ87203ROj23kegOO5iMqNaeKQEFLwNSsfs6BAy1mLnZyrvuwVOsknxvW6pyubrvtbQP7fyC3VbgDbpB1jmqTUdYo+4FwMuy9NNyY82VBljnD1FJgNvdLLKMJ5T1jSMze+a2ZLBhcwzY7IO59j1QcQaGE4OPzdToTrQdVp1ZPrlHZn3Y+x3/sO07mTV2TKkg0NkqoCd6pLvxq9PKBPIqokjctA44RCgJNtE7WoO9Es041G5fcUMwGWaji62XNVVg5dMVY9YU6sOAn94weY5uyInc8kGsmE/pC40dzPodJix9YVJpl/+6QFyRA+zSkc3rjO2Ko839d17e1 smiller@oxygen

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

salt:
  minion:
    master: kvm01
    mine_functions:
      network.ip_addrs: []

#TODO - enable
# schedule:
#   highstate:
#     function: state.highstate
#     minutes: 10
#     splay: 120
