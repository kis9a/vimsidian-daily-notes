# vimsidian-daily-notes

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

## LICENSE

[WTFPL license - Do What The F\*ck You Want To Public License](./LICENSE.md)
