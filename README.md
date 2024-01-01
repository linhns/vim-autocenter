# vim-autocenter
This plugin is for those often have to exit to Normal mode
and press `zz`.

It is meant to be minimal while trying to be as smart as possible to detect
whether the user wants to center automatically or not.

Works out of the box and remains configurable.

## Requirements
Vim [9.0](https://www.vim.org/vim90.php) or above
(support for vim9script is required)

## Installation
Please follow your package manager instructions on how to install plugins, or
use Vim in-built package system.

I recommend [vim-plug](https://github.com/junegunn/vim-plug):
```vim
call plug#begin()
Plug 'linhns/vim-autocenter'
call plug#end()
```

## Usage

> After installation, this plugin is enabled by default.

### Commands
| Command | Description |
| :-----: | :---------: |
| `AutocenterEnable` | Enable autocenter |
| `AutocenterDisable`| Disable autocenter|

### Configuration
| Option  | Description | Default |
| :-----: | :---------: | :-----: |
| `activation_ratio` | The ratio of current window line / window height where centering starts. | 0.5 |

It is recommended to keep the ratio at 0.5 as it gives a typewritting-like
experience.

__Example__
```vim
let g:autocenter_options =
    \ {
    \   'activation_ratio': 0.5,
    \ }
```

### Mappings
This plugin expose no mapping at all as I believe users are best suited to
define their own.

__Example__
```vim
nnoremap <leader>e :AutocenterEnable<cr>
nnoremap <leader>d :AutocenterDisable<cr>
```

## Contributing
Feel free to fork this repo and experiment with any changes to suit your
workflow.

Issues are more than welcome. Please submit them
[here](https://github.com/linhns/vim-autocenter/issues).

## Credits
- This [post](https://vi.stackexchange.com/questions/26039/how-to-keep-cursor-vertically-aligned-to-center-even-at-the-end-of-buffer/26055#26055)
on Vi and Vim StackExchange

- [girishji](https://github.com/girishji) for his instructions on how to write
a Vim9 plugin
