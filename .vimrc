" vim-plug
call plug#begin('~/.vim/plugged')

" Theme / Pretty stuff
Plug 'altercation/vim-colors-solarized'
Plug 'endel/vim-github-colorscheme'
Plug 'tpope/vim-fugitive' | Plug 'vim-airline/vim-airline' | Plug  'vim-airline/vim-airline-themes'

" File tree viewer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Several plugins to help work with Tmux
Plug 'christoomey/vim-tmux-navigator'

" [4] search filesystem with ctrl+p
Plug 'ctrlpvim/ctrlp.vim'

" [8] Diary, notes, whatever. It's amazing
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'

Plug 'ervandew/supertab'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" nerdtree
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif





" NERDTree
map <leader>n :NERDTreeToggle<CR>

let g:colarized_termtrans = 1
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
let g:airline_powerline_fonts = 1



function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTree
    else
        NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction
nnoremap <leader>\ :call ToggleNERDTreeAndTagbar()<CR>
