syntax on
set hlsearch
set ml sts=2 sw=2 ai et

imap <C-f> <Plug>(copilot-accept-word)
imap <M-f> <Plug>(copilot-accept-line)
imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

au FileType json setlocal equalprg=python\ -m\ json.tool\ --indent\ 2 

let s:is_win = has('win32') || has('win64')
let s:is_openwrt = filereadable('/etc/openwrt_release')

try
  call plug#begin()

  if !s:is_openwrt
    Plug 'github/copilot.vim'
  endif

  call plug#end()
catch
  echom 'Installing vim-plug...'

  if s:is_win
    silent !powershell -Command 'iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME/vimfiles/autoload/plug.vim -Force'
  else
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif

  source $MYVIMRC
  PlugInstall
endtry

