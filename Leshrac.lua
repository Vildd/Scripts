local Leshrac = {}


Leshrac.option = Menu.AddOptionBool({"VAIO", "Leshrac"}, "Leshrac", false)
Leshrac.optionTarget = Menu.AddOptionSlider({"VAIO", "Leshrac"}, "Target Radius", 200, 1000, 500)
Leshrac.optionCombo = Menu.AddKeyOption({"VAIO", "Leshrac"}, "Combo key", Enum.ButtonCode.BUTTON_CODE_NONE)
Leshrac.optionSilence  = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Silence", false)
Leshrac.optionDiscord  = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Discord", false)
Leshrac.optionShiva  = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Shiva", false)
Leshrac.optionHex  = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Hex", false)
Leshrac.optionAtos  = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Atos", false)
Leshrac.optionUrn  = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Urn", false)
Leshrac.optionBkb = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Bkb", false)
Leshrac.optionComboEul = Menu.AddOptionBool({"VAIO", "Leshrac"}, "Eul in combo", false)
Leshrac.optionBSDenying = Menu.AddOptionBool({"VAIO", "Leshrac"}, "Bloodstone Denying", false)
Leshrac.optionHPDenying = Menu.AddOptionSlider({"VAIO", "Leshrac"}, "HP threshold", 10 ,50, 30)


function Leshrac.OnUpdate()
if not Menu.IsEnabled(Leshrac.option) then return end
myHero = Heroes.GetLocal()
if not myHero or NPC.GetUnitName(myHero) ~= "npc_dota_hero_leshrac" then return end
mana = NPC.GetMana(myHero)
enemy = Leshrac.Target(myHero)
mypos = Entity.GetAbsOrigin(myHero)


--Skills
q = NPC.GetAbility(myHero, "leshrac_split_earth")
w = NPC.GetAbility(myHero, "leshrac_diabolic_edict")
e = NPC.GetAbility(myHero, "leshrac_lightning_storm")
r = NPC.GetAbility(myHero, "leshrac_pulse_nova")


--Items
mom = NPC.GetItem(myHero, "item_mask_of_madness", true)
urn = NPC.GetItem(myHero, "item_urn_of_shadows", true)
vessel = NPC.GetItem(myHero, "item_spirit_vessel", true)
hex = NPC.GetItem(myHero, "item_sheepstick", true)
nullifier = NPC.GetItem(myHero, "item_nullifier", true)
diffusal = NPC.GetItem(myHero, "item_diffusal_blade", true)
mjolnir = NPC.GetItem(myHero, "item_mjollnir", true)
halberd = NPC.GetItem(myHero, "item_heavens_halberd", true)
abyssal = NPC.GetItem(myHero, "item_abyssal_blade", true)
armlet = NPC.GetItem(myHero, "item_armlet", true)
bloodthorn = NPC.GetItem(myHero, "item_bloodthorn", true)
bkb = NPC.GetItem(myHero, "item_black_king_bar", true)
courage = NPC.GetItem(myHero, "item_medallion_of_courage", true)
solar = NPC.GetItem(myHero, "item_solar_crest", true)
blink = NPC.GetItem(myHero, "item_blink", true)
blademail = NPC.GetItem(myHero, "item_blade_mail", true)
orchid = NPC.GetItem(myHero, "item_orchid", true)
lotus = NPC.GetItem(myHero, "item_lotus_orb", true)
atos = NPC.GetItem(myHero, "item_rod_of_atos", true)
cyclone = NPC.GetItem(myHero, "item_cyclone", true)
satanic = NPC.GetItem(myHero, "item_satanic", true)
force = NPC.GetItem(myHero, "item_force_staff", true)
pike = NPC.GetItem(myHero, "item_hurricane_pike", true)
eblade = NPC.GetItem(myHero, "item_ethereal_blade", true)
phase = NPC.GetItem(myHero, "item_phase_boots", true)
dagon = NPC.GetItem(myHero, "item_dagon", true)
if not dagon then
for i = 2, 5 do
dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
if dagon then break end
end
end
discord = NPC.GetItem(myHero, "item_veil_of_discord", true)
shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
refresher = NPC.GetItem(myHero, "item_refresher", true)
soulring = NPC.GetItem(myHero, "item_soul_ring", true)
manta = NPC.GetItem(myHero, "item_manta", true)
necro = NPC.GetItem(myHero, "item_necronomicon", true)
if not necro then
for i = 2, 3 do
necro = NPC.GetItem(myHero, "item_necronomicon_" .. i, true)
if necro then break end
end
end
silver = NPC.GetItem(myHero, "item_silver_edge", true)
scptr = NPC.GetItem(myHero, "item_ultimate_scepter", true)
bloodstone = NPC.GetItem(myHero, "item_bloodstone", true)


if Menu.IsKeyDown(Leshrac.optionCombo) then
if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then return end
if Menu.IsEnabled(Leshrac.optionBkb) and bkb and Ability.IsCastable(bkb, mana-Ability.GetManaCost(q)) and Ability.IsReady(bkb) then
Ability.CastNoTarget(bkb) 
return
end 
if Menu.IsEnabled(Leshrac.optionComboEul) and cyclone then
if Ability.IsCastable(cyclone, mana-Ability.GetManaCost(q)) and Ability.IsReady(cyclone) then
target = enemy
Ability.CastTarget(cyclone, enemy) 
Leshrac.EulTimer = 1.4 + os.clock()
return
end
if Leshrac.EulTimer < os.clock() then
if q and Ability.IsCastable(q, mana) and Ability.IsReady(q) then
Ability.CastPosition(q, Entity.GetAbsOrigin(target)) 
return
end 
if Menu.IsEnabled(Leshrac.optionSilence) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_SILENCED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED)  then
if orchid and Ability.IsCastable(orchid, mana) and Ability.IsReady(orchid) then
Ability.CastTarget(orchid, target) 
return
end
if bloodthorn and Ability.IsCastable(bloodthorn, mana) and Ability.IsReady(bloodthorn) then
Ability.CastTarget(bloodthorn, target) 
return
end
end
if Menu.IsEnabled(Leshrac.optionDiscord) and discord and Ability.IsCastable(discord, mana) and Ability.IsReady(discord) then
Ability.CastPosition(discord, Entity.GetAbsOrigin(target)) 
return
end 
if Menu.IsEnabled(Leshrac.optionShiva) and shiva and Ability.IsCastable(shiva, mana) and Ability.IsReady(shiva) then
Ability.CastNoTarget(shiva) 
return
end 
if e and Ability.IsCastable(e, mana) and Ability.IsReady(e) then
Ability.CastTarget(e, target) 
return
end 
end
else
if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) then
if Menu.IsEnabled(Leshrac.optionHex) and hex and Ability.IsCastable(hex, mana-Ability.GetManaCost(q)) and Ability.IsReady(hex) then
Ability.CastTarget(hex, enemy) 
return
end 
if Menu.IsEnabled(Leshrac.optionAtos) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) and atos and Ability.IsCastable(atos, mana-Ability.GetManaCost(q)) and Ability.IsReady(atos) then
Ability.CastTarget(atos, enemy) 
return
end 
end
if Menu.IsEnabled(Leshrac.optionSilence) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_SILENCED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED)  then
if orchid and Ability.IsCastable(orchid, mana-Ability.GetManaCost(q)) and Ability.IsReady(orchid) then
Ability.CastTarget(orchid, enemy) 
return
end
if bloodthorn and Ability.IsCastable(bloodthorn, mana-Ability.GetManaCost(q)) and Ability.IsReady(bloodthorn) then
Ability.CastTarget(bloodthorn, enemy) 
return
end
end
if Menu.IsEnabled(Leshrac.optionDiscord) and discord and Ability.IsCastable(discord, mana-Ability.GetManaCost(q)) and Ability.IsReady(discord) then
Ability.CastPosition(discord, Leshrac.InFront(150)) 
return
end 
if Menu.IsEnabled(Leshrac.optionShiva) and shiva and Ability.IsCastable(shiva, mana-Ability.GetManaCost(q)) and Ability.IsReady(shiva) then
Ability.CastNoTarget(shiva) 
return
end 
if e and Ability.IsCastable(e, mana-Ability.GetManaCost(q)) and Ability.IsReady(e) then
Ability.CastTarget(e, enemy) 
return
end 
if q and Ability.IsCastable(q, mana) and Ability.IsReady(q) then
if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) and NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) or not NPC.IsRunning(enemy) or NPC.HasModifier(enemy, "modifier_leshrac_lightning_storm_slow") then
Ability.CastPosition(q, Leshrac.InFront(150)) 
else
Ability.CastPosition(q, Leshrac.InFront(700)) 
return
end 
end
end
end


if Menu.IsEnabled(Leshrac.optionBSDenying) then
if bloodstone and Ability.IsCastable(bloodstone, mana) and Ability.IsReady(bloodstone) then
if (Entity.GetHealth(myHero) <= (Entity.GetMaxHealth(myHero) * (Menu.GetValue(Leshrac.optionHPDenying) / 100))) then
enemies = Entity.GetHeroesInRadius(myHero, 1000, Enum.TeamType.TEAM_ENEMY)
if not enemies or #enemies < 1 then return end
Ability.CastPosition(bloodstone,Entity.GetAbsOrigin(myHero)) 
end
end
end
end


function Leshrac.Target(myHero)
if not myHero then return end
enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
if not enemy then return end
targetingRange = Menu.GetValue(Leshrac.optionTarget)
mousePos = Input.GetWorldCursorPos()
enemyDist = (Entity.GetAbsOrigin(enemy) - mousePos):Length2D()
if enemyDist < targetingRange then 
return enemy
else
return mousePos
end
end


function Leshrac.InFront(delay)
enemyPos = Entity.GetAbsOrigin(enemy)
vec = Entity.GetRotation(enemy):GetVectors()
adjusment = NPC.GetMoveSpeed(enemy)
if delay == 610 then
adjusment = 300
end
if vec then		
x = enemyPos:GetX() + vec:GetX() *(delay / 1000) * adjusment
y = enemyPos:GetY() + vec:GetY() *(delay / 1000) * adjusment
return Vector(x, y, enemyPos:GetZ())
end
end


return Leshrac