local ADDON_NAME = "MacroManager"

local frame = CreateFrame("FRAME");

frame:RegisterEvent("ADDON_LOADED");
frame:RegisterEvent("PLAYER_LOGOUT");

frame:SetScript("OnEvent", function(self, event, addon)
  if event == "ADDON_LOADED" and addon == ADDON_NAME then
    MacroManagerDataAccessor:Initialize();
  elseif event == "PLAYER_LOGOUT" then
    MacroManagerDataAccessor:Finalize();
  end
end);

SLASH_MACROMANAGER1 = "/macromanager";
function SlashCmdList.MACROMANAGER(msg)
  ------------------------------ BEGIN: TEST CODE ------------------------------
  if MacroManagerData.count == nil then
    MacroManagerData.count = 0;
  end
  MacroManagerData.count = MacroManagerData.count + 1;
  print("Count " .. MacroManagerData.count);
  ------------------------------- END: TEST CODE -------------------------------
end