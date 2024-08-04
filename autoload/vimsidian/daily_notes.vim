function! vimsidian#daily_notes#open() abort
  if empty(glob(g:vimsidian_daily_note_path)) || !isdirectory(glob(g:vimsidian_daily_note_path))
    call s:info('No such directory ' . g:vimsidian_daily_note_path)
    return
  endif

  let date = strftime(g:vimsidian_daily_note_date_format)
  if empty(date)
    call s:info('Empty strftime date format')
    return
  endif

  let dnote = s:pathJoin(g:vimsidian_daily_note_path, date . '.md')

  if empty(glob(g:vimsidian_daily_note_template_path))
    if empty(glob(dnote))
      let s = vimsidian#daily_notes#replaceParametrizedString("[[{{date}}]]\n\n< [[{{previous_date}}]] | [[{{next_date}}]] >\n\n")
      call s:writeFile(split(s, "\n"), dnote, 'b')
    endif
    call s:openFile(g:vimsidian_daily_note_open_mode, dnote)
  else
    if empty(glob(dnote))
      let r = join(vimsidian#action#ReadFile(g:vimsidian_daily_note_template_path), "\n")
      let r = vimsidian#daily_notes#replaceParametrizedString(r)
      call s:writeFile(split(r, "\n"), dnote, 'b')
    endif
    call s:openFile(g:vimsidian_daily_note_open_mode, dnote)
  endif
endfunction

function! vimsidian#daily_notes#replaceParametrizedString(s) abort
  let now = localtime()
  let aday = (60 * 60 * 24)
  let day = strftime('%d', now)
  let month = strftime('%m', now)
  let year = strftime('%Y', now)
  let day_of_week = strftime('%A', now)
  let date = strftime(g:vimsidian_daily_note_date_format)
  let ndate = strftime(g:vimsidian_daily_note_date_format, now + aday)
  let pdate = strftime(g:vimsidian_daily_note_date_format, now - aday)
  let s = substitute(a:s, '{{date}}', date, 'g')
  let s = substitute(s, '{{day}}', day, 'g')
  let s = substitute(s, '{{month}}', month, 'g')
  let s = substitute(s, '{{year}}', year, 'g')
  let s = substitute(s, '{{previous_date}}', pdate, 'g')
  let s = substitute(s, '{{next_date}}', ndate, 'g')
  let s = substitute(s, '{{day_of_week}}', day_of_week, 'g')
  return s
endfunction

" utils
function! s:info(message)
    echom 'vimsidian_daily_notes: ' . a:message
endfunction

function! s:openFile(opener, file) abort
  execute join([a:opener,  a:file], ' ')
endfunction

function! s:writeFile(s, f, m) abort
  call writefile(a:s, a:f, a:m)
endfunction

function! s:pathJoin(...) abort
  let path = ''
  for part in a:000
    let path .= '/' . (type(part) is type([]) ? call('s:pathJoin', part) :part)
    unlet part
  endfor
  return substitute(path[1 :], (exists('+shellslash') ? '[\\/]' : '/') . '\+', '/', 'g')
endfunction
