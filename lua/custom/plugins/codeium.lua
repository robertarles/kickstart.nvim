local hostname = vim.loop.os_gethostname()
if string.find(hostname, "moriarty") then
	return {
		"Exafunction/codeium.vim",
		event = "BufEnter",
	}
end
return {}
