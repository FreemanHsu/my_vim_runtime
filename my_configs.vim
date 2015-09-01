map <leader>cf :cd ~/ficus/<cr>
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

map <leader>vs :vs <c-r>=expand("%:p:h")<cr>/

set fdm=syntax
set cursorline
set cursorcolumn
set number

""" taglist config
nnoremap <silent> <F8> :TlistToggle<cr>
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Use_Right_Window = 1
