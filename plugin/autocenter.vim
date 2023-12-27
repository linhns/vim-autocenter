if !has('vim9script') || v:version < 900
    finish
endif

vim9script

if exists('g:autocenter_starting_ratio')
    g:autocenter_starting_ratio = 2 / 3
endif

def Autocenter()
    if winline() > winheight(0) * g:autocenter_starting_ratio
        execute 'normal zz'
    endif
enddef

def Setup()
    augroup AutocenterAutocmds
        autocmd!
        autocmd InsertEnter * Autocenter()
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

if !exists(":AutocenterDisable")
    command! -nargs=0 AutocenterDisable call Teardown()
endif

if !exists(":AutocenterEnable")
    command! -nargs=0 AutocenterEnable call Setup()
endif

Reset()
