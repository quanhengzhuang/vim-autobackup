" 2012.5.31 快速保存并备份 backup.vim

" Load once
if exists('g:loaded_autobackup')
    finish
endif

let g:loaded_autobackup = 1

autocmd BufWritePost * call BackupCurrentFile()

function! BackupCurrentFile()
    let dir = '~/.bak/'.strftime('%Y%m')
    let bakfilename = dir.'/'.strftime('%Y%m%d-%H-%M-%S.').fnamemodify(bufname('%'), ':t')
    call system('mkdir -p '.dir)
    call system('cp '.bufname("%").' '.bakfilename)
endfunction
