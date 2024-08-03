if exists('g:loaded_vimsidian_daily_notes_plugin') && g:loaded_vimsidian_daily_notes_plugin
  finish
endif

if !exists('g:vimsidian_path')
  echoerr '[VIMSIDIAN] Required g:vimsidian_path variable'
  finish
endif

if !exists('g:vimsidian_daily_note_path')
  let g:vimsidian_daily_note_path = g:vimsidian_path
else
  let g:vimsidian_daily_note_path = glob(g:vimsidian_daily_note_path)
endif

if !exists('g:vimsidian_daily_note_template_path')
  let g:vimsidian_daily_note_template_path = glob(g:vimsidian_daily_note_path) . '/template.md'
else
  let g:vimsidian_daily_note_template_path = glob(g:vimsidian_daily_note_template_path)
endif

if !exists('g:vimsidian_daily_note_date_format')
  let g:vimsidian_daily_note_date_format = '%Y-%m-%d'
endif

command! VimsidianDailyNote call vimsidian#daily_notes#open()

let g:loaded_vimsidian_daily_notes_plugin = 1
