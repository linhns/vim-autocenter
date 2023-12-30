if !has('vim9script') || v:version < 900
    finish
endif

vim9script

import autoload '../autoload/options.vim' as opt

def Autocenter()
    # Do not autocenter if the window is too small
    if winheight(0) < 0.5 * &lines
        return
    endif
    # Account for UTF-8
    var at_end = getcursorcharpos()[2] > len(getline('.'))
    if winline() > winheight(0) * opt.options.activation_ratio
        execute 'normal! zz'
    endif

    if at_end
        var cursor_pos = getcursorcharpos()
        cursor_pos[2] += 1
        setcursorcharpos(cursor_pos[1 : ])
    endif
enddef

def Setup()
    opt.SetOptions()
    augroup AutocenterAutocmds
        autocmd!
        autocmd InsertEnter * Autocenter()
        autocmd TextChangedI * Autocenter()
    augroup end
enddef

def Teardown()
    augroup AutocenterAutocmds
        autocmd!
    augroup end
enddef

def Reset()
    Teardown()
    Setup()
enddef

command! -nargs=0 AutocenterDisable call Teardown()

command! -nargs=0 AutocenterEnable call Setup()

Reset()

