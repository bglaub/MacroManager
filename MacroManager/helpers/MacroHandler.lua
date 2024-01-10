
MacroHandler = {}

local get_macros = function(global)

  local macros = {};

  local globalMacroCount,characterMacroCount = GetNumMacros();
  local start = global and 1 or 121;
  local stop = start + (global and globalMacroCount or characterMacroCount) - 1;

  for i = start, stop, 1 do
    local name, texture, body = GetMacroInfo(i);

    macros[i] = {
        name = name
    };

    if texture then
      macros[i].texture = texture;
    end

    if body then
      macros[i].body = body;
    end
  end

  return macros;
end

function MacroHandler:BackupMacros()
  MacroManagerDataAccessor:BackupGlobalMacros(get_macros(true));
end