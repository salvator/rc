set mouse=a
syntax on
set nu
set autoindent
set foldmethod=marker
set foldcolumn=4
set wmnu
colors tabula
set t_Co=256

map <F7> <ESC>:Grep -R<CR>
map <F2> <ESC>:tabnew<CR>
nmap < :tabp<CR>
nmap > :tabnext<CR>

set nocompatible        " Disable vi compatibility.
set nobackup            " Do not keep a backup file.
set history=100         " Number of lines of command line history.
set undolevels=2000      " Number of undo levels.
set textwidth=0         " Don't wrap words by default.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
"set ignorecase          " Case insensitive matching.
set incsearch           " Incremental search.
"set noautoindent        " I indent my code myself.
"set nocindent           " I indent my code myself.
set scrolloff=10        " Keep a context when scrolling.
set digraph             " Required for e.g. German umlauts.
set noerrorbells        " No beeps.
" set nomodeline          " Disable modeline.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
"set tabstop=8           " Number of spaces <tab> counts for.
set ttyscroll=0         " Turn off scrolling (this is faster).
set ttyfast             " We have a fast terminal connection.
set hlsearch            " Highlight search matches.
set encoding=utf-8      " Set default encoding to UTF-8.
" set showbreak=+         " Show a '+' if a line is longer than the screen.
set laststatus=2        " When to show a statusline.
set autowrite           " Automatically save before :next, :make etc.

set nostartofline       " Do not jump to first character with page commands,
                        " i.e., keep the cursor in the current column.
set viminfo='20,\"50    " Read/write a .viminfo file, don't store more than
                        " 50 lines of registers.

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!

" Path/file expansion in colon-mode.
set wildmode=list:longest
set wildchar=<TAB>

" Enable syntax-highlighting.
if has("syntax")
  syntax on
endif


" English.
iab beacuse    because
iab becuase    because
iab acn        can
iab cna        can
iab centre     center
iab chnage     change
iab chnages    changes
iab chnaged    changed
iab chnagelog  changelog
iab Chnage     Change
iab Chnages    Changes
iab ChnageLog  ChangeLog
iab debain     debian
iab Debain     Debian
iab defualt    default
iab Defualt    Default
iab differnt   different
iab diffrent   different
iab emial      email
iab Emial      Email
iab figth      fight
iab figther    fighter
iab fro        for
iab fucntion   function
iab ahve       have
iab homepgae   homepage
iab logifle    logfile
iab lokk       look
iab lokking    looking
iab mial       mail
iab Mial       Mail
iab miantainer maintainer
iab amke       make
iab mroe       more
iab nwe        new
iab recieve    receive
iab recieved   received
iab erturn     return
iab retrun     return
iab retunr     return
iab seperate   separate
iab shoudl     should
iab soem       some
iab taht       that
iab thta       that
iab teh        the
iab tehy       they
iab truely     truly
iab waht       what
iab wiht       with
iab whic       which
iab whihc      which
iab yuo        you
iab databse    database
iab versnio    version
iab obnsolete  obsolete
iab flase      false
iab recrusive  recursive
iab Recrusive  Recursive

" Days of week.
iab monday     Monday
iab tuesday    Tuesday
iab wednesday  Wednesday
iab thursday   Thursday
iab friday     Friday
iab saturday   Saturday
iab sunday     Sunday

" Use 'g' to go to the top of the file.
map g 1G

" Quit with 'q' instead of ':q'. VERY useful!
map q :q<CR>


" Print an empty <a> tag.
map! ;h <a href=""></a><ESC>5hi

" Wrap an <a> tag around the URL under the cursor.
map ;H lBi<a href="<ESC>Ea"></a><ESC>3hi


" ROT13 decode/encode the selected text (visual mode).
" Alternative: 'unmap g' and then use 'g?'.
vmap rot :!tr A-Za-z N-ZA-Mn-za-m<CR>

" Make p in visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>


"------------------------------------------------------------------------------
" File-type specific settings.
"------------------------------------------------------------------------------

if has("autocmd")

  filetype plugin on

  augroup module
    autocmd BufRead                     *.module,*.engine set filetype=php
  augroup END

  " Ruby code.
  augroup ruby
    autocmd BufReadPre,FileReadPre      *.rb set tabstop=2
    autocmd BufReadPre,FileReadPre      *.rb set expandtab
  augroup END

  " PHP code.
  augroup php
    autocmd BufReadPre,FileReadPre      *.php set tabstop=4
    autocmd BufReadPre,FileReadPre      *.php set expandtab
  augroup END

  " Java code.
  augroup java
    autocmd BufReadPre,FileReadPre      *.java set tabstop=4
    autocmd BufReadPre,FileReadPre      *.java set expandtab
  augroup END

  " ANT build.xml files.
  augroup xml
    autocmd BufReadPre,FileReadPre      build.xml set tabstop=4
  augroup END

  " (J)Flex files.
  augroup lex
    " autocmd BufRead,BufNewFile          *.flex,*.jflex set filetype=lex
    autocmd BufRead,BufNewFile          *.flex,*.jflex set filetype=jflex
  augroup END 

  " (Nu)SMV files.
  augroup smv
    autocmd BufRead,BufNewFile          *.smv set filetype=smv 
  augroup END
endif


"------------------------------------------------------------------------------
" Debian specific options.
"------------------------------------------------------------------------------

" We know xterm-debian is a color terminal.
"if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
"  set t_Co=16
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"endif

" Temporary reportbug files.
augroup filetype
  au BufRead reportbug.*                set ft=mail
  au BufRead reportbug-*                set ft=mail
augroup END
