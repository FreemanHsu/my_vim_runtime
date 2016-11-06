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
set tags+=/mnt/ficuspi/jxu/02_Git/ficus/common/tags
map <F12> :!bash ficus_userful_file.sh . > .srcFiles <CR> :!ctags -R --sort=yes --c++-kinds=+p --fields=+ialS --extra=+q -L .srcFiles <CR><CR>
map <F1> :!find . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp"  > .srcFiles <CR> :!ctags -R --sort=yes --c++-kinds=+p --fields=+ialS --extra=+q -L .srcFiles <CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
"""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin            /bash") 
        call append(line("."), "") 
    elseif &filetype == 'python'       
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")

    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "> File Name: ".expand("%")) 
        call append(line(".")+1, "> Author: Jun Xu") 
        call append(line(".")+2, "> Created Time: ".strftime("%c")) 
        call append(line    (".")+3, " ************************************************************************/") 
        call append(line(".")+4, "")
    endif

    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G
