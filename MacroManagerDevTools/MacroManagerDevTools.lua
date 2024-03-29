--------------------------------------------------------------------------------
-- Quick reload with /rl
--------------------------------------------------------------------------------
SLASH_RELOAD1 = "/rl";
SlashCmdList.RELOAD = ReloadUI;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Quick access to framestack with /fs
--------------------------------------------------------------------------------
SLASH_FRAMESTK1 = "/fs";
SlashCmdList.FRAMESTK = function()
    LoadAddOn('Blizzard_DebugTools');
    FrameStackTooltip_Toggle();
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Better arrow key handling
--------------------------------------------------------------------------------
for i = 1, NUM_CHAT_WINDOWS do
    _G["ChatFrame" .. i .. "EditBox"]:SetAltArrowKeyMode(false);
end
--------------------------------------------------------------------------------