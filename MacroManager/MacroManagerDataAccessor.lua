
MacroManagerDataAccessor = {}

function MacroManagerDataAccessor:Initialize()
  if MacroManagerData == nil then
    MacroManagerData = {};
  end
end

function MacroManagerDataAccessor:Finalize()
  -- TODO
end