vim.g.mapleader = ','

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>')

vim.keymap.set('n', '<leader>tc', ':tabclose<cr>gT')
vim.keymap.set('n', '<leader>tn', ':tabnew<cr>')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('', '<leader>bd', ':Bclose<cr>:tabclose<cr>')
vim.keymap.set('', '<leader>ba', ':bufdo bd<cr>')

vim.keymap.set('n', '<M-j>', 'mz:m+<cr>`z')
vim.keymap.set('n', '<M-k>', 'mz:m-2<cr>`z')
vim.keymap.set('v', '<M-j>', ":m'>+<cr>`<my`y>mzgv`yo`z")
vim.keymap.set('v', '<M-k>', ":m'<-2<cr>`>my`<mzgv`yo`z")

vim.keymap.set('v', '*', ":<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>", { silent = true })
vim.keymap.set('v', '#', ":<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>", { silent = true })

vim.keymap.set('n', '<leader>ex', ':NvimTreeOpen<cr>', { desc = 'Open File Tree' })

vim.cmd [[

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

]]
