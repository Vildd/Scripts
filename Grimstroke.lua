local VAIO = {}

VAIO.optionEnable = Menu.AddOptionBool({"VAIO"}, "Enable", false)
VAIO.optionTarget = Menu.AddOptionSlider({"VAIO"}, "Target Radius", 200, 1000, 500)

VAIO.optionGrimstroke = Menu.AddOptionBool({ "VAIO", "Grimstroke" }, "Grimstroke", false)
VAIO.optionGrimstrokeCombo = Menu.AddKeyOption({ "VAIO", "Grimstroke" }, "Combo Key", Enum.ButtonCode.BUTTON_CODE_NONE)
VAIO.optionGrimstrokeSilence  = Menu.AddOptionBool({"VAIO", "Grimstroke", "Items"}, "Silence", false)
VAIO.optionGrimstrokeUrn  = Menu.AddOptionBool({"VAIO", "Grimstroke", "Items"}, "Urn", false)
VAIO.optionGrimstrokeHex  = Menu.AddOptionBool({"VAIO", "Grimstroke", "Items"}, "Hex", false)
VAIO.optionGrimstrokeDagon  = Menu.AddOptionBool({"VAIO", "Grimstroke", "Items"}, "Dagon", false)
VAIO.optionGrimstrokeEthereal  = Menu.AddOptionBool({"VAIO", "Grimstroke", "Items"}, "Ethereal", false)
VAIO.optionGrimstrokeDiscord  = Menu.AddOptionBool({"VAIO", "Grimstroke", "Items"}, "Discord", false)


function VAIO.OnUpdate()
	if not Menu.IsEnabled(VAIO.optionEnable) then return end
	myHero = Heroes.GetLocal()
	if not myHero then  return end
	mana = NPC.GetMana(myHero)
	enemy = VAIO.Target(myHero)
	
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


if NPC.GetUnitName(myHero) == "npc_dota_hero_grimstroke" and Menu.IsEnabled(VAIO.optionGrimstroke) then
	
		--Skills
		q = NPC.GetAbilityByIndex(myHero, 0)
		w = NPC.GetAbilityByIndex(myHero, 1)
		e = NPC.GetAbilityByIndex(myHero, 2)
		r = NPC.GetAbilityByIndex(myHero, 3)
		
		--Combo
		if Menu.IsKeyDown(VAIO.optionGrimstrokeCombo) then 
			if q and Ability.IsCastable(q, mana) and Ability.IsReady(q) then 
				Ability.CastPosition(q, VAIO.InFront(900)) 
				return
			end
			enemies = Entity.GetHeroesInRadius(enemy, 550, Enum.TeamType.TEAM_ENEMY)
			if enemies or #enemies > 0 then 
				if r and Ability.IsCastable(r, mana) and Ability.IsReady(r) then 
					Ability.CastTarget(r, enemy) 
					return
				end
			end
			if Menu.IsEnabled(VAIO.optionGrimstrokeSilence) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_SILENCED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED)  then
				if orchid and Ability.IsCastable(orchid, mana) and Ability.IsReady(orchid) then
					Ability.CastTarget(orchid, target) 
					return
				end
				if bloodthorn and Ability.IsCastable(bloodthorn, mana) and Ability.IsReady(bloodthorn) then
					Ability.CastTarget(bloodthorn, target) 
					return
				end
			end
			if Menu.IsEnabled(VAIO.optionGrimstrokeUrn) then
				if urn and Ability.IsCastable(urn, mana) and Ability.IsReady(urn) then
					Ability.CastTarget(urn, target) 
					return
				end
				if vessel and Ability.IsCastable(vessel, mana) and Ability.IsReady(vessel) then
					Ability.CastTarget(vessel, target) 
					return
				end
			end
			if w and Ability.IsCastable(w, mana) and Ability.IsReady(w) then 
				Ability.CastTarget(w, enemy) 
				return
			end
		end
	end
end

--Target
function VAIO.Target(myHero)
	if not myHero then return end
	enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
	if not enemy then return end
	targetingRange = Menu.GetValue(VAIO.optionTarget)
	mousePos = Input.GetWorldCursorPos()
	enemyDist = (Entity.GetAbsOrigin(enemy) - mousePos):Length2D()
	if enemyDist < targetingRange then 
		return enemy
	else
		return mousePos
	end
end

--Prediction
function VAIO.InFront(delay)
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

return VAIO
