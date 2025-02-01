syntax enable	
set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set cindent
set foldmethod=indent
set nofoldenable
set clipboard=unnamed
colorscheme slate
let mapleader = " "
set nu
let g:neoterm_default_mod = 'belowright'
set encoding=UTF-8


function SetMappings()
  imap <silent> <C-Enter> <Esc>

  map <silent> <leader>] <C-n> :LspNextDiagnostic<CR>
  map <silent> <leader>[ <C-n> :LspPreviousDiagnostic<CR>

  map <silent> <leader>ca :LspCodeAction<CR>
  map <silent> <leader>gd :LspDefinition<CR>

  map <silent> <c-b> :NERDTreeToggle<CR>

  imap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Esc>"
  imap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


  " Exit terminal insert mode with <Esc>
  tnoremap <Esc> <C-\><C-n>
  tnoremap <S-Tab> <c-\><c-n>

  " Keybinding to toggle the terminal
  nnoremap <leader>tt :Ttoggle<CR>

  map <Leader>ds :call vimspector#Launch()<CR>
  map <Leader>de :call vimspector#Reset()<CR>
  map <Leader>dc :call vimspector#Continue()<CR>

  map <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
  map <Leader>dT :call vimspector#ClearBreakpoints()<CR>

  map <Leader>dr <Plug>VimspectorRestart
  map <Leader>dj <Plug>VimspectorStepOver
  map <Leader>dk <Plug>VimspectorStepInto
  map <Leader>dl <Plug>VimspectorStepOut
endfunction

call SetMappings()

call plug#begin()
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'preservim/nerdtree'
  Plug 'cdelledonne/vim-cmake'
  Plug 'kassio/neoterm'
  Plug 'puremourning/vimspector'
  Plug 'LunarWatcher/auto-pairs'
  Plug 'github/copilot.vim'
  Plug 'ryanoasis/vim-devicons'
call plug#end()

set termguicolors
colorscheme zaibatsu
" override the completion popup colors:
" Use a dark, but slightly different, background for the popup so it stands out.
highlight Pmenu     guibg=#1e1e2e guifg=#c0caf5
highlight PmenuExtra     guibg=#1e1e2e guifg=#c0caf5
highlight PmenuKind     guibg=#1e1e2e guifg=#c0caf5

" Use a subtle accent for the selected item.
highlight PmenuSel  guibg=#2e2e3e guifg=#ffffff

" For the scrollbar, use colors that match the theme’s dark background.
highlight PmenuSbar guibg=#1a1a24
highlight PmenuThumb guibg=#3d3d4e

highlight LspWarningText guibg=#1e1e2e guifg=#c0caf5

autocmd BufReadPost,BufNewFile * :Copilot disable
