" operator_precedence.vim
"
" Generate a table of the order of precedence for all syntax keywords
"
" Author: Kevin Shenoy <kshenoy@gmail.com>
"

function! operator_precedence(operators)
  let precedence = {}
  for i in operators
    let precedence[i] = 0
  endfor

  for i in operators
    for j in operators
      if i < j
        let precedence[i] = max(precedence[i], precedence[j] + 1)
      end
    end
  end

  let table = []
  for i in operators
    table.append([i, precedence[i]])
  end

  return table
endfunction

let operators = split(join([
  '&&', '||', '!',
  '==', '!=', '<', '<=', '>', '>=',
  '+', '-', '*', '/', '%',
  '^', '~',
  '(', ')', '[]', '{}', '<>',
]), '\s')

let table = operator_precedence(operators)

echo table
