local Brew= {}

Brew.optionEnable = Menu.AddOptionBool({ "Hero Specific","Brew Master"}, "Enable", "Brew Master")
Brew.stunkey = Menu.AddKeyOption({ "Hero Specific", "Brew Master"}, "earth panda stun", Enum.ButtonCode.BUTTON_CODE_NONE)
Brew.eulkey = Menu.AddKeyOption({ "Hero Specific", "Brew Master"}, "storm panda eul", Enum.ButtonCode.BUTTON_CODE_NONE)
Brew.dispelkey = Menu.AddKeyOption({ "Hero Specific", "Brew Master"}, "storm panda dispel", Enum.ButtonCode.BUTTON_CODE_NONE)
Brew.stealthkey = Menu.AddKeyOption({ "Hero Specific", "Brew Master"}, "storm panda stealth", Enum.ButtonCode.BUTTON_CODE_NONE)

function Brew.OnUpdate()
if not Menu.IsEnabled(Brew.optionEnable) then return end
myHero = Heroes.GetLocal()
if not myHero or NPC.GetUnitName(myHero) ~= "npc_dota_hero_brewmaster" then return end
enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
enemypos = Entity.GetAbsOrigin(enemy)
if Menu.IsKeyDown(Brew.stunkey) then
if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then return end
for i = 1, NPCs.Count() do
	local npc = NPCs.Get(i)
	if npc and npc ~= myHero and Entity.IsSameTeam(myHero, npc) then
				if (Entity.GetOwner(myHero) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, myHero)) then
					if NPC.GetUnitName(npc) == "npc_dota_brewmaster_earth_1" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_earth_2" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_earth_3" then
local stun = NPC.GetAbility(npc, "brewmaster_earth_hurl_boulder")
emana = NPC.GetMana(npc)
if stun and Ability.IsCastable(stun, emana) and Ability.IsReady(stun) then
Ability.CastTarget(stun, enemy) 
end
end
end
end
end
end
if Menu.IsKeyDown(Brew.eulkey) then 
if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then return end
for i = 1, NPCs.Count() do
	local npc = NPCs.Get(i)
	if npc and npc ~= myHero and Entity.IsSameTeam(myHero, npc) then
				if (Entity.GetOwner(myHero) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, myHero)) then
					if NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_1" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_2" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_3" then
local eul = NPC.GetAbility(npc, "brewmaster_storm_cyclone")
smana = NPC.GetMana(npc)
if eul and Ability.IsCastable(eul, smana) and Ability.IsReady(eul) then
Ability.CastTarget(eul, enemy) 
end
end
end
end
end 
end
if Menu.IsKeyDown(Brew.dispelkey) then 
for i = 1, NPCs.Count() do
	local npc = NPCs.Get(i)
	if npc and npc ~= myHero and Entity.IsSameTeam(myHero, npc) then
				if (Entity.GetOwner(myHero) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, myHero)) then
					if NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_1" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_2" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_3" then
local dispel = NPC.GetAbility(npc, "brewmaster_storm_dispel_magic")
smana = NPC.GetMana(npc)
if dispel and Ability.IsCastable(dispel, smana) and Ability.IsReady(dispel) then
Ability.CastPosition(dispel, enemypos) 
end
end
end
end
end 
end
if Menu.IsKeyDown(Brew.stealthkey) then 
for i = 1, NPCs.Count() do
	local npc = NPCs.Get(i)
	if npc and npc ~= myHero and Entity.IsSameTeam(myHero, npc) then
				if (Entity.GetOwner(myHero) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, myHero)) then
					if NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_1" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_2" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_3" then
local stealth = NPC.GetAbility(npc, "brewmaster_storm_wind_walk")
smana = NPC.GetMana(npc)
if stealth and Ability.IsCastable(stealth, smana) and Ability.IsReady(stealth) then
Ability.CastNoTarget(stealth, enemy) 
end
end
end
end
end
end 
end

return Brew
