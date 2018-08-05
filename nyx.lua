local Nyx = {}

Nyx.optionEnable = Menu.AddOptionBool({ "Hero Specific", "Nyx" }, "Nyx Assassin", false)
Nyx.ComboKey = Menu.AddKeyOption({ "Hero Specific", "Nyx" }, "Combo Key", Enum.ButtonCode.BUTTON_CODE_NONE)
Nyx.optionEnableDagon = Menu.AddOptionBool({"Hero Specific", "Nyx", "Items"}, "use Dagon", false)
Nyx.optionEnableOrchid  = Menu.AddOptionBool({"Hero Specific", "Nyx","Items"},"use Orchid",false)
Nyx.optionEnableThorn  = Menu.AddOptionBool({"Hero Specific", "Nyx","Items"},"use Bloodthorn ",false)
Nyx.optionEnableUrn = Menu.AddOptionBool({"Hero Specific", "Nyx","Items"},"use Urn of Shadows",false)
Nyx.optionEnableVessel = Menu.AddOptionBool({"Hero Specific", "Nyx","Items"},"use Spirit Vessel",false)
Nyx.optionEnableDiscord = Menu.AddOptionBool({"Hero Specific", "Nyx","Items"},"use Veil of Discord",false)
Nyx.optionEnableShiva = Menu.AddOptionBool({"Hero Specific", "Nyx","Items"},"use Shiva's Guard",false)
Nyx.optionEnableBlink = Menu.AddOptionBool({"Hero Specific", "Nyx","Items"},"use Blink Dagger",false)

function Nyx.OnUpdate()
  if not Menu.IsEnabled( Nyx.optionEnable ) then return end
  myHero = Heroes.GetLocal()
  mana = NPC.GetMana(myHero)
  if not myHero or NPC.GetUnitName(myHero) ~= "npc_dota_hero_nyx_assassin" then return end
    if Menu.IsKeyDown(Nyx.ComboKey) then Nyx.Combo(myHero, enemy) end
	enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
end

function Nyx.Combo(myHero, enemy)
local impale = NPC.GetAbility(myHero, "nyx_assassin_impale")
local mburn = NPC.GetAbility(myHero, "nyx_assassin_mana_burn")
local orchd = NPC.GetItem(myHero, "item_orchid", true)
local orchd = NPC.GetItem(myHero, "item_orchid", true)
local thorn = NPC.GetItem(myHero, "item_bloodthorn", true)
local Urn = NPC.GetItem(myHero, "item_urn_of_shadows", true)
local Vessel = NPC.GetItem(myHero, "item_spirit_vessel", true)
local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
local shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
local blink = NPC.GetItem(myHero, "item_blink", true)
local my_origin = Entity.GetAbsOrigin(myHero)
local enemy_origin = Entity.GetAbsOrigin(enemy)
local range_to_enemy = (my_origin - enemy_origin):Length2D()
local dagon = NPC.GetItem(myHero, "item_dagon", true)
	if not dagon then
		for i = 2, 5 do
			dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
			if dagon then break end
		end
	end	

if NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then 
Player.AttackTarget(Players.GetLocal(), myHero, enemy)
else
if range_to_enemy > 600 and range_to_enemy < 1600 then 
Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
end
if Menu.IsEnabled( Nyx.optionEnableDiscord ) and veil and Ability.IsReady(veil) and Ability.IsCastable(veil, mana) then
Ability.CastPosition(veil, Entity.GetAbsOrigin(enemy))
end
if impale and Ability.IsCastable(impale, mana) and Ability.IsReady(impale) then
Ability.CastPosition(impale, Entity.GetAbsOrigin(enemy))
end
if Menu.IsEnabled( Nyx.optionEnableUrn ) and Urn and Ability.IsCastable(Urn, mana) and Ability.IsReady(Urn) then
Ability.CastTarget(Urn, enemy) 
end
if Menu.IsEnabled( Nyx.optionEnableVessel ) and Vessel and Ability.IsCastable(Vessel, mana) and Ability.IsReady(Vessel) then
Ability.CastTarget(Vessel, enemy) 
end
if mburn and Ability.IsCastable(mburn, mana) and Ability.IsReady(mburn) then
Ability.CastTarget(mburn, enemy) 
end
if Menu.IsEnabled( Nyx.optionEnableOrchid ) and orchd and Ability.IsCastable(orchd, mana) and Ability.IsReady(orchd) then
Ability.CastTarget(orchd, enemy) 
end
if Menu.IsEnabled( Nyx.optionEnableThorn ) and thorn and Ability.IsCastable(thorn, mana) and Ability.IsReady(thorn) then
Ability.CastTarget(thorn, enemy) 
end
if Menu.IsEnabled( Nyx.optionEnableShiva ) and shiva and Ability.IsReady(shiva) and Ability.IsCastable(shiva, mana) then
Ability.CastNoTarget(shiva) 
end  
if Menu.IsEnabled( Nyx.optionEnableDagon ) and dagon and Ability.IsCastable(dagon, mana) and Ability.IsReady(dagon) then
Ability.CastTarget(dagon, enemy) 
end
end
end

return Nyx