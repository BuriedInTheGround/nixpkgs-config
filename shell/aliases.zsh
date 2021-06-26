alias copyhash='git lg | head -n 1 | cut -d ' ' -f 1 | pbcopy'
alias gossh='eval `keychain --eval --nogui --agents gpg,ssh id_rsa DFBFC992`'
alias ll='nnn -de' # 'ls -l --si'
alias ls='ls --color=auto'
alias md='mkdir -p'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias rmd='rm -r'
alias top='htop'
alias tree='tree -I node_modules'
