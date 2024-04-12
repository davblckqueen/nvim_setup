function ColorMyPencils(color) 
	color = color or "moonfly"

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "None" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "None" })
end

ColorMyPencils()
