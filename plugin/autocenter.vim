if !has('vim9script') || v:version < 900
    finish
endif

vim9script

if exists('g:loaded_autocenter')
    finish
endif

g:loaded_autocenter = v:true

def AutoCenter()
    if winline() >= winheight(0) * 2 / 3
        execute 'normal zz'
    endif
enddef

augroup autocenter
    autocmd!
    autocmd InsertEnter * AutoCenter()
augroup end

