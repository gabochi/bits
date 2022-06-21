function HLSyntax()
	syn match Function /t\s/
	syn match Number /[0-9]\+/
        syn match Comment /\:\a*\s/
endfunction

function Bytebeat()
	silent exe '!./bytebeat.sh "' . getline('.') . '"' | redraw!
endfunction

function Killall()
	silent exe '!killall aplay' | redraw!
endfunction

map <F5> <esc> :call Bytebeat() <enter>
map <F6> <esc> :call Killall() <enter>

au BufRead,BufNewFile *.bytebeat :call HLSyntax()
