pony-ncurses
============

Ponylang wrapper for ncurses.


Hello World!
============

```
use "pony-ncurses"

actor Main
  new create(env: Env) =>
    let window: Curses = Curses
    window.waddstr("Hello World\n")
    window.refresh()
    window.getch()
    window.endwin()
```


Implemented:
===========
```
curs_initscr(3X)
curs_window(3X)
curs_inopts(3X)
curs_move(3X)
curs_addch(3X)
curs_addstr(3X)
curs_refresh(3X)
curs_getch(3X)
curs_border(3X)

```

```
To be continued:
================
curs_addchstr(3X)
curs_add_wch(3X)
curs_add_wchstr(3X)
curs_addwstr(3X)
curs_attr(3X)
curs_beep(3X)
curs_bkgd(3X)
curs_bkgrnd(3X)
curs_border_set(3X)
curs_clear(3X)
curs_color(3X)
curs_delch(3X)
curs_deleteln(3X)
curs_extend(3X)*
curs_getcchar(3X)
curs_getstr(3X)
curs_get_wch(3X)
curs_get_wstr(3X)
curs_getyx(3X)
curs_inch(3X)
curs_inchstr(3X)
curs_insch(3X)
curs_insstr(3X)
curs_instr(3X)
curs_ins_wch(3X)
curs_ins_wstr(3X)
curs_in_wch(3X)
curs_in_wchstr(3X)
curs_inwstr(3X)
curs_kernel(3X)
curs_legacy(3X)*
curs_memleaks(3X)*
curs_mouse(3X)*
curs_opaque(3X)*
curs_outopts(3X)
curs_overlay(3X)
curs_pad(3X)
curs_print(3X)*
curs_printw(3X)
curs_scanw(3X)
curs_scr_dump(3X)
curs_scroll(3X)
curs_slk(3X)
curs_termattrs(3X)
curs_termcap(3X)
curs_terminfo(3X)
curs_touch(3X)
curs_trace(3X)*
curs_util(3X)
default_colors(3X)*
define_key(3X)*
keybound(3X)*
key_defined(3X)*
keyok(3X)*
legacy_coding(3X)*
new_pair(3X)*
resizeterm(3X)*
wresize(3X)*
```
