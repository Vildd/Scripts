Terrorblade = {}

Terrorblade.option = Menu.AddOptionBool({"VAIO", "Terrorblade"}, "Terrorblade", false)
Terrorblade.optionTarget = Menu.AddOptionSlider({"VAIO", "Terrorblade"}, "Target Radius", 200, 1000, 500)
Terrorblade.optionComboKey = Menu.AddKeyOption({"VAIO", "Terrorblade"}, "Combo key", Enum.ButtonCode.BUTTON_CODE_NONE)
Terrorblade.optionDiffusal  = Menu.AddOptionBool({"VAIO", "Terrorblade", "Items"}, "Diffusal", false)
Terrorblade.optionManta  = Menu.AddOptionBool({"VAIO", "Terrorblade", "Items"}, "Manta", false)
Terrorblade.optionBkb  = Menu.AddOptionBool({"VAIO", "Terrorblade", "Items"}, "Bkb", false)
Terrorblade.optionAutoUlt = Menu.AddOptionBool({"VAIO", "Terrorblade"}, "Auto ultimate", false)
Terrorblade.optionUltSlider = Menu.AddOptionSlider({"VAIO", "Terrorblade"}, "HP threshold", 10 ,50, 30)

function Terrorblade.OnUpdate()
if not Menu.IsEnabled(Terrorblade.option) then return end
myHero = Heroes.GetLocal()
if not myHero or NPC.GetUnitName(myHero) ~= "npc_dota_hero_terrorblade" then return end
mana = NPC.GetMana(myHero)
enemy = Terrorblade.Target(myHero)
mypos = Entity.GetAbsOrigin(myHero)

--Skills
local q = NPC.GetAbility(myHero, "terrorblade_reflection")
local w = NPC.GetAbility(myHero, "terrorblade_conjure_image")
local e = NPC.GetAbility(myHero, "terrorblade_metamorphosis")
local r = NPC.GetAbility(myHero, "terrorblade_sunder")

--Items
local mom = NPC.GetItem(myHero, "item_mask_of_madness", true)
local urn = NPC.GetItem(myHero, "item_urn_of_shadows", true)
local vessel = NPC.GetItem(myHero, "item_spirit_vessel", true)
local hex = NPC.GetItem(myHero, "item_sheepstick", true)
local nullifier = NPC.GetItem(myHero, "item_nullifier", true)
local diffusal = NPC.GetItem(myHero, "item_diffusal_blade", true)
local mjolnir = NPC.GetItem(myHero, "item_mjollnir", true)
local halberd = NPC.GetItem(myHero, "item_heavens_halberd", true)
local abyssal = NPC.GetItem(myHero, "item_abyssal_blade", true)
local armlet = NPC.GetItem(myHero, "item_armlet", true)
local bloodthorn = NPC.GetItem(myHero, "item_bloodthorn", true)
local bkb = NPC.GetItem(myHero, "item_black_king_bar", true)
local courage = NPC.GetItem(myHero, "item_medallion_of_courage", true)
local solar = NPC.GetItem(myHero, "item_solar_crest", true)
local blink = NPC.GetItem(myHero, "item_blink", true)
local blademail = NPC.GetItem(myHero, "item_blade_mail", true)
local orchid = NPC.GetItem(myHero, "item_orchid", true)
local lotus = NPC.GetItem(myHero, "item_lotus_orb", true)
local cyclone = NPC.GetItem(myHero, "item_cyclone", true)
local satanic = NPC.GetItem(myHero, "item_satanic", true)
local force = NPC.GetItem(myHero, "item_force_staff", true)
local pike = NPC.GetItem(myHero, "item_hurricane_pike", true)
local eblade = NPC.GetItem(myHero, "item_ethereal_blade", true)
local phase = NPC.GetItem(myHero, "item_phase_boots", true)
local dagon = NPC.GetItem(myHero, "item_dagon", true)
if not dagon then
for i = 2, 5 do
local dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
if dagon then break end
end
end
local discord = NPC.GetItem(myHero, "item_veil_of_discord", true)
local shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
local refresher = NPC.GetItem(myHero, "item_refresher", true)
local soulring = NPC.GetItem(myHero, "item_soul_ring", true)
local manta = NPC.GetItem(myHero, "item_manta", true)
local necro = NPC.GetItem(myHero, "item_necronomicon", true)
if not necro then
for i = 2, 3 do
local necro = NPC.GetItem(myHero, "item_necronomicon_" .. i, true)
if necro then break end
end
end
local silver = NPC.GetItem(myHero, "item_silver_edge", true)
local scptr = NPC.GetItem(myHero, "item_ultimate_scepter", true)

--Combo
if Menu.IsKeyDown(Terrorblade.optionComboKey) then
if Menu.IsEnabled(Terrorblade.optionBkb) and bkb and Ability.IsCastable(bkb, mana) and Ability.IsReady(bkb) then
Ability.CastNoTarget(bkb) 
return
end
if Menu.IsEnabled(Terrorblade.optionDiffusal) and diffusal and Ability.IsCastable(diffusal, mana) and Ability.IsReady(diffusal) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
Ability.CastTarget(diffusal, enemy) 
return
end
if e and Ability.IsCastable(e, mana) and Ability.IsReady(e) then
Ability.CastNoTarget(e) 
return
end 
if Menu.IsEnabled(Terrorblade.optionManta) and manta and Ability.IsCastable(manta, mana) and Ability.IsReady(manta) then
Ability.CastNoTarget(manta) 
return
end
if w and Ability.IsCastable(w, mana) and Ability.IsReady(w) then
Ability.CastNoTarget(w) 
return
end 
enemies = Entity.GetHeroesInRadius(myHero, 900, Enum.TeamType.TEAM_ENEMY)
if enemies and #enemies > 0 then 
if q and Ability.IsCastable(q, mana) and Ability.IsReady(q) then
Ability.CastNoTarget(q) 
return
end 
end
Player.AttackTarget(Players.GetLocal(), myHero, enemy, false)
return
end

--Ult
if Menu.IsEnabled(Terrorblade.optionAutoUlt) then
if r and Ability.IsCastable(r, mana) and Ability.IsReady(r) then
if (Entity.GetHealth(myHero) <= (Entity.GetMaxHealth(myHero) * (Menu.GetValue(Terrorblade.optionUltSlider) / 100))) then
enemies = Entity.GetHeroesInRadius(myHero, 475, Enum.TeamType.TEAM_ENEMY)
if not enemies or #enemies < 1 then return end
for i, enemy in ipairs(enemies) do 
if ((Entity.GetHealth(myHero)*100)/Entity.GetMaxHealth(myHero))<((Entity.GetHealth(enemy)*100)/Entity.GetMaxHealth(enemy)) then
Ability.CastTarget(r, enemy) 
return
end 
end
end
end
end
end

function Terrorblade.Target(myHero)
if not myHero then return end
enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
if not enemy then return end
targetingRange = Menu.GetValue(Terrorblade.optionTarget)
mousePos = Input.GetWorldCursorPos()
enemyDist = (Entity.GetAbsOrigin(enemy) - mousePos):Length2D()
if enemyDist < targetingRange then 
return enemy
else
return mousePos
end
end

return Terrorblade