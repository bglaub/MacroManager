local MacroManager = LibStub("AceAddon-3.0"):NewAddon("MacroManager")
local MacroManagerConsole = LibStub("AceConsole-3.0")

-- Setup the load and unload listeners
function MacroManager:OnEnable()
  MacroManagerDataAccessor:Initialize();
end
function MacroManager:OnDisable()
  MacroManagerDataAccessor:Finalize();
end

-- Create the main frame that will contain the macro manager
local macro_manager_main_frame = MacroManagerMainFrame:Create();

-- Setup the backup macros listener
macro_manager_main_frame.MacroManagerEstablishBackupMacrosListener(function()
  MacroHandler:BackupMacros();
end);

-- Setup the main slash command
local slash_command=function()
  macro_manager_main_frame:Show();
end
MacroManagerConsole:RegisterChatCommand("macromanager", slash_command)
MacroManagerConsole:RegisterChatCommand("macm", slash_command)