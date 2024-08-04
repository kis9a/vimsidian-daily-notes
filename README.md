# vimsidian-daily-notes

* [Daily notes - Obsidian Help](https://help.obsidian.md/Plugins/Daily+notes)
* [GitHub - kis9a/vimsidian: Vim plugin for PKM like obsidian.md](https://github.com/kis9a/vimsidian)

## Installation

Use your favorite plugin manager.

- Example: [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'kis9a/vimsidian'
Plug 'kis9a/vimsidian-daily-notes'
```

## Examples

### Mappings

```vim
nnoremap <buffer> sd :VimsidianDailyNote<CR>
```

### Custom daily note template

```vim
let g:vimsidian_daily_note_path = g:vimsidian_path . "/daily/" . strftime("%Y-%m")
let g:vimsidian_daily_note_template_path = g:vimsidian_path . "/daily/Daily template.md"
```

The template file can use some parameters. (:h g:vimsidian_daily_note_template_path)

```
[[{{date}}]]

< [[{{previous_date}}]] | [[{{next_date}}]] >

[[{{year}}-{{month}}]] [[{{day}}]] [[{{day_of_week}}]]
```

### Change daily note open mode

```vim
" default
let g:vimsidian_daily_note_open_mode = 'e!'

" newtab
let g:vimsidian_daily_note_open_mode = 'newtab'

" vsplit
let g:vimsidian_daily_note_open_mode = 'vnew'

" hsplit
let g:vimsidian_daily_note_open_mode = 'new'
```

## LICENSE

[WTFPL license - Do What The F\*ck You Want To Public License](./LICENSE.md)
