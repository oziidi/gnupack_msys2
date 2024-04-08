" Cscope utility for vim.
" Maintainer: INAJIMA Daisuke <inajima@sopht.jp>
" Revision: 0.3
" License: MIT License

if exists("loaded_csutil")
    finish
endif
let loaded_csutil = 1

if !has('cscope')
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

nnoremap <unique> <script> <Plug>(csutil-toggle-cst)
\        :<C-u>set cst! <Bar> set cst?<CR>
nnoremap <unique> <script> <Plug>(csutil-toggle-csto)
\        :<C-u>let &csto = !&csto <Bar> set csto?<CR>
nnoremap <unique> <script> <Plug>(csutil-find-s)
\        :<C-u>call csutil#find('<cword>', 's')<CR>
nnoremap <unique> <script> <Plug>(csutil-find-g)
\        :<C-u>call csutil#find('<cword>', 'g')<CR>
nnoremap <unique> <script> <Plug>(csutil-find-d)
\        :<C-u>call csutil#find('<cword>', 'd')<CR>
nnoremap <unique> <script> <Plug>(csutil-find-c)
\        :<C-u>call csutil#find('<cword>', 'c')<CR>
nnoremap <unique> <script> <Plug>(csutil-find-t)
\        :<C-u>call csutil#find('<cword>', 't')<CR>
nnoremap <unique> <script> <Plug>(csutil-find-e)
\        :<C-u>call csutil#find('<cword>', 'e')<CR>
nnoremap <unique> <script> <Plug>(csutil-find-f)
\        :<C-u>call csutil#find('<cfile>', 'f')<CR>
nnoremap <unique> <script> <Plug>(csutil-find-i)
\        :<C-u>call csutil#find('<cfile>', 'i')<CR>
nnoremap <unique> <script> <Plug>(csutil-find-a)
\        :<C-u>call csutil#find('<cfile>', 'a')<CR>

nnoremap <unique> <script> <Plug>(csutil-s-find-s)
\        :<C-u>call csutil#find('<cword>', 's', 's')<CR>
nnoremap <unique> <script> <Plug>(csutil-s-find-g)
\        :<C-u>call csutil#find('<cword>', 'g', 's')<CR>
nnoremap <unique> <script> <Plug>(csutil-s-find-d)
\        :<C-u>call csutil#find('<cword>', 'd', 's')<CR>
nnoremap <unique> <script> <Plug>(csutil-s-find-c)
\        :<C-u>call csutil#find('<cword>', 'c', 's')<CR>
nnoremap <unique> <script> <Plug>(csutil-s-find-t)
\        :<C-u>call csutil#find('<cword>', 't', 's')<CR>
nnoremap <unique> <script> <Plug>(csutil-s-find-e)
\        :<C-u>call csutil#find('<cword>', 'e', 's')<CR>
nnoremap <unique> <script> <Plug>(csutil-s-find-f)
\        :<C-u>call csutil#find('<cfile>', 'f', 's')<CR>
nnoremap <unique> <script> <Plug>(csutil-s-find-i)
\        :<C-u>call csutil#find('<cfile>', 'i', 's')<CR>
nnoremap <unique> <script> <Plug>(csutil-s-find-a)
\        :<C-u>call csutil#find('<cfile>', 'a', 's')<CR>

nnoremap <unique> <script> <Plug>(csutil-l-find-s)
\        :<C-u>call csutil#find('<cword>', 's', 'l')<CR>
nnoremap <unique> <script> <Plug>(csutil-l-find-g)
\        :<C-u>call csutil#find('<cword>', 'g', 'l')<CR>
nnoremap <unique> <script> <Plug>(csutil-l-find-d)
\        :<C-u>call csutil#find('<cword>', 'd', 'l')<CR>
nnoremap <unique> <script> <Plug>(csutil-l-find-c)
\        :<C-u>call csutil#find('<cword>', 'c', 'l')<CR>
nnoremap <unique> <script> <Plug>(csutil-l-find-t)
\        :<C-u>call csutil#find('<cword>', 't', 'l')<CR>
nnoremap <unique> <script> <Plug>(csutil-l-find-e)
\        :<C-u>call csutil#find('<cword>', 'e', 'l')<CR>
nnoremap <unique> <script> <Plug>(csutil-l-find-f)
\        :<C-u>call csutil#find('<cfile>', 'f', 'l')<CR>
nnoremap <unique> <script> <Plug>(csutil-l-find-i)
\        :<C-u>call csutil#find('<cfile>', 'i', 'l')<CR>
nnoremap <unique> <script> <Plug>(csutil-l-find-a)
\        :<C-u>call csutil#find('<cfile>', 'a', 'l')<CR>

if !exists('g:csutil_map_prefix')
    let g:csutil_map_prefix = '<C-\>'
endif

if !exists("g:csutil_no_mappings") || !g:csutil_no_mappings
    let s:mapping = g:csutil_map_prefix . g:csutil_map_prefix
    silent! execute 'nmap' '<unique>' s:mapping '<Plug>(csutil-toggle-csto)'
    for s:type in ['s', 'g', 'd', 'c', 't', 'e', 'f', 'i']
        let s:mapping = g:csutil_map_prefix . s:type
        let s:target = '<Plug>(csutil-find-' . s:type . ')'
        silent! execute 'nmap' '<unique>' s:mapping s:target
    endfor
    unlet s:type s:mapping s:target
endif

augroup csutil
    autocmd!
    autocmd BufEnter * call csutil#setup()
augroup END

let &cpo = s:cpo_save
