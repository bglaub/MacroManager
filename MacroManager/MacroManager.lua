local ADDON_NAME = "MacroManager"

-- Create the main frame that will contain the macro manager
local macro_manager_main_frame = MacroManagerMainFrame:Create();

-- Setup the load and unload listeners
macro_manager_main_frame.MacroManagerEstablishLoadListener(function()
  MacroManagerDataAccessor:Initialize();
end);
macro_manager_main_frame.MacroManagerEstablishUnloadListener(function()
  MacroManagerDataAccessor:Finalize();
end);

-- Setup the backup macros listener
macro_manager_main_frame.MacroManagerEstablishBackupMacrosListener(function()
  MacroHandler:BackupMacros();
end);

-- Setup the main slash command
SlashCommand:Add(ADDON_NAME, function()
  macro_manager_main_frame:Show();
end, "/macromanager", "/macm");