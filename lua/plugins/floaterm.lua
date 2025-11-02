return {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = "FloatermToggle",
		keys = {
			{"<leader>t", "<cmd>FloatermToggle<cr>", mode={"n", "t"}, desc="FloatermToggle: toggle the terminal window"},
		}
}

