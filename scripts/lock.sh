#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#4c566acc'  # default
T='#ffffffee'  # text
W='#8fbcbbbb'  # wrong
V='#3b4252bb'  # verifying

i3lock \
--insidever-color=$C   \
--ringver-color=$V     \
\
--insidewrong-color=$C \
--ringwrong-color=$W   \
\
--inside-color=$B      \
--ring-color=$D        \
--line-color=$B        \
--separator-color=$D   \
\
--verif-color=$T        \
--wrong-color=$T        \
--time-color=$T        \
--date-color=$T        \
--layout-color=$T      \
--keyhl-color=$W       \
--bshl-color=$W        \
\
--screen 1            \
--blur 20             \
--clock               \
--indicator           \
--time-str="%H:%M:%S"  \
--date-str="%A, %m %Y" \
--keylayout 1         \
