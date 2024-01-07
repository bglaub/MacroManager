local ADDON_NAME = "MacroManager"

-- Create the main frame that will contain the macro manager
local macro_manager_main_frame = CreateFrame("FRAME", "MacroManagerMainFrame", UIParent, "BasicFrameTemplateWithInset");

-- Set all the UI factors of the main frame
macro_manager_main_frame:SetMovable(true);
macro_manager_main_frame:EnableMouse(true);
macro_manager_main_frame:RegisterForDrag("LeftButton");
macro_manager_main_frame:SetScript("OnDragStart", macro_manager_main_frame.StartMoving);
macro_manager_main_frame:SetScript("OnDragStop", macro_manager_main_frame.StopMovingOrSizing);
macro_manager_main_frame:SetWidth(1000);
macro_manager_main_frame:SetHeight(500);
macro_manager_main_frame:SetPoint("CENTER");
macro_manager_main_frame:Hide();

-- Establish the events that the main frame should be concerned with
macro_manager_main_frame:RegisterEvent("ADDON_LOADED");
macro_manager_main_frame:RegisterEvent("PLAYER_LOGOUT");

-- Establish the event handler for the main frame
macro_manager_main_frame:SetScript("OnEvent", function(self, event, addon)
  if event == "ADDON_LOADED" and addon == ADDON_NAME then
    MacroManagerDataAccessor:Initialize();
  elseif event == "PLAYER_LOGOUT" then
    MacroManagerDataAccessor:Finalize();
  end
end);

SlashCommand:Add(ADDON_NAME, function()
  macro_manager_main_frame:Show();
  ------------------------------ BEGIN: TEST CODE ------------------------------
  if MacroManagerData.count == nil then
    MacroManagerData.count = 0;
  end
  MacroManagerData.count = MacroManagerData.count + 1;
  print("Count " .. MacroManagerData.count);
  ------------------------------- END: TEST CODE -------------------------------
end, "/macromanager", "/macm");