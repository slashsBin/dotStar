# MkDir & Change Directory to it
function mkd() {
    mkdir -p "$@" && cd "$@"
}

# Data URL of a File
function dataurl() {
    local mimeType=$(file -b --mime-type "$1")
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8"
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Run `dig` and display the most useful info
function digga() {
    dig +noall "$1" any +multiline +answer +stats;
}

# Knock Knock
function knock() {
    server=$1
    for port in $@; do nmap -Pn --host_timeout 201 --max-retries 0 -p $port $server; done
}

# View HTTP Traffic
function sniff() {
    sudo ngrep -d $1 -t '^(GET|POST) ' 'tcp and port 80';
}
function httpdump() {
    sudo tcpdump -i $1 -n -s 0 -w - | grep -a -o -E "Host: .*|GET /.*";
}

# Install My Kind of Bluez Tools
function megaInstall() {
    mkdir -p ~/var/tmp/
    mkdir ~/bin/
    mkdir ~/opt/

    cd ~/var/tmp/
    case $1 in
        'core')
            if [ `uname` == 'Darwin' ]; then
                ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            else
                ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
            fi
            ;;
        'tools')
            # Composer
            curl -sS https://getcomposer.org/installer | php -- --install-dir=~/bin --filename=composer
            chmod a+x ~/bin/composer
            composer global install

            # Symfony Installer
            curl -LsS http://symfony.com/installer -o ~/bin/symfony
            chmod a+x ~/bin/symfony

            # Symfony CS
            curl http://get.sensiolabs.org/php-cs-fixer.phar -o ~/bin/php-cs-fixer
            chmod a+x ~/bin/php-cs-fixer

            # PHPUnit
            curl -L https://phar.phpunit.de/phpunit.phar -o ~/bin/phpunit
            chmod a+x ~/bin/phpunit

            # PHPLoC
            curl -L https://phar.phpunit.de/phploc.phar -o ~/bin/phploc
            chmod a+x ~/bin/phploc

            # Arcanist
            mkdir -p ~/opt/phacility/
            cd ~/opt/phacility/
            git clone https://github.com/phacility/libphutil.git
            git clone https://github.com/phacility/arcanist.git
            cd ~/bin/
            ln -s ~/opt/phacility/arcanist/bin/arc
            cd ~/var/tmp/
            ;;
        'linters')
            if [ `uname` == 'Darwin' ]; then
                brew install shellcheck
            else
                sudo apt-get install -Vy shellcheck
                sudo apt-get install -Vy lintian
            fi

            # Vint
            pip install vim-vint

            # PHPMD
            curl -L http://static.phpmd.org/php/latest/phpmd.phar -o ~/bin/phpmd
            chmod a+x ~/bin/phpmd

            # PHPCS
            curl -L https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -o ~/bin/phpcs
            chmod a+x ~/bin/phpcs

            # CSSLint
            npm install -g csslint

            # SCSS-Lint
            gem install scss_lint

            # MarkdownLint
            gem install mdl

            # JSHint
            npm install -g jshint
            ;;
        'all')
            megaInstall core
            megaInstall tools
            megaInstall linters
            ;;
        *)
            megaInstall tools
            ;;
    esac
}

# Update My Toolz
function megaUpdate() {
    case $1 in
        'core')
            if [ `uname` == 'Darwin' ]; then
                sudo softwareupdate -i -a -v
                pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
                npm install npm -g
                npm update -g
                go get -u all
            else
                sudo apt-get update
                sudo apt-get upgrade -Vy
                sudo apt-get dist-upgrade -Vy
                sudo apt-get clean
                sudo pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip install -U
                sudo npm install npm -g
                sudo npm update -g
                sudo go get -u all
            fi
            sudo gem update --system
            sudo gem update
            brew update
            brew upgrade
            brew cask upgrade
            brew cleanup
            brew prune
            brew cask cleanup
            ;;
        'tools')
            apm update --no-confirm
            apm upgrade
            composer -v self-update
            composer -v global update
            symfony -v self-update
            php-cs-fixer -v self-update
            phpunit --self-update
            ;;
        'all')
            megaUpdate core
            megaUpdate tools
            ;;
        *)
            megaUpdate tools
            ;;
    esac
}

# Dash Documents
function dash() {
    open dash://$1
}

# Mirrors SpeedTest
function mirrorSelect() {
    cat $1 | xargs -n1 -I {} sh -c 'echo `curl -r 0-102400 -s -w %{speed_download} -o /dev/null {}` {}' | sort -g -r | head -1 | awk '{ print $2  }'
}

# OpenConnect
# Usage: openconnect <USER> <PASSWD> <SERVER>
function openconnect() {
    echo $2 | sudo openconnect -u $1 -d --timestamp -v --passwd-on-stdin $3
}

# OpenConnect Proxy
# Usage: openconnectProxy <USER> <PASSWD> <SERVER> <Socks5Port>
function openconnectProxy() {
    echo $2 | sudo openconnect -u $1 -d --timestamp -v --passwd-on-stdin --script-tun --script "ocproxy -D $4 -v" $3
}

# Symfony Watch for Changes
# Watch for FS Updated Events in Current Directory
# Requirements: https://github.com/emcrisostomo/fswatch
function sfWatch() {
    fswatch -txr -l 0.5 --event Updated -e '**' -i 'app/' -i 'src/' . | tee /dev/stderr
}

# Symfony Live Reload for OSX
function sfLiveReloadX() {
    sfWatch | xargs -n1 osascript ~/bin/reloadChrome.applescript
}

# Symfony Live Reload for *NIX
function sfLiveReload() {
    sfWatch | xargs -n1 ~/bin/reloadChrome.sh
}

# Dynamic Alias Creation
function aliasAdd() {
    local last_command=$(echo `history | tail -n2 | head -n1` | sed 's/[0-9]* //')
    echo alias $1="'""$last_command""'" >> ~/.aliases
    source ~/.bash_profile
}

# Validate & Lints Swagger API
function lintSwagger() {
    curl -X POST -d @$1 -H 'Content-Type:application/json' -s http://online.swagger.io/validator/debug | jq .
}
