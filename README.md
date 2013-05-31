dotStar
=======

/sBin/.*: My dotFiles &amp; etc

Installation
------------
1. Clone this Repository

```bash
$ cd /path/to/wherever/you/want/
$ git clone https://github.com/slashsBin/dotStar.git
```

2. Customize the dotStar Files to your Own liking

3. Run Install/Updater Script

```bash
$ source ./install.star
```
    This Script will:
    Make sure your dotStar Files are UpToDate,
    Creates a Symbolic-Link to your files in your Home `~/dotStar`,
    Asks if you like to Copy/OverWrite dotStar files to your Home,
    and Run your BashRC to make dotStar files Effective.

4. If your choose Not to Copy/OverWrite dotFiles @ Home:
    You may need further Modification of your Applications and/or your Distribution default dotFiles to Include dotStar Files,
    I Recommand making Symbolic-Links to `~/dotStar` for Files which do Not Exists in your Home and Merge/Include Others with your Own.

5. Fork me and Save your Customizations if you Like

6. Enjoy!

Index
-----
* `.bash_aliases` Bash Aliases, Use `alias` Command to List them
* `.bash_profile` Bash Profile
* `.bashrc` Bash RC
* `.curlrc` cURL Command Options
* `.exports` ENV Exports
* `.functions` Bash Functions
* `.gitignore` Git Exclude Files List
* `.gitconfig` Git Configurations
* `.vimrc` ViM Text Editor Options

* `install.star` Automatic Installer/Updater Script

You Should Know
---------------
These `.*` files were written ASSUMING you are Using `Ubuntu` as your distribution!
which means All Other Prefered Modifications which where Already Included in `Ubuntu` distribution were Ommited from this Repo!

Feedback
--------
Suggestions and/or Improvements are [Welcome](https://github.com/slashsBin/dotStar/issues)

License
-------
Same as the Origin of the File Respective Application/Author, All Other Modifications are Free to ReUse/Modify, Use at your Own Risk!. 

