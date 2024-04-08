set encoding=utf-8
set fileencodings=iso-2022-jp,iso-2022-jp-2,utf-8,euc-jp,sjis

set noerrorbells
set visualbell
set viminfo=

syntax enable
colorscheme slate


" 
" Quickfix
"

nnoremap <silent> q\ :<C-u>call qfutil#toggle()<CR>

nnoremap <silent> n :<C-u>call qfutil#next(v:count)<CR>
nnoremap <silent> p :<C-u>call qfutil#previous(v:count)<CR>
nnoremap <silent> gn :<C-u>call qfutil#last(v:count)<CR>
nnoremap <silent> gp :<C-u>call qfutil#first(v:count)<CR>

nmap <C-g><C-j> g<C-j>
nmap <C-g><C-k> g<C-k>

nnoremap <silent> q. :<C-u>call qfutil#toggle_window()<CR>
nnoremap <silent> qq :<C-u>call qfutil#qq(v:count)<CR>
nnoremap <silent> qn :<C-u>call qfutil#nfile(v:count)<CR>
nnoremap <silent> qp :<C-u>call qfutil#pfile(v:count)<CR>
nnoremap <silent> qa :<C-u>call qfutil#list()<CR>
nnoremap <silent> qo :<C-u>call qfutil#older(v:count)<CR>
nnoremap <silent> qi :<C-u>call qfutil#newer(v:count)<CR>

nnoremap <silent> <expr> qm qfutil#make()
nnoremap <expr> q<Space> qfutil#make('')
nnoremap <expr> qg qfutil#grep('')

nnoremap <silent> q] :<C-u>call qfutil#ltag()<CR>

augroup MyAutoCmd
    autocmd!
    " Open the quickfix window automatically
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
    autocmd QuickFixCmdPost *grep* cwindow
augroup END


"
" cscope
"

set csre
set autochdir

set cscopetag
set cscopetagorder=1
set cscopequickfix=s-,c-,d-,i-,t-,e-

nmap <C-\><C-\> <Plug>(csutil-toggle-csto)

for type in ['s', 'g', 'd', 'c', 't', 'e']
    let mapping = '<C-\>' . type
    let target = ':<C-u>call csutil#find("<cword>", "' . type .
    \                                              '", qfutil#_mode())<CR>'
    execute 'nnoremap' '<silent>' mapping target
endfor

for type in ['f', 'i']
    let mapping = '<C-\>' . type
    let target = ':<C-u>call csutil#find("<cfile>", "' . type .
    \                                              '", qfutil#_mode())<CR>'
    execute 'nnoremap' '<silent>' mapping target
endfor


"
" tab
"

nmap t [Tab]
nnoremap [Tab] <Nop>
nnoremap [Tab]; t
nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap <silent> g<C-n> :<C-u>tablast<CR>
nnoremap <silent> g<C-p> :<C-u>tabfirst<CR>
nmap <C-g><C-n> g<C-n>
nmap <C-g><C-p> g<C-p>
nnoremap <silent> [Tab]a :<C-u>tabs<CR>
nnoremap <silent> [Tab]b :<C-u>call tabutil#buffer(v:count1)<CR>
nnoremap <silent> [Tab]n :<C-u>call tabutil#bnext(v:count1)<CR>
nnoremap <silent> [Tab]p :<C-u>call tabutil#bprevious(v:count1)<CR>
nnoremap <silent> [Tab]x :<C-u>quit<CR>
nnoremap <silent> [Tab]D :<C-u>bdelete<CR>
nmap [Tab]g [Tab]b
nnoremap <silent> [Tab]l :<C-u>call tabutil#move(v:count1)<CR>
nnoremap <silent> [Tab]h :<C-u>call tabutil#move(-v:count1)<CR>
nnoremap <silent> [Tab]L :<C-u>tabmove<CR>
nnoremap <silent> [Tab]H :<C-u>tabmove 0<CR>
nnoremap <silent> <expr> [Tab]M ":\<C-u>tabmove " . v:count . "\<CR>"
nnoremap [Tab]o :<C-u>edit<Space>
nnoremap [Tab]t :<C-u>tab split<Space>
nnoremap [Tab]s :<C-u>split<Space>
nnoremap [Tab]v :<C-u>vsplit<Space>
nmap <expr> [Tab]O "[Tab]o" . <SID>relpath()
nmap <expr> [Tab]T "[Tab]t" . <SID>relpath()
nmap <expr> [Tab]S "[Tab]s" . <SID>relpath()
nmap <expr> [Tab]V "[Tab]v" . <SID>relpath()
nnoremap <silent> [Tab]d :<C-u>call tabutil#close()<CR>
nnoremap <silent> [Tab]q :<C-u>call tabutil#only()<CR>
nnoremap <silent> [Tab]u :<C-u>call tabutil#undo()<CR>
nnoremap <silent> [Tab]U :<C-u>call tabutil#undoall()<CR>
nnoremap <silent> [Tab]<C-t> :<C-u>call tabutil#split()<CR>
nnoremap <silent> [Tab]<C-s> :<C-u>call tabutil#wsplit()<CR>
nnoremap <silent> [Tab]<C-v> :<C-u>call tabutil#vsplit()<CR>
nmap [Tab]m [Tab]<C-t>
nnoremap <silent> [Tab]r :<C-u>call tabutil#reorganize()<CR>
nnoremap <silent> [Tab]R :<C-u>call tabutil#reorganize1()<CR>
nnoremap <silent> [Tab]] :<C-u>tab tag <C-r><C-w><CR>
nnoremap <silent> [Tab]; :<C-u>tab tjump <C-r><C-w><CR>
nnoremap <silent> [Tab]<CR> :<C-u>tab wincmd <C-v><CR><CR>
nnoremap [Tab]f <C-w>gf
nnoremap [Tab]F <C-w>gF
nnoremap [Tab]c <C-w>c
nnoremap <Esc>h <C-w>h
nnoremap <Esc>j <C-w>j
nnoremap <Esc>k <C-w>k
nnoremap <Esc>l <C-w>l
function! s:relpath()
    let path = expand('%:~:.:h')
    if path == '' || path == '.'
        return ''
    else
        return path . '/'
    endif
endfunction


"
" QFixHowm
"
set shellslash

let mygrepprg = 'grep'
let myjpgrepprg = 'agrep.vim'
let MyGrep_MultiEncodingGrepScript = 1

" qfixappにruntimepathを通す
let temp=expand('$DRIVE:\gnupack_msys2\exe\vim\plugins\qfixapp')
execute 'set runtimepath+=' . temp

" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir = expand('$DRIVE:\gnupack_msys2\home\qfixhowm')
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding = 'cp932'
let howm_fileformat = 'dos'

" キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeout timeoutlen=3000 ttimeoutlen=100

" プレビューや絞り込みをQuickFix/ロケーションリストの両方で有効化(デフォルト:2)
let QFixWin_EnableMode = 1

" QFixHowmのファイルタイプ
let QFixHowm_FileType = 'markdown'

" タイトル記号を # に変更する
" let QFixHowm_Title = '#'

" QuickFixウィンドウでもプレビューや絞り込みを有効化
let QFixWin_EnableMode = 1

" QFixHowm/QFixGrepの結果表示にロケーションリストを使用する/しない
let QFix_UseLocationList = 0


"
" My preferences
"

set langmenu=en_US
let temp=expand('$DRIVE:\gnupack_msys2\exe\msys64\usr\bin\ash')
execute 'set shell=' . temp
set grepprg=grep\ -rnIH\ --exclude-dir=.git


nnoremap <esc> :noh<CR><esc>
set tags+=./tags,tags,./call_tags,call_tags

" Accessing tag data in vimscript
" http://andrewra.dev/2011/06/08/vim-and-ctags/

" Invoking ":Function foo" will look for functions in the tag file that
" start with “foo” and load them all in the quickfix window. 
command! -nargs=1 Function call s:Function(<f-args>)
function! s:Function(name)
  " Retrieve tags of the 'f' kind
  let tags = taglist('^'.a:name)
  let tags = filter(tags, 'v:val["kind"] == "f"')

  " Prepare them for inserting in the quickfix window
  let qf_taglist = []
  for entry in tags
    call add(qf_taglist, {
          \ 'pattern':  entry['cmd'],
          \ 'filename': entry['filename'],
          \ })
  endfor

  " Place the tags in the quickfix window, if possible
  if len(qf_taglist) > 0
    call setqflist(qf_taglist)
    copen
  else
    echo "No tags found for ".a:name
  endif
endfunction

"
" Key map in insert mode
"

" Emacsと同じく、<C-a>と<C-e>で行頭・行末へ移動できるようにします。
" 行頭へ移動
cnoremap <C-a> <Home>
inoremap <C-a> <Home>
" 行末へ移動
cnoremap <C-e> <End>
inoremap <C-e> <End>

" Emacsと同じく、<C-n>と<C-p>で一行先・一行前へ移動できるようにします。
" Exコマンドを実装する関数を定義
function! ExecExCommand(cmd)
  silent exec a:cmd
  return ''
endfunction
inoremap <silent> <expr> <C-p> "<C-r>=ExecExCommand('normal k')<CR>"
inoremap <silent> <expr> <C-n> "<C-r>=ExecExCommand('normal j')<CR>"

" Emacsライクな感じで、<C-f>と<C-b>で単語単位で前後に移動できるようにします。
" 補完せず補完ウィンドウを閉じてから移動
inoremap <silent> <expr> <C-b> "<C-r>=ExecExCommand('normal h')<CR>"
inoremap <silent> <expr> <C-f> "<C-r>=ExecExCommand('normal l')<CR>"

" 空いているキーならどれでもいいのですが、ここでは<C-l>を採用します。
inoremap <silent> <expr> <C-l> "<C-r>=ExecExCommand('update')<CR>"
" プラグインによってはこちらのほうが相性がいいかも:
inoremap <C-l> <ESC>:update<CR>

" カーソルを大きく動かしたい場合は、マウスを使ってしまいましょう。
" 当然ですが、マウス/マウスホイールもIME/モードを切り替えることなく
" 使用できます。

set mouse=a

" 現在のカーソル位置から行末尾までを切り取り
imap <C-k> <C-r>=<SID>kill()<CR>

" インサートモードのEscをjjに割当て
inoremap <silent> jj <ESC>

" インサートモードのpasteをCtrl+vに割当て
inoremap 
