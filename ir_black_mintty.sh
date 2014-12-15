#!/bin/bash
#
# Benjamin Wilson
# 4-4-2012
#
# Replaces the default ANSI colors with something close to Todd Werth's
# IR_Black TextMate theme.
 
# echo -ne '\e]10;#D4D4D4\a'     # Foreground/typed text
echo -ne '\e]10;#FFFFFF\a'     # Foreground/typed text
echo -ne '\e]11;#000000\a'     # Background
echo -ne '\e]12;#D4D4D4\a'     # Cursor
 
# Colors
echo -ne '\e]4;0;#636363\a'    # black
echo -ne '\e]4;1;#FF8A80\a'    # red
echo -ne '\e]4;2;#B2FF7A\a'    # green
echo -ne '\e]4;3;#FFFF85\a'    # yellow
echo -ne '\e]4;4;#62B2FC\a'    # blue
echo -ne '\e]4;5;#FF6BFD\a'    # magenta
echo -ne '\e]4;6;#00E6E6\a'    # cyan
echo -ne '\e]4;7;#E6E6E6\a'    # white
 
# Bold Colors
echo -ne '\e]4;8;#363636\a'    # bold black
echo -ne '\e]4;9;#FF3F2E\a'    # bold red 
echo -ne '\e]4;10;#8CFF2E\a'   # bold green
echo -ne '\e]4;11;#FFFF5C\a'   # bold yellow
echo -ne '\e]4;12;#59A0E3\a'   # bold blue 
echo -ne '\e]4;13;#FF42FC\a'   # bold magenta 
echo -ne '\e]4;14;#00CCCC\a'   # bold cyan
echo -ne '\e]4;15;#D4D4D4\a'   # bold white
