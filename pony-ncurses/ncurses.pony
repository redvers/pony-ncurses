use "lib:ncurses"

class val Curses
  let _screen: Pointer[Curses]

// curs_initscr(3X)
// screen minitialization and manipulation
// NOTE: Not implementing newterm/set_term/delscreen
  new val create()     => _screen = @initscr[Pointer[Curses]]()

  fun endwin(): I32    => @endwin[I32]()
  fun isendwin(): Bool => @isendwin[Bool]()


// curs_window(3X)
// create curses windows
  new val newwin(              nlines: I32, ncols: I32, beginy: I32, beginx: I32) => _screen = @newwin[Pointer[Curses]](                 nlines, ncols, beginy, beginx)
  new val subwin(orig: Curses, nlines: I32, ncols: I32, beginy: I32, beginx: I32) => _screen = @subwin[Pointer[Curses]](orig.cpointer(), nlines, ncols, beginy, beginx)
  new val derwin(orig: Curses, nlines: I32, ncols: I32, beginy: I32, beginx: I32) => _screen = @derwin[Pointer[Curses]](orig.cpointer(), nlines, ncols, beginy, beginx)
  new val dupwin(orig: Curses)                                                    => _screen = @derwin[Pointer[Curses]](orig.cpointer())
  fun delwin(): I32                    => @delwin[I32](   _screen)
  fun mvwin(   y: I32, x: I32): I32    => @mvwin[I32](    _screen, y, x)
  fun mvderwin(y: I32, x: I32): I32    => @mvderwin[I32]( _screen, y, x)
  fun wsyncup(): None                  => @wsyncup[None]( _screen)
  fun syncok(bf: Bool): I32            => @syncok[I32](   _screen, bf)
  fun wcursyncup(screen: Curses): None => @wcursyncup[None](screen)
  fun wsyncdown( screen: Curses): None => @wsyncdown[None]( screen)


// curs_inopts(3X)
// input options
  fun cbreak(): I32               => @raw[I32]()
  fun nocbreak(): I32             => @nocbreak[I32]()
  fun echo(): I32                 => @echo[I32]()
  fun noecho(): I32               => @noecho[I32]()
  fun halfdelay(tenths: I32): I32 => @halfdelay[I32](tenths)
  fun intrflush(bf: Bool): I32    => @intrflush[I32](_screen, bf)
  fun keypad(   bf: Bool): I32    => @keypad[I32](   _screen, bf)
  fun meta(     bf: Bool): I32    => @meta[I32](     _screen, bf)
  fun nodelay(  bf: Bool): I32    => @nodelay[I32](  _screen, bf)
  fun raw(): I32                  => @raw[I32]()
  fun noraw(): I32                => @noraw[I32]()
  fun noqiflush(): None           => @noqiflush[None]()
  fun qiflush(): None             => @qiflush[None]()
  fun notimeout(bf: Bool): I32    => @notimeout[I32](_screen, bf)
  fun timeout( delay: I32): None  => @timeout[None](delay)
  fun wtimeout(delay: I32): None  => @wtimeout[None](_screen, delay)
  fun typeahead(fd: I32): I32     => @typeahead[I32](fd)


// curs_move(3X)
// move cursor
  fun move( y: I32, x: I32): I32  => @move[I32](          y, x)
  fun wmove(y: I32, x: I32): I32 =>  @wmove[I32](_screen, y, x)


// curs_addch(3X)
// add a character and advance the cursor
  fun addch(                   ch: I32): I32 => @addch[I32](                  ch)
  fun waddch(                  ch: I32): I32 => @waddch[I32](  _screen,       ch)
  fun mvaddch(y: I32, x: I32,  ch: I32): I32 => @mvaddch[I32](          y, x, ch)
  fun mvwaddch(y: I32, x: I32, ch: I32): I32 => @mvwaddch[I32](_screen, y, x, ch)
  fun echochar(                ch: I32): I32 => @echochar[I32](               ch)
  fun wechochar(               ch: I32): I32 => @wechochar[I32](              ch)


// curs_addstr(3X)
// add a string of characters and advance cursor
  fun addstr(                    str: String        ): I32 => @addstr[I32](                   str.cpointer()   )
  fun addnstr(                   str: String, n: I32): I32 => @addnstr[I32](                  str.cpointer(), n)
  fun waddstr(                   str: String        ): I32 => @waddstr[I32]( _screen,         str.cpointer()   )
  fun waddnstr(                  str: String, n: I32): I32 => @waddnstr[I32](_screen,         str.cpointer(), n)
  fun mvaddstr(  y: I32, x: I32, str: String        ): I32 => @mvaddstr[I32](           y, x, str.cpointer()   )
  fun mvaddnstr( y: I32, x: I32, str: String, n: I32): I32 => @mvaddnstr[I32](          y, x, str.cpointer(), n)
  fun mvwaddstr( y: I32, x: I32, str: String        ): I32 => @mvwaddstr[I32]( _screen, y, x, str.cpointer()   )
  fun mvwaddnstr(y: I32, x: I32, str: String, n: I32): I32 => @mvwaddnstr[I32](_screen, y, x, str.cpointer(), n)


// curs_refresh(3X)
// refresh windows and lines
  fun refresh(): I32                                => @refresh[I32]()
  fun wrefresh(): I32                               => @wrefresh[I32](_screen)
  fun wnoutrefresh(): I32                           => @wnoutrefresh[I32](_screen)
  fun doupdate(): I32                               => @doupdate[I32]()
  fun redrawwin(): I32                              => @redrawwin[I32](_screen)
  fun wredrawln(beg_line: I32, num_lines: I32): I32 => @wredrawln[I32](_screen, beg_line, num_lines)


// curs_getch(3X)
// get (or push back) characters from the curses terminal
  fun getch(): I32                  => @getch[I32]()
  fun wgetch(): I32                 => @wgetch[I32](  _screen)
  fun mvgetch( y: I32, x: I32): I32 => @mvgetch[I32](          y, x)
  fun mvwgetch(y: I32, x: I32): I32 => @mvwgetch[I32](_screen, y, x)
  fun ungetch(ch: I32): I32         => @ungetch[I32](ch)
  fun has_key(ch: I32): I32         => @has_key[I32](ch)


// curs_border(3X)
// create curses borders, horizontal, and vertical lines
  fun val border( ls: I32, rs: I32, ts: I32, bs: I32, tl: I32, tr: I32, bl: I32, br: I32): I32 => @border[I32](          ls, rs, ts, bs, tl, tr, bl, br)
  fun val wborder(ls: I32, rs: I32, ts: I32, bs: I32, tl: I32, tr: I32, bl: I32, br: I32): I32 => @wborder[I32](_screen, ls, rs, ts, bs, tl, tr, bl, br)

  fun hline(                   ch: I32, n: I32): I32                                           => @hline[I32](                ch, n)
  fun whline(                  ch: I32, n: I32): I32                                           => @whline[I32](_screen,       ch, n)
  fun vline(                   ch: I32, n: I32): I32                                           => @vline[I32](                ch, n)
  fun wvline(                  ch: I32, n: I32): I32                                           => @wvline[I32](_screen,       ch, n)
  fun mvhline( y: I32, x: I32, ch: I32, n: I32): I32                                           => @hline[I32](          y, x, ch, n)
  fun mvwhline(y: I32, x: I32, ch: I32, n: I32): I32                                           => @whline[I32](_screen, y, x, ch, n)
  fun mvvline( y: I32, x: I32, ch: I32, n: I32): I32                                           => @vline[I32](          y, x, ch, n)
  fun mvwvline(y: I32, x: I32, ch: I32, n: I32): I32                                           => @wvline[I32](_screen, y, x, ch, n)


// curs_attr
// charater and window attribute control routines
/*
       int attr_get(attr_t *attrs, short *pair, void *opts);
       int wattr_get(WINDOW *win, attr_t *attrs, short *pair, void *opts);
       int attr_set(attr_t attrs, short pair, void *opts);
       int wattr_set(WINDOW *win, attr_t attrs, short pair, void *opts);

       int attr_off(attr_t attrs, void *opts);
       int wattr_off(WINDOW *win, attr_t attrs, void *opts);
       int attr_on(attr_t attrs, void *opts);
       int wattr_on(WINDOW *win, attr_t attrs, void *opts);

       int attroff(int attrs);
       int wattroff(WINDOW *win, int attrs);
       int attron(int attrs);
       int wattron(WINDOW *win, int attrs);
       int attrset(int attrs);
       int wattrset(WINDOW *win, int attrs);

       int chgat(int n, attr_t attr, short pair, const void *opts);
       int wchgat(WINDOW *win,
             int n, attr_t attr, short pair, const void *opts);
       int mvchgat(int y, int x,
             int n, attr_t attr, short pair, const void *opts);
       int mvwchgat(WINDOW *win, int y, int x,
             int n, attr_t attr, short pair, const void *opts);

       int color_set(short pair, void* opts);
       int wcolor_set(WINDOW *win, short pair, void* opts);

       int standend(void);
       int wstandend(WINDOW *win);
       int standout(void);
       int wstandout(WINDOW *win);
*/


// Return my pointer
  fun val cpointer(): Pointer[Curses val] val => _screen

