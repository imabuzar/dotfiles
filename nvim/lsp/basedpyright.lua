return {
	settings = {
		basedpyright = {
			-- Disable Pyright's import organizer if you're using Ruff for that
			disableOrganizeImports = true,
			analysis = {
				autoImportCompletions = true,
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				autoFormatStrings = true,
				typeCheckingMode = "recommended", -- "off", "basic", "standard", "strict", "recommended", "all"
				inlayHints = {
					variableTypes = true,
					callArgumentNames = true,
					callArgumentNamesMatching = true,
					functionReturnTypes = true,
				},
			},
		},
	},
}
