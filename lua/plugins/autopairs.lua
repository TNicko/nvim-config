local autopairs = require("nvim-autopairs")

autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string" },               -- dont add pairs in lua string treesitter nodes
		javascript = { "template_string" }, -- dont add pairs in js template_str
		java = false,                     -- dont check treesitter on java
	},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- import nvim-cmp plugin safely (completions plugin)
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
	return
end

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
