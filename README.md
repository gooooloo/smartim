# What is this?

SmartIM is a plugin to make vim stand well with input methods. It switches
the input method to English when leaving insert mode and
switches back to Chinese when you enter insert mode again. It consists of 2 tiny programs:

* `im-select`: a command-line utility to get/set active input method
* `smartim.vim`: a vim plugin to do automatic input method switch, using `im-select`

It is Mac-only for now.



# Installation

## Vundle or Vim-Plug
1. Add this line to your ~/.vimrc file:
```Plugin 'gooooloo/smartim'```
2. Open vim and run `:PluginInstall`

## Pathogen
1. `cd ~/.vim/bundle`
2. `git clone git@github.com:gooooloo/smartim.git`

## Others
1. Clone this repository to your local disk
2. Copy `im-select` and `smartim.vim` (both are under `plugin` directory) to your vim plugin directory (usually `.vim/plugins`)

Then, enjoy the convenience!



# Usage

## Mode explain

I design 3 modes to use this plugin:

|              | When Entering Insert Mode | When Leaving Insert Mode |                    Typical Scenario                     |
| :----------: | :-----------------------: | :----------------------: | :-----------------------------------------------------: |
|  Fast Mode   |        do nothing         |        do nothing        |       coding, full english documentation, etc...        |
| English Mode |        do nothing         |   set to English Input   | mainly for English document, occasionally Chinese input |
| Chinese Mode |   set to Chinese Input    |   set to English Input   |            mainly for Chinese documentation             |

## Mode triggering

|              | Commands                            |
| :----------: | ----------------------------------- |
|  Fast Mode   | `: call Smartim_set_fast_mode()`    |
| English Mode | `: call Smartim_set_english_mode()` |
| Chinese Mode | `: call Smartim_set_chinese_mode()` |

By default it is fast mode.

## Work with mapping

I am having such mapping:
```
map <silent> <leader><leader>f :call Smartim_set_fast_mode()<CR>
map <silent> <leader><leader>e :call Smartim_set_english_mode()<CR>
map <silent> <leader><leader>c :call Smartim_set_chinese_mode()<CR>
```

## Setup the Chinese Input

I hard code 双拼 as Chinese Input for this plugin. Feel free to change them to to your own input method ID:

`let g:smartim_english = '<your_english_keyboard_id>'`

`let g:smartim_chinese = '<your_chinese_keyboard_id>'`

# FAQ

## Why fast mode?

Because I found interaction with `im-select` is somehow slow. At most cases I don't need change the input method neither. That's when fast mode should be used.

## Why is it Mac-only?

Because the command-line utility `im-select` uses Mac specific APIs. It should be easy to develop
equivalents for other platforms but I just don't have the time to do so.

## Can I use `im-select` as a standalone utility?

Sure. The usage is very simple: invoke it with no argument to get the ID string of current active
input method; invoke it with an ID string to set current input method.

```
$ im-select
com.apple.keylayout.US # print the ID string of your active input method
$ im-select com.apple.keylayout.US # change your active input method
```
