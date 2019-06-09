# GoTo
alias w="cd ~/workspace"
alias t="cd ~/var/tmp"
alias d="cd ~/Downloads"

# Emacs
alias e="emacs -nw"

# My Real Public IP
alias ifconfig.me="curl ifconfig.me"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# IO
alias mkdir='mkdir -vp'
alias cp='cp -v'
alias mv='mv -v'

# Git
alias g="git"

# Enable aliases to be sudo'ed
alias sudo="sudo "

# Gzip-enabled `curl`
alias gurl="curl --compressed"

# HTTP Request Methods
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="curl -X $method"
done

# Colorize Output
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi
alias ll="ls -laFh ${colorflag}"

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# MySQL
#
# --opt := --add-drop-table
#          --add-locks
#          --create-options
#          --disable-keys
#          --extended-insert
#          --lock-tables
#          --quick
#          --set-charset
alias myDump="mysqldump --lock-all-tables --opt --complete-insert --skip-extended-insert"
# MyDumpAll: Single File
# Usage:
#     Dump:
#     $ myDumpAll -r dump.sql
#     Restore:
#     $ myRestoreAll < dump.sql
alias myDumpAll="mydump --all-databases"
alias myDumpAllData="mydump --no-create-info"
alias myDumpAllSchema="mydump --no-data"
alias myRestoreAll="mysql --binary-mode --force"
# MyD-u-m-pAll: Separate Files
alias myD-u-m-pAll='$ mysql -N -e "show databases" | while read dbname; do mydump "$dbname" > "$dbname".sql; done'
alias myR-e-s-t-o-r-eAll='$ for sql in *.sql; do dbname=${sql/\.sql/}; echo -n "Now importing $dbname ... "; mysql $dbname < $sql; echo " done."; done'

# Symfony
alias sf="bin/console"

# Grep Content w/o Comment Lines
alias cgrep="grep -Ev '^#'"
# Case-Insensitive Grep
alias igrep="grep -i"

# Light PHP CLI
alias phpl="php -d xdebug.enable=0 -d memory.limit=-1"

alias xphp="XDEBUG_CONFIG=\"remote_enable=1 profiler_enable=1\" php"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Use bat instead of cat
alias cat="bat"

# tldr tips
alias help='tldr'

# MITMProxy
alias mitm="docker run --rm -it -v ~/.mitmproxy:/home/mitmproxy/.mitmproxy -p 8080:8080 -p 127.0.0.1:8081:8081 mitmproxy/mitmproxy mitmweb --web-iface 0.0.0.0"

# Swagger UI
alias openapi="docker run -p 8888:8080 -e SWAGGER_JSON=/app/openapi.yaml -v /app swaggerapi/swagger-ui"

# Gitlab Runner
alias gitlab-runner="docker run --rm -it -v ${PWD}:/home/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock -w /home/gitlab-runner gitlab/gitlab-runner exec docker"

# Composer
alias composer-docker="docker run -it --rm -v $PWD:/app composer"
