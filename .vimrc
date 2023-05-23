


command W :execute ':silent w !sudo tee % > /dev/null' | :edit! " Allow files to be saved as root when forgetting to start Vim using sudo.

" Color colomn
augroup TooLong
    autocmd!
    autocmd winEnter,BufEnter * call clearmatches() | call matchadd('ColorColumn', '\%80v', 100)
    "highlight ColorColumn ctermbg=0 guibg=lightgrey " Lightgray hiliting cloumn
augroup END


set t_Co=256                            " Support 256 colors

" Tabs
tab sball
set switchbuf=useopen

" Begin Plug extention
call plug#begin()

" Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Folding python function
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'zhimsel/vim-stay'

" Python syntax highlighted
Plug 'vim-python/python-syntax'

" Virtual environment
Plug 'jmcantrell/vim-virtualenv'

" Displays tags in window
Plug 'preservim/tagbar'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugin nerdtree
Plug 'preservim/nerdtree'
" Plugin shows Git status flags in NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Adds filetupe icon to NERDTree
Plug 'ryanoasis/vim-devicons'

" Gruvebox theme
Plug 'morhetz/gruvbox'

" Maximize split window
Plug 'SZW/vim-maximizer'

" Zen Mode
Plug 'slarwise/vim-zen'
" End plugin system
call plug#end()

" Appears vertical line for more than 80 character
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

" Tagbar setting
let g:tagbar_width=32

" Python syntax highliting
let g:python_highlight_all = 1

" setting for airline
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

" Save and restore folds fo function in python
let g:SimpylFold_docstring_preview = 1
let g:fastfold_minlines = 0
set foldmethod=manual
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

" Setting leader key
let mapleader = "\<Space>"

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Make undo files
"set undofile
" Beter command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2


" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
if has('mouse')
  set mouse=a
endif

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
" set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>



"colorscheme gruvbox
set t_ut=
"set termguicolors
let g:gruvbox_contrast_dark='light'
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox

"""""""""""""""""
"""Mapping key"""
"""""""""""""""""
" Maximize window for plugin
nnoremap <Space>w <CR>:MaximizerToggle<CR>

" Execute current python file
nnoremap <Space>g :w<CR>:!lazygit<CR>

" Execute current python file
nnoremap <silent> <Space>r :w<CR>:terminal python %<CR>

" Execute current MicroPython file
nnoremap <silent> <Space>m :w<CR>:terminal /home/igrik/.version_python/build-standard/micropython %<CR>

" Open terminal
nnoremap <silent> <Space>t :terminal<CR>

" Debug current python file
nnoremap <Space>d :w<CR>:! pudb %<CR>

" Copy micropython file to esp32
nnoremap <Space>c :w<CR>:! rshell --buffer-size=30 -p /dev/ttyUSB0 cp % /pyboard<CR>

" Execute micropython current file in esp32
nnoremap <Space>e :w<CR>:! rshell --buffer-size=30 -p /dev/ttyUSB0 repl pyboard import %:r<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Nerdtree mapping
nnoremap <C-n> :NERDTreeToggle<CR>

" Tagbar mapping
nnoremap <C-t> :TagbarToggle<CR>

" Formating python files through black
nnoremap <silent> ff :Format<CR>

" Mapping for COC

" Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all
" diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specifie filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selecte region.
" Example: `<leader>aap` for curren paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the" current line.
nmap <leader>cl <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' suppor from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll floa windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

"Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status for integrations with external
" plugins tha provide custom statusline:lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList Show all diagnostics.
nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p :<C-u>CocListResume<CR>for syntastic

