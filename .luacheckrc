std = "lua51"
exclude_files = {
	".luacheckrc",
	".release/*"
}
ignore = {
	---------------------------------------------------------------------------
	-- Ignore any undefined that start with SLASH_ since this is a slash
	-- command
	---------------------------------------------------------------------------
	"11./SLASH_.*",

	---------------------------------------------------------------------------
	-- Ignore unused arguments in order to strike a balance. While unused
	-- arguments are not great, a large portion of time they cannot be left
	-- out. The current opinnion is that it is better to see a meaningful name
	-- in that case rather than _.
	---------------------------------------------------------------------------
	"212"
}
globals = {
	---------------------------------------------------------------------------
	-- MacroManager Specific
	---------------------------------------------------------------------------
	"SlashCommand",
	"MacroHandler",
	"MacroManagerData",
	"MacroManagerDataAccessor",
	"MacroManagerMainFrame",

	---------------------------------------------------------------------------
	-- Blizzard API
	---------------------------------------------------------------------------
	"strsub",
	"SlashCmdList",
	"CreateFrame",
	"UIParent",
	"UnitName",
	"GetNumMacros",
	"GetMacroInfo",

	----------------------------------------------------------------------------
	-- Blizzard API for Dev Tools
	----------------------------------------------------------------------------
	"LoadAddOn",
	"ReloadUI",
	"NUM_CHAT_WINDOWS",
	"FrameStackTooltip_Toggle"
}