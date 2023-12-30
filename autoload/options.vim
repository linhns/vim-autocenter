vim9script

export var options: dict<any> = {
    activation_ratio: 0.5,
}

export def SetOptions()
    if exists('g:autocenter_options')
        options->extend(g:autocenter_options)
    endif
    if options.activation_ratio < 0
        options.activation_ratio = 0
    elseif options.activation_ratio > 1
        options.activation_ratio = 1
    endif
enddef
