local SCRIPT_NAME = "luluW"
if myHero.charName ~= "Lulu" then return end
local player = GetMyHero()
function OnTick()
	ts:update()
	if myHero:GetSpellData(_W).level > 0 and myHero:CanUseSpell(_W) == READY and lulu.WW and lulu.Enable and ts.target and ValidTarget(ts.target, nil) and ts.target.type == player.type and GetDistance(ts.target) <= 650 then CastSpell(_W, ts.target) end
end
function OnLoad()
	lulu = scriptConfig("luluW", "||| luluW 0818-1 |||")
	lulu:addSubMenu("WW", "lulu's WW")
	lulu.WW:addParam("useWW", "WW key: ", SCRIPT_PARAM_ONKEYDOWN, false, 32)
	lulu.Enable:addParam("Enable", "Enable.", SCRIPT_PARAM_ONOFF, true)		
	ts = TargetSelector(TARGET_LOW_HP_PRIORITY, 2000, DAMAGE_MAGIC or DAMAGE_PHYSICAL)	
end
