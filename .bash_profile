# Add Local /sbin to the $PATH
export PATH="/usr/local/sbin:$PATH";

# Add Composer Vendor to the $PATH
export PATH="$HOME/.composer/vendor/bin:$PATH";

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Load dotStar
for theFile in $HOME/.{bash_prompt,bash_exports,bash_aliases,bash_functions}; do
    [ -r "$theFile" ] && [ -f "$theFile" ] && source "$theFile";
done;
unset theFile;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space
# Save multi-line commands as one command
shopt -s cmdhist

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar noclobber checkwinsize; do
    shopt -s "$option" 2> /dev/null;
done;

# Bash Completion for OpenSSH HostNames
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

# Load Optional Extra Bash Profile Customizations
if [ -r ~/.bash_extra ] && [ -f ~/.bash_extra ]; then
    source ~/.bash_extra;
fi

# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Unicorn love
which ponysay > /dev/null && ponysay -q
