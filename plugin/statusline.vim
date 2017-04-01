" Summary:     Beautify statusline
" Description:
"         This script is based on the light2011 colorscheme. Thanks for xiaohuyee <xiaohuyee@gmail.com>
"         to give us such a pretty gift. He did most of the work. I just
"         stood on his shoulders.
"         I am looking for a beautiful vim statusline for a long time but found nothing
"         until I met the light2011.
"         Last night I spent several hours to beautify my statusline, it looks good.
"         And now I give it to you.
" Screenshot: 
"         http://vimer.1063083.n5.nabble.com/beautiful-vim-statusline-td4777850.html
"         
" Maintainer: Tian Huixiong: <nedzqbear@gmail.com>
"             I'm very glad to receive your feedback. 
" Licence:    This script is released under the Vim License.
" Version:    1.0
" Update:     2011-09-07 
" Install:     
"         Put this file in ~/.vim/plugin on *nix.
"         Or put it in $vim/vimfiles/plugin on Windows.
" Tutorial:
"         Just use it, and change it.
"         When you edit it, do not erase trailing-blanks.
"	f S   Path to the file in the buffer, as typed or relative to current
"	      directory.
"	F S   Full path to the file in the buffer.
"	t S   File name (tail) of file in the buffer.
"	m F   Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
"	M F   Modified flag, text is ",+" or ",-".
"	r F   Readonly flag, text is "[RO]".
"	R F   Readonly flag, text is ",RO".
"	h F   Help buffer flag, text is "[help]".
"	H F   Help buffer flag, text is ",HLP".
"	w F   Preview window flag, text is "[Preview]".
"	W F   Preview window flag, text is ",PRV".
"	y F   Type of file in the buffer, e.g., "[vim]".  See 'filetype'.
"	Y F   Type of file in the buffer, e.g., ",VIM".  See 'filetype'.
"	      {not available when compiled without |+autocmd| feature}
"	q S   "[Quickfix List]", "[Location List]" or empty.
"	k S   Value of "b:keymap_name" or 'keymap' when |:lmap| mappings are
"	      being used: "<keymap>"
"	n N   Buffer number.
"	b N   Value of character under cursor.
"	B N   As above, in hexadecimal.
"	o N   Byte number in file of byte under cursor, first byte is 1.
"	      Mnemonic: Offset from start of file (with one added)
"	      {not available when compiled without |+byte_offset| feature}
"	O N   As above, in hexadecimal.
"	N N   Printer page number.  (Only works in the 'printheader' option.)
"	l N   Line number.
"	L N   Number of lines in buffer.
"	c N   Column number.
"	v N   Virtual column number.
"	V N   Virtual column number as -{num}.  Not displayed if equal to 'c'.
"	p N   Percentage through file in lines as in |CTRL-G|.
"	P S   Percentage through file of displayed window.  This is like the
"	      percentage described for 'ruler'.  Always 3 in length.
"	a S   Argument list status as in default title.  ({current} of {max})
"	      Empty if the argument file count is zero or one.
"	{ NF  Evaluate expression between '%{' and '}' and substitute result.
"	      Note that there is no '%' before the closing '}'.
"	( -   Start of item group.  Can be used for setting the width and
"	      alignment of a section.  Must be followed by %) somewhere.
"	) -   End of item group.  No width fields allowed.
"	T N   For 'tabline': start of tab page N label.  Use %T after the last
"	      label.  This information is used for mouse clicks.
"	X N   For 'tabline': start of close tab N label.  Use %X after the
"	      label, e.g.: %3Xclose%X.  Use %999X for a "close current tab"
"	      mark.  This information is used for mouse clicks.
"	< -   Where to truncate line if too long.  Default is at the start.
"	      No width fields allowed.
"	= -   Separation point between left and right aligned items.
"	      No width fields allowed.
"	# -   Set highlight group.  The name must follow and then a # again.
"	      Thus use %#HLname# for highlight group HLname.  The same
"	      highlighting is used, also for the statusline of non-current
"	      windows.
"	* -   Set highlight group to User{N}, where {N} is taken from the
"	      minwid field, e.g. %1*.  Restore normal highlight with %* or %0*.
"	      The difference between User{N} and StatusLine  will be applied
"	      to StatusLineNC for the statusline of non-current windows.
"	      The number N must be between 1 and 9.  See |hl-User1..9|

set laststatus=2
set statusline=
set statusline+=%1*%-52F\ 
set statusline+=%2*\ %{&ff=='unix'?'\\n':(&ff=='mac'?'\\r':'\\r\\n')}\ 
set statusline+=%3*\ %{&fenc!=''?&fenc:&enc}\ 
set statusline+=%1*\ %Y\ 
set statusline+=%4*\ %04l/%03c\ 
set statusline+=%2*\ 0x%04.4B\ 
set statusline+=%1*\ %-16{strftime(\"%Y-%m-%d\ %H:%M\")}\ 
set statusline+=%5*\ %-3m\ 
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}[%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%d/%m/%Y-%H:%M\")}%=\ col:%c%V\ ascii:%b\ pos:%o\ lin:%l\,%L\ %P
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
"set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
"set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)


hi User1 guifg=#112605  guibg=#aefe7B gui=italic
hi User2 guifg=#391100  guibg=#d3905c gui=italic
hi User3 guifg=#292b00  guibg=#f4f597 gui=italic
hi User4 guifg=#051d00  guibg=#7dcc7d gui=italic
hi User5 guifg=#002600  guibg=#67ab6e gui=italic
