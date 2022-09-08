local minetest, DIR_DELIM = minetest, DIR_DELIM
local add_flag = pride_flags.add_flag
local get_dir_list = minetest.get_dir_list

local MOD_NAME = minetest.get_current_modname()
local MOD_PATH = minetest.get_modpath(MOD_NAME) .. DIR_DELIM
local MOD_TEXTURES_PATH = MOD_PATH .. DIR_DELIM .. "textures"

local function get_flags(path)
  local result = {}
  for _, v in ipairs(get_dir_list(path, false)) do
    local name = v:match("^prideflag_(.+)%..+$")
    -- print(v,i1,i2,name)
    table.insert(result, name)
  end
  table.sort(result)
  return result
end

local flagNames = get_flags(MOD_TEXTURES_PATH)

for _, name in ipairs(flagNames) do
  add_flag(name)
end

print(MOD_NAME, "DONE")
