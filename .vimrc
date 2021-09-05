"**********************************************************************"
" 参考                                                                 "
"  1. 『初心者向けvimrcの設定方法』                                    "
"    - URL: https://qiita.com/iwaseasahi/items/0b2da68269397906c14c   "
"  2. 『Vimの文字コード関連』                                          "
"    - URL: https://qiita.com/take4s5i/items/a347be456b2f1312150c      "
"**********************************************************************"


"------------------------------------------------------------
" 検索系
"------------------------------------------------------------
set hlsearch                       " 検索結果をハイライト表示する
set incsearch                      " 検索ワードの最初の文字を入力した時点で検索を開始させる（インクリメンタル検索）
set ignorecase                     " 検索するときに大文字小文字を区別しない
set smartcase                      " 小文字で検索すると大文字と小文字を無視して検索する（ignorecaseとセット）
"------------------------------------------------------------

"------------------------------------------------------------
" 表示系
"------------------------------------------------------------
syntax on                          " シンタックスハイライトを入れる
set number                         " 行番号を表示する
set showmatch                      " 対応する括弧を強調表示する
set title                          " タイトルを表示する
set shiftwidth=2                   " インデント幅を設定する
set softtabstop=2                  " タブキー押下時に挿入される文字幅を指定する
set expandtab                      " 入力モードでTabキー押下時に半角スペースを挿入する
set tabstop=2                      " ファイル内にあるタブ文字の表示幅を設定する
set shellslash                     " Windowsでパスの区切り文字をスラッシュで扱う
set display=lastline               " 省略せずに表示する
set listchars=tab:^\ ,trail:~      " 行末のスペースを可視化する
"------------------------------------------------------------

"------------------------------------------------------------
" その他
"------------------------------------------------------------
set encoding=utf-8                 " Vimの内部文字コードをutf-8に設定する
set smartindent                    " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set virtualedit=block              " Vimの矩形選択で文字が無くても右へ進める
set whichwrap=b,s,h,l,<,>,[,],~    " 行をまたいで移動できる
set noerrorbells                   " エラーメッセージの表示時にビープを鳴らさない
set history=10000                  " コマンドラインの履歴を10000件保存する
set noswapfile                     " スワップファイルを作成しない
set backspace=indent,eol,start     " 挿入モードでバックスペースで削除できるようにする

" .vimrcを自動で再読み込みする
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" HTML/XMLの閉じタグを自動補完する
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶する
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif
"------------------------------------------------------------
