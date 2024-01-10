local ADDON_NAME = "MacroManager"

-- Create the main frame that will contain the macro manager
local macro_manager_main_frame = MacroManagerMainFrame:Create();

-- Setup the load and unload listeners
macro_manager_main_frame.MacroManagerEstablishLoadListener(function()
  MacroManagerDataAccessor:Initialize();
end);
macro_manager_main_frame.MacroManagerEstablishUnloadListener(function()
  MacroManagerDataAccessor:Finalize();
end)

-- Setup the main slash command
SlashCommand:Add(ADDON_NAME, function()
  macro_manager_main_frame:Show();
  ------------------------------ BEGIN: TEST CODE ------------------------------
  MacroHandler:BackupMacros();
  if MacroManagerData.count == nil then
    MacroManagerData.count = 0;
  end
  MacroManagerData.count = MacroManagerData.count + 1;
  print("Count " .. MacroManagerData.count);
  ------------------------------- END: TEST CODE -------------------------------
end, "/macromanager", "/macm");