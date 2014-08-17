--NEKO
local SCRIPT_NAME = "luluW"
if myHero.charName ~= "Lulu" then return end
local player = GetMyHero()
local QREADY, WREADY, EREADY, RREADY, qOff, wOff, eOff, rOff = false, false, false, false, 0, 0, 0, 0
local SkillQ = {spellKey = _Q, range = myHero:GetSpellData(_Q).range, speed = myHero:GetSpellData(_Q).missileSpeed, delay = 500, width = myHero:GetSpellData(_Q).lineWidth}
local SkillW = {spellKey = _W, range = myHero:GetSpellData(_W).range, speed = myHero:GetSpellData(_W).missileSpeed, delay = 500, width = myHero:GetSpellData(_W).lineWidth}
local SkillE = {spellKey = _E, range = myHero:GetSpellData(_E).range, speed = myHero:GetSpellData(_E).missileSpeed, delay = 500, width = myHero:GetSpellData(_E).lineWidth}
local SkillR = {spellKey = _R, range = myHero:GetSpellData(_R).range, speed = myHero:GetSpellData(_R).missileSpeed, delay = 500, width = myHero:GetSpellData(_R).lineWidth}
local QWERs = {_Q, _W, _E, _R}
function READYskill()
	QREADY = (myHero:CanUseSpell(_Q) == READY)
	WREADY = (myHero:CanUseSpell(_W) == READY)
	EREADY = (myHero:CanUseSpell(_E) == READY)
	RREADY = (myHero:CanUseSpell(_R) == READY)
end
function OnTick()
	ts:update()
	READYskill()
	local candidate = nil
	local closest_distanceSqr = math.huge	
	for _, object in pairs(GetEnemyHeroes()) do
		local distanceSqr = GetDistanceSqr(object, player)
		if object and ValidTarget(object, nil) and GetDistanceSqr(object, player) <= 650*650 then
			if distanceSqr <= closest_distanceSqr then
				candidate = object
				closest_distanceSqr = distanceSqr
			end
		end
	end	
	if candidate and ValidTarget(candidate) and WREADY and lulu.WW and lulu.Enable then CastSpell(_W, candidate) end
end
function Menu_OnLoad()
	OnLoadMenuEmbryo = true
	lulu = scriptConfig("luluW", "||| luluW 0815-1 |||")
	lulu:addSubMenu("WW", 	"visionRangeE")
	lulu.WW:addParam("useWW", 	"WW key: ", 	SCRIPT_PARAM_ONKEYDOWN, false, 32)
	lulu.Enable:addParam("Enable", 			"Enable.",									SCRIPT_PARAM_ONOFF, true)	
end
function OnLoad()
	ts						= TargetSelector(TARGET_LOW_HP_PRIORITY, 2000, DAMAGE_MAGIC or DAMAGE_PHYSICAL)	
end
