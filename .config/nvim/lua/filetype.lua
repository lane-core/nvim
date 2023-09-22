-- Filetypes

vim.filetype.add({
  filename = {
    ['run'] = 'sh'
  },
  pattern = {
    ['.*/srcpkgs/.*/template'] = function()
      local setlocal = vim.opt_local
      setlocal.tabstop = 4
      setlocal.shiftwidth = 4
      setlocal.softtabstop = 4
      setlocal.expandtab = false

      return 'sh'
    end
  }
})
