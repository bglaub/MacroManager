local ADDON_NAME = "MacroManager"

local frame = CreateFrame("FRAME");
frame:RegisterEvent("ADDON_LOADED");
frame:RegisterEvent("PLAYER_LOGOUT");

frame:SetScript("OnEvent", function(event, arg1)
    if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
        if MacroManagerData == nil then
            MacroManagerData = {};
        end
    elseif event == "PLAYER_LOGOUT" then
        -- later
    end
end);

SLASH_MACROMANAGER1 = "/macromanager";
function SlashCmdList.MACROMANAGER(msg)
    print("Macro Manager Ran!");
end