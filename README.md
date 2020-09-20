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

A more complex example:
=======================

This example produces an 80x24 frame with an infinitely running ball that bounces within it.

To run the example, copy the code into main.pony at the same directory level as this README.md and compile as normal.


```
use "time"
use "pony-ncurses"

actor Main
  new create(env: Env) =>
/*
      Windows are stacked as displayed
      below.  Each window has its own
      x and y coordinates system.

      +---------stdscr (window)---------+
      |  +--------(gameframe)--------+  +
      |  |  +------(gamearea)-----+  |  |
      |  |  |                     |  |  |
      |  |  |                     |  |  |
      |  |  |                     |  |  |
      |  |  |                     |  |  |
      |  |  |                     |  |  |
      |  |  +---------------------+  |  |
      |  +---------------------------+  +
      +---------------------------------+
*/

    // Create our three windows window
    let window: Curses = Curses
    let gameframe: Curses = Curses.newwin(24, 80, 0, 0)
    let gamearea: Curses = Curses.newwin(22, 78, 1, 1)


    // Use timers because pony believes sleep(3) is for the weak.
    let timers = Timers
    let timer = Timer(GameTick(window, gameframe, gamearea), 5, 50_000_000)
    timers(consume timer)


/* 
    This class contains the "mainloop" of the demo.
    apply() is called every time the timer ticks.
*/
class GameTick is TimerNotify
  let _ball: Ball
  let _window: Curses
  let _gameframe: Curses
  let _gamearea: Curses

  // constructor creates a ball and stores the window objects
  // so they can be used to render.
  new iso create(window: Curses, gameframe: Curses, gamearea: Curses) =>
    _ball = Ball(gamearea)
    _window = window
    _gameframe = gameframe
    _gamearea = gamearea

  fun ref apply(timer: Timer, count: U64): Bool =>
    _ball.moveball()
    _ball.renderball()
    _window.refresh()
    _gameframe.wborder(0,0,0,0,0,0,0,0)
    _gameframe.wrefresh()
    _gamearea.wrefresh()
    true


class Ball
  var _x: I32
  var _y: I32
  var _upward: Bool
  var _rightward: Bool
  let _window: Curses

  let ponystring: String = "O"

  new create(window: Curses) =>
    _x = I32(10)
    _y = I32(10)
    _upward = false
    _rightward = false
    _window = window


  fun renderball(): None =>
    /* mvwaddstr moves the cursor to y,x and displays the
       string "O" - the ball)                          */
    _window.mvwaddstr(_y, _x, ponystring)


  fun ref moveball(): None =>
    /* mvwaddstr moves the cursor to y,x and blanks out
       that location before updating the coordinates */
    _window.mvwaddstr(_y, _x, " ")

    if (_upward) then
      _y = _y - 1
    else
      _y = _y + 1
    end

    if (_rightward) then
      _x = _x + 1
    else
      _x = _x - 1
    end

    if (_x == 0) then
      _rightward = true
    end
    if (_x == 78) then
      _rightward = false
    end

    if (_y == 0) then
      _upward = false
    end
    if (_y == 22) then
      _upward = true
    end

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

To be continued:
================
```
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
