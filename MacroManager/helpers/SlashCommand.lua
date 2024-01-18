
SlashCommand = {}

function SlashCommand:Add(name, func, ...)
  SlashCmdList[name] = func
  for i = 1, select('#', ...) do
    local command = select(i, ...)
    if strsub(command, 1, 1) ~= '/' then
      command = '/' .. command
    end
    _G['SLASH_'..name..i] = command
  end
end