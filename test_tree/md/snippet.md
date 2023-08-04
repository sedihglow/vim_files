# Vim Markdown

[![Vint](https://github.com/preservim/vim-markdown/workflows/Vint/badge.svg)](https://github.com/preservim/vim-markdown/actions?workflow=Vint)
[![Vader](https://github.com/preservim/vim-markdown/workflows/Vader/badge.svg)](https://github.com/preservim/vim-markdown/actions?workflow=Vader)

Syntax highlighting, matching rules and mappings for [the original Markdown](http://daringfireball.net/projects/markdown/) and extensions.

1. [Installation](#installation)
1. [Basic usage](#basic-usage)
1. [Options](#options)
1. [Mappings](#mappings)
1. [Commands](#commands)
1. [Credits](#credits)
1. [License](#license)

## Installation

If you use [Vundle](https://github.com/gmarik/vundle), add the following lines to your `~/.vimrc`:

```vim
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
```

The `tabular` plugin must come *before* `vim-markdown`.

Then run inside Vim:

```vim
:so ~/.vimrc
:PluginInstall
```

If you use [Pathogen](https://github.com/tpope/vim-pathogen), do this:

```sh
cd ~/.vim/bundle
git clone https://github.com/preservim/vim-markdown.git
```

To install without Pathogen using the Debian [vim-addon-manager](http://packages.qa.debian.org/v/vim-addon-manager.html), do this:

```sh
git clone https://github.com/preservim/vim-markdown.git
cd vim-markdown
sudo make install
vim-addon-manager install markdown
```

If you are using a package manager with semver support (like [lazy.nvim](https://github.com/folke/lazy.nvim)) make sure you are following the master branch (see https://github.com/preservim/vim-markdown/issues/616).

If you are not using any package manager, download the [tarball](https://github.com/preservim/vim-markdown/archive/master.tar.gz) and do this:

```sh
cd ~/.vim
tar --strip=1 -zxf vim-markdown-master.tar.gz
```

## Basic usage

### Folding

Folding is enabled for headers by default.

The following commands are useful to open and close folds:

- `zr`: reduces fold level throughout the buffer
- `zR`: opens all folds
- `zm`: increases fold level throughout the buffer
- `zM`: folds everything all the way
- `za`: open a fold your cursor is on
- `zA`: open a fold your cursor is on recursively
- `zc`: close a fold your cursor is on
- `zC`: close a fold your cursor is on recursively

[Options](#options) are available to disable folding or change folding style.

Try `:help fold-expr` and `:help fold-commands` for details.

### Concealing

Concealing is set for some syntax such as bold, italic, code block and link.

Concealing lets you conceal text with other text. The actual source text is not modified. If you put your cursor on the concealed line, the conceal goes away.

[Options](#options) are available to disable or change concealing.

Try `:help concealcursor` and `:help conceallevel` for details.

## Options

### Disable Folding

-   `g:vim_markdown_folding_disabled`

    Add the following line to your `.vimrc` to disable the folding configuration:

        let g:vim_markdown_folding_disabled = 1

    This option only controls Vim Markdown specific folding configuration.

    To enable/disable folding use Vim's standard folding configuration.

        set [no]foldenable

### Change fold style

-   `g:vim_markdown_folding_style_pythonic`

    To fold in a style like [python-mode](https://github.com/klen/python-mode), add the following to your `.vimrc`:

        let g:vim_markdown_folding_style_pythonic = 1

    `g:vim_markdown_folding_level` setting (default 1) is set to `foldlevel`.
    Thus level 1 heading which is served as a document title is expanded by default.

-   `g:vim_markdown_override_foldtext`

    To prevent foldtext from being set add the following to your `.vimrc`:

        let g:vim_markdown_override_foldtext = 0

### Set header folding level

-   `g:vim_markdown_folding_level`

    Folding level is a number between 1 and 6. By default, if not specified, it is set to 1.

        let g:vim_markdown_folding_level = 6

    Tip: it can be changed on the fly with:

        :let g:vim_markdown_folding_level = 1
        :edit
