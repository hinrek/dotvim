function! personal#wiki#file_open(...) abort dict " {{{1
  if self.path =~# 'pdf$'
    silent execute '!zathura' fnameescape(self.path) '&'
    return 1
  endif

  if self.path =~# 'png$'
    silent execute '!feh -.' fnameescape(self.path) '&'
    return 1
  endif

  if self.path =~# '\v(docx|xls)$'
    silent execute '!libreoffice' fnameescape(self.path) '&'
    return 1
  endif
endfunction

" }}}1
function! personal#wiki#open_diary() abort " {{{1
  " Connection between calendar.vim and wiki plugin
  let l:date = printf('%d-%0.2d-%0.2d',
        \ b:calendar.day().get_year(),
        \ b:calendar.day().get_month(),
        \ b:calendar.day().get_day())

  call wiki#journal#make_note(l:date)
endfunction

" }}}1
