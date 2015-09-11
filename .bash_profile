# Load dotStar
for theFile in ~/.{exports,bash_aliases,functions}; do
	[ -r "$theFile" ] && source "$theFile"
done
unset theFile

# Bash Completion for OpenSSH HostNames
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh
