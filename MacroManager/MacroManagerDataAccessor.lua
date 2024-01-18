
MacroManagerDataAccessor = {}

function MacroManagerDataAccessor:Initialize()
  if MacroManagerData == nil then
    MacroManagerData = {};
  end
end

function MacroManagerDataAccessor:Finalize()
  -- TODO
end

function MacroManagerDataAccessor:BackupGlobalMacros(macros)
  if MacroManagerData.backup == nil then
    MacroManagerData.backup = {};
  end
  MacroManagerData.backup.global = macros;
end

function MacroManagerDataAccessor:BackupCharacterMacros(macros)
  if next(macros) == nil then
    return;
  end
  if MacroManagerData.backup == nil then
    MacroManagerData.backup = {};
  end
  if MacroManagerData.backup.characters == nil then
    MacroManagerData.backup.characters = {};
  end
  MacroManagerData.backup.characters[UnitName("player")] = macros;
end