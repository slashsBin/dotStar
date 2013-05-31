# My IP
alias ifconfig.me="curl ifconfig.me"

# Git
alias g="git"
alias gs="git status -s"
alias gb="git branch"
alias gl="git log --oneline"
alias gl1="gl -1"

# Vim
alias v="vim"

# Enable aliases to be sudo'ed
alias sudo="sudo "

# Hash
alias md5="echo -n"

# HTTP Request Methods
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="curl -X $method"
done

