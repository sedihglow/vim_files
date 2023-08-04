" Original version of this function aquired from ericbn
" https://vi.stackexchange.com/questions/12293/read-values-from-a-highlight-group?answertab=modifieddesc#tab-top

" ericbn's note when posted:
" I ended up writing a generic function that turns a highlight group into a 
" dictionary of {key}={arg} pairs. Leaving it here for future reference:

" use the output of the hi <group> command to parse out the values set for
" a particular highlight group, then inserting them into a dictionary for
" reference later
" NOTE: This way requires parsing strings, there may be a better way using 
" synIDattr() to build the dictionary or list
function! GetHighlight(group)
  let output = execute('hi ' . a:group)
  let list = split(output, '\s\+')
  let dict = {}
  for item in list
    if match(item, '=') > 0
      let splited = split(item, '=')
      let dict[splited[0]] = splited[1]
    endif
  endfor
  return dict
endfunction
