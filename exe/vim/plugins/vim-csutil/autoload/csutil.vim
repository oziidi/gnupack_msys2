" Cscope utility for vim.
" Maintainer: INAJIMA Daisuke <inajima@sopht.jp>
" License: MIT License

let s:cpo_save = &cpo
set cpo&vim

let s:csutil_db = ""

function! s:execute(...)
    let cmd = join(a:000, ' ')
    try
        execute cmd
    catch
        echohl ErrorMsg
        echo substitute(v:exception, '^Vim\%((\a\+)\)\=:', '', '')
        echohl None
    endtry
endfunction

function! csutil#setup()
    let cscope_file =
    \    fnamemodify(&csprg, ":t") == 'gtags-cscope' ? "GTAGS" : "cscope.out"
    let cscope_db = findfile(cscope_file, ".;")

    if !filereadable(cscope_db)
        let cscope_db = ''
    endif

    if cscope_db != ''
        let cscope_db = fnamemodify(cscope_db, ":p")
    endif

    if s:csutil_db == cscope_db
        return
    endif

    let csverb_save = &csverb
    set nocsverb

    if s:csutil_db != ''
        execute 'cscope' 'kill' s:csutil_db
    endif

    if cscope_db != ''
        let cscope_dir = fnamemodify(cscope_db, ":h")
        let cwd = getcwd()
        execute 'lcd' cscope_dir
        execute 'cscope' 'add' cscope_db cscope_dir
        execute 'lcd' cwd
    endif

    let &csverb = csverb_save
    let s:csutil_db = cscope_db
endfunction

function! csutil#find(expr, type, ...)
    let prefix = a:0 > 0 ? a:1 : ''
    let key = expand(a:expr)

    if key == ''
        echohl ErrorMsg
        echo 'E349: No identifier under cursor'
        echohl None
        return
    endif

    call s:execute(prefix . 'cscope', 'find', a:type, key)
endfunction

let &cpo = s:cpo_save
