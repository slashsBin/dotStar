Tuning PHPStorm
===============
https://www.jetbrains.com/phpstorm/help/tuning-phpstorm.html
https://intellij-support.jetbrains.com/hc/en-us/articles/206544879-Selecting-the-JDK-version-the-IDE-will-run-under

OSX
---
`/Applications/PhpStormXX.app/Contents/bin/phpstorm.vmoptions` -> `~/Library/Preferences/WebIde XX/phpstorm.vmoptions`

*NIX
----
Help | Edit Custom Properties
Help | Edit Custom VM Options

`$BITS`:
32-bit JVM = empty
64-bit JVM = 64

`<PhpStorm installation folder>/bin/phpstorm$BITS.vmoptions` -> `$HOME/.WebIde XX/phpstorm$BITS.vmoptions`