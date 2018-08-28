<p align="center">
  <img src="https://bashlogo.com/img/logo/png/full_colored_dark.png" alt="Bash" height="128">
</p>

<p align="center">
  <a href="https://insight.sensiolabs.com/projects/64999a54-93a9-4532-99c9-53901e93b5c9"><img src="https://insight.sensiolabs.com/projects/64999a54-93a9-4532-99c9-53901e93b5c9/mini.png" alt="SensioLabs Insight"></a>
</p>

# dotStar

/sBin/.*: My dotFiles &amp; etc

## Single Item

Use cURL to get a Single Item from Repo:

```bash
curl -L https://github.com/slashsBin/dotStar/raw/master/<path>
```

## Installation - Manual

```bash
# Clone Repo
git clone https://github.com/slashsBin/dotStar.git ~/workspace/dotStar

# Bash-it
# https://github.com/Bash-it/bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

# Install Homebrew
# https://brew.sh/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install MAS - MacOS AppStore CLI Helper
brew install mas

# Brew Bundle
# https://github.com/Homebrew/homebrew-bundle
brew bundle install

# Extra
# SymLink necessary files
cd ~
ln -s ~/workspace/dotStar/.curlrc
ln -s ~/workspace/dotStar/.gitconfig
```

## You Should Know

These `.*` files were written ASSUMING you are Using `Ubuntu` or `OSX` as your distributions!
which means All Other Preferred Modifications which where Already Included in `Ubuntu` or `OSX` distributions were Omitted from this Repo!.

Feedback
--------
Suggestions and/or Improvements are [Welcome](https://github.com/slashsBin/dotStar/issues).

Credits
-------
* Mathias’s dotfiles https://github.com/mathiasbynens/dotfiles

License
-------
Same as the Origin of the File Respective Application/Author, All Other Modifications are Free to ReUse/Modify, Use at your Own Risk!.
