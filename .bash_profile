# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load dotStar
for theFile in ~/.{exports,aliases,functions}; do
	[ -r "$theFile" ] && [ -f "$theFile" ] && source "$theFile";
done;
unset theFile;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Bash Completion for OpenSSH HostNames
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

# Load Optional Extra Bash Profile Customizations
[ -r "~/.extra" ] && [ -f "~/.extra" ] && source "~/.extra";
