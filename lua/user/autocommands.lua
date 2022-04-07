vim.cmd [[
  augroup _lua
    autocmd!
    autocmd FileType lua setlocal shiftwidth=2
    autocmd FileType lua setlocal tabstop=2
  augroup end

  augroup _dart
    autocmd!
    autocmd FileType dart setlocal shiftwidth=2
    autocmd FileType dart setlocal tabstop=2
  augroup end

  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]
