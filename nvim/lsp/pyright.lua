return {
	settings = {
		pyright = {
			-- Disable Pyright's import organizer if you're using Ruff for that
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				-- Optionally ignore everything for analysis and delegate linting to Ruff
				ignore = { "*" },
				-- Or use strict type checking:
				-- typeCheckingMode = "strict",
			},
		},
	},
}
