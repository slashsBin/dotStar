# My Real Public IP
alias ifconfig.me="curl ifconfig.me"

# Git
alias g="git"

# ViM
alias v="vim"

# Enable aliases to be sudo'ed
alias sudo="sudo "

# HTTP Request Methods
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="curl -X $method"
done

