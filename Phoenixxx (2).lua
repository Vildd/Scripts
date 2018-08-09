local Phoenix = {}

Phoenix.optionEnable = Menu.AddOptionBool({ "Hero Specific", "Phoenix" }, "Phoenix", false)
Phoenix.FireSpiritTargetKey = Menu.AddKeyOption({ "Hero Specific", "Phoenix" }, "Fire spirit at the target", Enum.ButtonCode.BUTTON_CODE_NONE)
Phoenix.FireSpiritKey = Menu.AddKeyOption({ "Hero Specific", "Phoenix" }, "Fire spirit at combo", Enum.ButtonCode.BUTTON_CODE_NONE)
Phoenix.ComboKey = Menu.AddKeyOption({ "Hero Specific", "Phoenix" }, "Combo key", Enum.ButtonCode.BUTTON_CODE_NONE)
Phoenix.optionEnableOrchid  = Menu.AddOptionBool({"Hero Specific", "Phoenix","Items"},"use Orchid",false)
Phoenix.optionEnableThorn  = Menu.AddOptionBool({"Hero Specific", "Phoenix","Items"},"use Bloodthorn ",false)
Phoenix.optionEnableUrn = Menu.AddOptionBool({"Hero Specific", "Phoenix","Items"},"use Urn of Shadows",false)
Phoenix.optionEnableVessel = Menu.AddOptionBool({"Hero Specific", "Phoenix","Items"},"use Spirit Vessel",false)
Phoenix.optionEnableDiscord = Menu.AddOptionBool({"Hero Specific", "Phoenix","Items"},"use Veil of Discord",false)
Phoenix.optionEnableShiva = Menu.AddOptionBool({"Hero Specific", "Phoenix","Items"},"use Shiva's Guard",false)
Phoenix.optionEnableHex = Menu.AddOptionBool({"Hero Specific", "Phoenix","Items"},"use Scythe of Vyse",false)
Phoenix.optionEnableHeaven = Menu.AddOptionBool({"Hero Specific", "Phoenix","Items"},"use Heaven's Halberd",false)



function Phoenix.OnUpdate()
  if not Menu.IsEnabled( Phoenix.optionEnable ) then return 
  end

  myHero = Heroes.GetLocal()
  mana = NPC.GetMana(myHero)
  
  if not myHero or NPC.GetUnitName(myHero) ~= "npc_dota_hero_phoenix" then return 
  end

    if Menu.IsKeyDownOnce(Phoenix.FireSpiritTargetKey) then 
	Phoenix.FireSpirit(myHero, enemy) 
	end
	
	if Menu.IsKeyDownOnce(Phoenix.FireSpiritKey) then 
	Phoenix.FireSpiritCombo(myHero, enemy) 
	end
	
	if Menu.IsKeyDown(Phoenix.ComboKey) then 
	Phoenix.Combo(myHero, enemy) 
	end
end

function Phoenix.Combo(myHero)
enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
local fs = NPC.GetAbility(myHero, "phoenix_fire_spirits")
local lfs = NPC.GetAbility(myHero, "phoenix_launch_fire_spirit")
local sn = NPC.GetAbility(myHero, "phoenix_supernova")
local orchd = NPC.GetItem(myHero, "item_orchid", true)
local thorn = NPC.GetItem(myHero, "item_bloodthorn", true)
local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
local shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
local hex = NPC.GetItem(myHero, "item_sheepstick", true)
local hh = NPC.GetItem(myHero, "item_heavens_halberd", true)
local scptr = NPC.GetItem(myHero, "item_ultimate_scepter", true)
local aBuff = NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed")

if sn and Ability.IsReady(sn) and Ability.IsCastable(sn, mana) then
if fs and Ability.IsReady(fs) and Ability.IsCastable(fs, mana-Ability.GetManaCost(sn)) then
Ability.CastNoTarget(fs)
end
if shiva and Ability.IsReady(shiva) and Ability.IsCastable(shiva, mana) then
Ability.CastNoTarget(shiva)
end
if veil and Ability.IsReady(veil) and Ability.IsCastable(veil, mana-Ability.GetManaCost(sn))  then
Ability.CastPosition(veil, Entity.GetAbsOrigin(enemy))
end
if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_DISARMED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) then
if Menu.IsEnabled( Phoenix.optionEnableHeaven ) and  hh and Ability.IsCastable(hh, mana-Ability.GetManaCost(sn)) and Ability.IsReady(hh) then
Ability.CastTarget(hh, enemy) 
end
if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
if Menu.IsEnabled( Phoenix.optionEnableHex ) and  hex and Ability.IsCastable(hex, mana-Ability.GetManaCost(sn)) and Ability.IsReady(hex) then
Ability.CastTarget(hex, enemy) 
end
if Menu.IsEnabled( Phoenix.optionEnableOrchid ) and orchd and Ability.IsCastable(orchd, mana-Ability.GetManaCost(sn)) and Ability.IsReady(orchd) then
Ability.CastTarget(orchd, enemy) 
end
if Menu.IsEnabled( Phoenix.optionEnableThorn ) and thorn and Ability.IsCastable(thorn, mana-Ability.GetManaCost(sn)) and Ability.IsReady(thorn) then
Ability.CastTarget(thorn, enemy) 
end
end
end
else
if fs and Ability.IsReady(fs) and Ability.IsCastable(fs, mana) then
Ability.CastNoTarget(fs)
end
if shiva and Ability.IsReady(shiva) and Ability.IsCastable(shiva, mana) then
Ability.CastNoTarget(shiva)
end
if veil and Ability.IsReady(veil) and Ability.IsCastable(veil, mana) then
Ability.CastPosition(veil, Entity.GetAbsOrigin(enemy))
end 
if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_DISARMED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) then
if Menu.IsEnabled( Phoenix.optionEnableHeaven ) and  hh and Ability.IsCastable(hh, mana) and Ability.IsReady(hh) then
Ability.CastTarget(hh, enemy) 
end
if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
if Menu.IsEnabled( Phoenix.optionEnableHex ) and  hex and Ability.IsCastable(hex, mana) and Ability.IsReady(hex) then
Ability.CastTarget(hex, enemy) 
end
if Menu.IsEnabled( Phoenix.optionEnableOrchid ) and orchd and Ability.IsCastable(orchd, mana) and Ability.IsReady(orchd) then
Ability.CastTarget(orchd, enemy) 
end
if Menu.IsEnabled( Phoenix.optionEnableThorn ) and thorn and Ability.IsCastable(thorn, mana) and Ability.IsReady(thorn) then
Ability.CastTarget(thorn, enemy) 
end
end
end
end 
local range = 1400
  enemy = Entity.GetHeroesInRadius(myHero, range, Enum.TeamType.TEAM_ENEMY)
  if lfs and Ability.IsReady(lfs) and Ability.IsCastable(lfs, mana) then 
    for i, enemies in ipairs(enemy) do
	  if NPC.HasModifier(enemy, "modifier_phoenix_fire_spirit_burn") then return 
	  else
		if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) or not NPC.IsRunning(enemy) then
			Ability.CastPosition(lfs, Phoenix.InFront(150))
			else
			Ability.CastPosition(lfs, Phoenix.InFront(600))
		end
		end
	end
end
if sn and Ability.IsReady(sn) and Ability.IsCastable(sn, mana) then
if scptr or aBuff then 
Ability.CastTarget(sn, myHero)
else
Ability.CastNoTarget(sn)
end
end
end

function Phoenix.FireSpirit(myHero)
enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
local fs = NPC.GetAbility(myHero, "phoenix_fire_spirits")
local lfs = NPC.GetAbility(myHero, "phoenix_launch_fire_spirit")
local sn = NPC.GetAbility(myHero, "phoenix_supernova")
local orchd = NPC.GetItem(myHero, "item_orchid", true)
local thorn = NPC.GetItem(myHero, "item_bloodthorn", true)
local Urn = NPC.GetItem(myHero, "item_urn_of_shadows", true)
local Vessel = NPC.GetItem(myHero, "item_spirit_vessel", true)
local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
local shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
local hex = NPC.GetItem(myHero, "item_sheepstick", true)
local hh = NPC.GetItem(myHero, "item_heavens_halberd", true)

if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_DISARMED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) then
if Menu.IsEnabled( Phoenix.optionEnableHeaven ) and  hh and Ability.IsCastable(hh, mana) and Ability.IsReady(hh) then
Ability.CastTarget(hh, enemy) 
end
end
if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_DISARMED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) then
if Menu.IsEnabled( Phoenix.optionEnableHex ) and  hex and Ability.IsCastable(hex, mana) and Ability.IsReady(hex) then
Ability.CastTarget(hex, enemy) 
end
if Menu.IsEnabled( Phoenix.optionEnableOrchid ) and orchd and Ability.IsCastable(orchd, mana) and Ability.IsReady(orchd) then
Ability.CastTarget(orchd, enemy) 
end
if Menu.IsEnabled( Phoenix.optionEnableThorn ) and thorn and Ability.IsCastable(thorn, mana) and Ability.IsReady(thorn) then
Ability.CastTarget(thorn, enemy) 
end
end
if Menu.IsEnabled( Phoenix.optionEnableUrn ) and Urn and Ability.IsCastable(Urn, mana) and Ability.IsReady(Urn) then
Ability.CastTarget(Urn, enemy) 
end
if Menu.IsEnabled( Phoenix.optionEnableVessel ) and Vessel and Ability.IsCastable(Vessel, mana) and Ability.IsReady(Vessel) then
Ability.CastTarget(Vessel, enemy) 
end
if Menu.IsEnabled( Phoenix.optionEnableShiva ) and shiva and Ability.IsReady(shiva) and Ability.IsCastable(shiva, mana) then
Ability.CastNoTarget(shiva) 
end	  
if Menu.IsEnabled( Phoenix.optionEnableDiscord ) and veil and Ability.IsReady(veil) and Ability.IsCastable(veil, mana) then
Ability.CastPosition(veil, Entity.GetAbsOrigin(enemy))
end
if fs and Ability.IsCastable(fs, mana) and Ability.IsReady(fs) then
Ability.CastNoTarget(fs)
end	
      if Ability.IsCastable(lfs, 0) and Ability.IsReady(lfs) then 
	  if NPC.HasModifier(enemy, "modifier_phoenix_fire_spirit_burn") then return 
	  else
		if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) or not NPC.IsRunning(enemy) then
			Ability.CastPosition(lfs, Phoenix.InFront(150))
			else
			Ability.CastPosition(lfs, Phoenix.InFront(600))
		end
		end
		end 
		end
end

function Phoenix.FireSpiritCombo(myHero)
local fs = NPC.GetAbility(myHero, "phoenix_fire_spirits")
local lfs = NPC.GetAbility(myHero, "phoenix_launch_fire_spirit")
if fs and Ability.IsReady(fs) and Ability.IsCastable(fs, mana) then
Ability.CastNoTarget(fs)
end
local range = 1400
  local enemy = Entity.GetHeroesInRadius(myHero, range, Enum.TeamType.TEAM_ENEMY)
  if lfs and Ability.IsReady(lfs) and Ability.IsCastable(lfs, mana) then 
    for i, enemies in ipairs(enemy) do
	  if NPC.HasModifier(enemies, "modifier_phoenix_fire_spirit_burn") then return 
	  else
			if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) or not NPC.IsRunning(enemy) then
			Ability.CastPosition(lfs, Phoenix.InFront(150))
			else
			Ability.CastPosition(lfs, Phoenix.InFront(600))
		end
		end
		end
end
end

function Phoenix.InFront(delay)
	local enemyPos = Entity.GetAbsOrigin(enemy)
	local vec = Entity.GetRotation(enemy):GetVectors()
	local adjusment = NPC.GetMoveSpeed(enemy)
	if delay == 610 then
		adjusment = 300
	end
	if vec then		
		local x = enemyPos:GetX() + vec:GetX() *(delay / 1000) * adjusment
		local y = enemyPos:GetY() + vec:GetY() *(delay / 1000) * adjusment
		return Vector(x, y, enemyPos:GetZ())
	end
	end

return Phoenix