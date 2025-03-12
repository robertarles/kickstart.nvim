local hostname = vim.loop.os_gethostname()
if string.find(hostname, "DISABLE") then
	return {
		"Exafunction/codeium.vim",
		event = "BufEnter",
	}
end
return {}
