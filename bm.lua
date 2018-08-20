local Brew= {}

Brew.optionEnable = Menu.AddOptionBool({ "Hero Specific","Brew Master"}, "Enable", "Brew Master")
Brew.stunkey = Menu.AddKeyOption({ "Hero Specific", "Brew Master"}, "earth panda stun", Enum.ButtonCode.BUTTON_CODE_NONE)
Brew.eulkey = Menu.AddKeyOption({ "Hero Specific", "Brew Master"}, "storm panda eul", Enum.ButtonCode.BUTTON_CODE_NONE)
Brew.dispelkey = Menu.AddKeyOption({ "Hero Specific", "Brew Master"}, "storm panda dispel", Enum.ButtonCode.BUTTON_CODE_NONE)
Brew.stealthkey = Menu.AddKeyOption({ "Hero Specific", "Brew Master"}, "storm panda stealth", Enum.ButtonCode.BUTTON_CODE_NONE)

function Brew.OnUpdate()
if not Menu.IsEnabled(Brew.optionEnable) then return end
myHero = Heroes.GetLocal()
mana = NPC.GetMana(myHero)
if not myHero or NPC.GetUnitName(myHero) ~= "npc_dota_hero_brewmaster" then return end
enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
if Menu.IsKeyDown(Brew.stunkey) then 
for i = 1, NPCs.Count() do
	local npc = NPCs.Get(i)
	if npc and npc ~= myHero and Entity.IsSameTeam(myHero, npc) then
				if (Entity.GetOwner(myHero) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, myHero)) then
					if NPC.GetUnitName(npc) == "npc_dota_brewmaster_earth_1" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_earth_2" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_earth_3" then
local stun = NPC.GetAbility(npc, "brewmaster_earth_hurl_boulder")
Ability.CastTarget(stun, enemy) 
end
end
end
end
end
if Menu.IsKeyDown(Brew.eulkey) then 
for i = 1, NPCs.Count() do
	local npc = NPCs.Get(i)
	if npc and npc ~= myHero and Entity.IsSameTeam(myHero, npc) then
				if (Entity.GetOwner(myHero) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, myHero)) then
					if NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_1" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_2" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_3" then
local eul = NPC.GetAbility(npc, "brewmaster_storm_cyclone")
Ability.CastTarget(eul, enemy) 
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
Ability.CastPosition(dispel, Entity.GetAbsOrigin(enemy)) 
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
Ability.CastNoTarget(stealth, enemy) 
end
end
end
end
end 
end

return Brew