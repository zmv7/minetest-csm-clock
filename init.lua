local clock = nil
local function update()
	local T = core.get_timeofday()
	local H = math.floor(24 * T)
	local M = (T * 24 - H) * 60
    return string.format('%02i',H)..':'..string.format('%02i',M)
end
minetest.register_globalstep(function(dtime)
  if not core.localplayer then return end
  if not clock then
    clock = core.localplayer:hud_add({
      hud_elem_type = "text",
      position = {x = 1, y = 0},
      scale = {x = 100, y = 100},
      number = 0xFFFF00,
      offset = {x = -20, y = 10}})
    if not clock then return end
  end
  core.localplayer:hud_change(clock, "text", update())
end)
