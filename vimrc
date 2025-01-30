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
