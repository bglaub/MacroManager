
MacroManagerMainFrame = {}

function MacroManagerMainFrame:Create()
  -- Create the main frame that will contain the macro manager
  local main_frame = CreateFrame("FRAME", "MacroManagerMainFrame", UIParent, "BasicFrameTemplateWithInset");

  -- Set all the UI factors of the main frame
  main_frame:SetMovable(true);
  main_frame:EnableMouse(true);
  main_frame:RegisterForDrag("LeftButton");
  main_frame:SetScript("OnDragStart", main_frame.StartMoving);
  main_frame:SetScript("OnDragStop", main_frame.StopMovingOrSizing);
  main_frame:SetWidth(1000);
  main_frame:SetHeight(500);
  main_frame:SetPoint("CENTER");
  main_frame:Hide();

  -- Establish the events that the main frame should be concerned with
  main_frame:RegisterEvent("ADDON_LOADED");
  main_frame:RegisterEvent("PLAYER_LOGOUT");

  -- Setup ability to add load and unload listeners
  main_frame.MacroManagerEstablishLoadListener = function(fn)
    main_frame.macro_manager_load_fn = fn;
  end
  main_frame.MacroManagerEstablishUnloadListener = function(fn)
    main_frame.macro_manager_unload_fn = fn;
  end

  -- Establish the event handler for the main frame
  main_frame:SetScript("OnEvent", function(frame, event, addon)
    if event == "ADDON_LOADED" and addon == "MacroManager" then
      frame.macro_manager_load_fn();
    elseif event == "PLAYER_LOGOUT" then
      frame.macro_manager_unload_fn();
    end
  end);

  return main_frame;
end