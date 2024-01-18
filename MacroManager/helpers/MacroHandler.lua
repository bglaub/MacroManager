
MacroHandler = {}

local get_macro_indices = function(global)
  local globalMacroCount, characterMacroCount = GetNumMacros();
  local start_index = global and 1 or 121;
  local stop_index = start_index + (global and globalMacroCount or characterMacroCount) - 1
  return start_index, stop_index;
end

local get_macros = function(global)

  local macros = {};

  local start, stop = get_macro_indices(global);

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
  MacroManagerDataAccessor:BackupCharacterMacros(get_macros(false));
end