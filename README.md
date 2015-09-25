dotStar
=======

/sBin/.*: My dotFiles &amp; etc

Single Item
-----------
Use cURL to get a Single Item from Repo:

    ```bash
    curl -L https://github.com/slashsBin/dotStar/raw/master/<path>
    ```

Installation
------------
(NOTE) `install.star` Script is NO longer maintained, but it should work anyway as the general idea of installing these files are followed by the script.

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

You Should Know
---------------
These `.*` files were written ASSUMING you are Using `Debian` or 'OSX' as your distributions!
which means All Other Preferred Modifications which where Already Included in `Debian` or 'OSX' distributions were Omitted from this Repo!.

For `OSX` you should See Commented Sections.

Feedback
--------
Suggestions and/or Improvements are [Welcome](https://github.com/slashsBin/dotStar/issues).

Credits
-------
* Mathias’s dotfiles https://github.com/mathiasbynens/dotfiles

License
-------
Same as the Origin of the File Respective Application/Author, All Other Modifications are Free to ReUse/Modify, Use at your Own Risk!.
