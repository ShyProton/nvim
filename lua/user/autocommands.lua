vim.cmd [[
  augroup _lua
    autocmd!
    autocmd FileType lua setlocal shiftwidth=2
    autocmd FileType lua setlocal tabstop=2
  augroup end

  " augroup _dart
  "   autocmd!
  "   autocmd FileType dart setlocal shiftwidth=2
  "   autocmd FileType dart setlocal tabstop=2
  " augroup end

  " augroup _asm
  "   autocmd!
  "   autocmd FileType asm setlocal shiftwidth=2
  "   autocmd FileType asm setlocal tabstop=2
  " augroup end

  augroup _web
    autocmd!
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
    autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
    autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
    autocmd FileType json setlocal shiftwidth=2 tabstop=2
    autocmd FileType css setlocal shiftwidth=2 tabstop=2
    autocmd FileType scss setlocal shiftwidth=2 tabstop=2
    autocmd FileType sass setlocal shiftwidth=2 tabstop=2
  augroup end

  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]
