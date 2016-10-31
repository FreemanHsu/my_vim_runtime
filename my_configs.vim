map <leader>cf :cd ~/ficus/<cr>
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:syntastic_cpp_include_dirs = ['/mnt/ficuspi/jxu/02_Git/ficus']

map <leader>vs :vs <c-r>=expand("%:p:h")<cr>/
map <leader>sp :sp <c-r>=expand("%:p:h")<cr>/

inoremap <C-w> <C-x><C-f>

set fdm=syntax
set cursorcolumn
set cursorline
hi CursorLine ctermbg=237 cterm=None
set number

""" taglist config
nnoremap <silent> <F8> :TlistToggle<cr>
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Show_One_File = 1

set complete-=i
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

let OmniCpp_NamespaceSearch = 1      
let OmniCpp_GlobalScopeSearch = 1      
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1      
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1      
let OmniCpp_MayCompleteScope = 1      
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

set tags+=~/.vim/tagfiles/stl_tags
map <F12> :!bash ficus_userful_file.sh . > .srcFiles <CR> :!ctags -R --sort=yes --c++-kinds=+p --fields=+ialS --extra=+q -L .srcFiles <CR><CR>
map <F1> :!find . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp"  > .srcFiles <CR> :!ctags -R --sort=yes --c++-kinds=+p --fields=+ialS --extra=+q -L .srcFiles <CR><CR>

