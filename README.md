# vim-runscript

Run the file in the current buffer.

## Installation

You can install vim-runscript using,

* [Pathogen](https://github.com/tpope/vim-pathogen) and git submodules
* [Vundle](https://github.com/gmarik/vundle)
* [VAM](https://github.com/MarcWeber/vim-addon-manager)
* [vim-plug](https://github.com/junegunn/vim-plug)

## Configuration

In your `.vimrc`:

    nmap <Leader>r :call RunScript()<CR>

By default, `RunScript()` will use the interpreter found in the shebang line, falling back to `/bin/sh` if one doesn't exist. Additionally, an interpreter can be defined for a file type. For example, to convert UML diagrams into PNG images, in `~/.vim/after/ftplugin/plantuml.vim`:

    let b:interpreter = "plantuml"
