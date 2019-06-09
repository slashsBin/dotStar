#!/usr/bin/env bash

# <bitbar.title>Persian</bitbar.title>
# <bitbar.version>v0.0.1</bitbar.version>
# <bitbar.author>Mohammad Shokri</bitbar.author>
# <bitbar.author.github>slashsbin</bitbar.author.github>
# <bitbar.desc>Persian Goodies</bitbar.desc>
# <bitbar.dependencies></bitbar.dependencies>
# <bitbar.image></bitbar.image>

/usr/bin/env php -r 'echo (new \IntlDateFormatter("fa_IR@calendar=persian", \IntlDateFormatter::FULL, \IntlDateFormatter::NONE, "Asia/Tehran", \IntlDateFormatter::TRADITIONAL))->format(new DateTime());'
