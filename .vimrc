let g:ale_disable_lsp = 3
filetype plugin indent on
set termguicolors

set noerrorbells

set number
set nowrap

set tabstop=4
set shiftwidth=4
set expandtab

let mapleader=","

syntax on

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 2

" GOLAN SETUP GUIDE: https://pmihaylov.com/vim-for-go-development/
let g:go_highlight_types = 2
let g:go_highlight_fields = 2
let g:go_highlight_functions = 2
let g:go_highlight_function_calls = 2
let g:go_highlight_operators = 2
let g:go_highlight_extra_types = 2
let g:go_highlight_build_constraints = 2
let g:go_highlight_generate_tags = 2

" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 1
let g:go_metalinter_enabled = []
"
" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

set signcolumn=number

" FZF SETTINGS: https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
" INSTALL FZF
" git clone https://github.com/junegunn/fzf.git ~/.vim/pack/packages/start/fzf
" git clone https://github.com/junegunn/fzf.vim.git ~/.vim/pack/packages/start/fzf.vim
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" let g:syntastic_go_checkers = "gofmt"
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

set cursorline

map <C-y> <plug>NERDCommenterToggle
map <Leader>\ <plug>NERDCommenterToggle
map <C-n> <plug>NERDTreeFocus
set laststatus=2

function! s:thesaurus()
    let s:saved_ut = &ut
    if &ut > 200 | let &ut = 200 | endif
    augroup ThesaurusAuGroup
        autocmd CursorHold,CursorHoldI <buffer>
                    \ let &ut = s:saved_ut |
                    \ set iskeyword-=32 |
                    \ autocmd! ThesaurusAuGroup
    augroup END
    return ":set iskeyword+=32\<cr>vaWovea\<c-x>\<c-t>"
endfunction

nnoremap <expr> <leader>t <SID>thesaurus()

set thesaurus+=~/.vim/thesaurus/thesaurii.txt

function! MyHighlights() abort
    hi clear SpellBad
    hi clear SpellCap
    hi clear SpellRare
    hi clear SpellLocal
    highlight SpellBad cterm=NONE gui=NONE guibg=#ff0000 guifg=#ffffff
    highlight SpellCap cterm=NONE gui=NONE guibg=#aa0000 guifg=#eeeeee
    highlight SpellRare cterm=NONE gui=NONE guibg=#cc00cc guifg=#ffffff
    highlight SpellLocal cterm=NONE gui=NONE guibg=#0000cc guifg=#ffffff
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

set spellfile=~/.vim/spell/dict_words_en_us.add

"colorscheme sublimemonokai
colorscheme xcodedark
"let g:lightline = {
      "\ 'colorscheme': 'nord',
      "\ }
