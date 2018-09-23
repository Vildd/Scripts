local VAIO = {}

VAIO.optionEnable = Menu.AddOptionBool({"VAIO"}, "Enable", false)
VAIO.optionTarget = Menu.AddOptionSlider({"VAIO"}, "Target Radius", 200, 1000, 500)

--Juggernaut
VAIO.optionJuggernaut = Menu.AddOptionBool({"VAIO", "VAIO"}, "Juggernaut", false)
VAIO.optionJuggernautComboKey = Menu.AddKeyOption({"VAIO", "VAIO"}, "Combo key", Enum.ButtonCode.BUTTON_CODE_NONE)
VAIO.optionJuggernautBlink  = Menu.AddOptionBool({"VAIO", "VAIO", "Items"}, "Blink", false)
VAIO.optionJuggernautAbyssal  = Menu.AddOptionBool({"VAIO", "VAIO", "Items"}, "Abyssal", false)
VAIO.optionJuggernautManta  = Menu.AddOptionBool({"VAIO", "VAIO", "Items"}, "Manta", false)
VAIO.optionJuggernautNullifier  = Menu.AddOptionBool({"VAIO", "VAIO", "Items"}, "Nullifier", false)
VAIO.optionJuggernautSilence  = Menu.AddOptionBool({"VAIO", "VAIO", "Items"}, "Silence", false)
VAIO.optionJuggernautMom  = Menu.AddOptionBool({"VAIO", "VAIO", "Items"}, "Mom", false)
VAIO.optionJuggernautBkb  = Menu.AddOptionBool({"VAIO", "VAIO", "Items"}, "Bkb", false)
VAIO.optionJuggernautTotemControl = Menu.AddOptionBool({"VAIO", "VAIO"}, "Totem control", false)
VAIO.optionJuggernautAutoUlt = Menu.AddOptionBool({"VAIO", "VAIO"}, "Auto ultimate", false)
VAIO.optionJuggernautUltSlider = Menu.AddOptionSlider({"VAIO", "VAIO"}, "HP threshold", 10 ,50, 30)

--Leshrac
VAIO.optionLeshrac = Menu.AddOptionBool({"VAIO", "Leshrac"}, "Leshrac", false)
VAIO.optionLeshracCombo = Menu.AddKeyOption({"VAIO", "Leshrac"}, "Combo key", Enum.ButtonCode.BUTTON_CODE_NONE)
VAIO.optionLeshracSilence  = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Silence", false)
VAIO.optionLeshracDiscord  = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Discord", false)
VAIO.optionLeshracShiva  = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Shiva", false)
VAIO.optionLeshracHex  = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Hex", false)
VAIO.optionLeshracAtos  = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Atos", false)
VAIO.optionLeshracUrn  = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Urn", false)
VAIO.optionLeshracBkb = Menu.AddOptionBool({"VAIO", "Leshrac", "Items"}, "Bkb", false)
VAIO.optionLeshracComboEul = Menu.AddOptionBool({"VAIO", "Leshrac"}, "Eul in combo", false)
VAIO.optionLeshracBSDenying = Menu.AddOptionBool({"VAIO", "Leshrac"}, "Bloodstone Denying", false)
VAIO.optionLeshracHPDenying = Menu.AddOptionSlider({"VAIO", "Leshrac"}, "HP threshold", 10 ,50, 30)

--Terrorblade
VAIO.optionTerrorblade = Menu.AddOptionBool({"VAIO", "Terrorblade"}, "Terrorblade", false)
VAIO.optionTerrorbladeComboKey = Menu.AddKeyOption({"VAIO", "Terrorblade"}, "Combo key", Enum.ButtonCode.BUTTON_CODE_NONE)
VAIO.optionTerrorbladeSilence  = Menu.AddOptionBool({"VAIO", "Terrorblade", "Items"}, "Silence", false)
VAIO.optionTerrorbladeNullifier  = Menu.AddOptionBool({"VAIO", "Terrorblade", "Items"}, "Nullifier", false)
VAIO.optionTerrorbladeDiffusal  = Menu.AddOptionBool({"VAIO", "Terrorblade", "Items"}, "Diffusal", false)
VAIO.optionTerrorbladeManta  = Menu.AddOptionBool({"VAIO", "Terrorblade", "Items"}, "Manta", false)
VAIO.optionTerrorbladeBkb  = Menu.AddOptionBool({"VAIO", "Terrorblade", "Items"}, "Bkb", false)
VAIO.optionTerrorbladeAutoUlt = Menu.AddOptionBool({"VAIO", "Terrorblade"}, "Auto ultimate", false)
VAIO.optionTerrorbladeUltSlider = Menu.AddOptionSlider({"VAIO", "Terrorblade"}, "HP threshold", 10 ,50, 30)

--Slark
VAIO.optionSlark = Menu.AddOptionBool({"VAIO", "VAIO"}, "Slark", false)
VAIO.optionSlarkComboKey = Menu.AddKeyOption({"VAIO", "Slark"}, "Combo key", Enum.ButtonCode.BUTTON_CODE_NONE)
VAIO.optionSlarkSilence  = Menu.AddOptionBool({"VAIO", "Slark", "Items"}, "Silence", false)
VAIO.optionSlarkNullifier  = Menu.AddOptionBool({"VAIO", "Slark", "Items"}, "Nullifier", false)
VAIO.optionSlarkDiffusal  = Menu.AddOptionBool({"VAIO", "Slark", "Items"}, "Diffusal", false)
VAIO.optionSlarkAbyssal = Menu.AddOptionBool({"VAIO", "Slark", "Items"}, "Abyssal", false)
VAIO.optionSlarkBkb  = Menu.AddOptionBool({"VAIO", "Slark", "Items"}, "Bkb", false)
VAIO.optionSlarkPounceAim = Menu.AddOptionBool({"VAIO", "Slark"}, "Pounce aim", false)
VAIO.optionSlarkPounce = Menu.AddoptionSlarkCombo({"VAIO", "Slark"}, "Pounce", {"to enemy", "to mouse"}, 0)
VAIO.optionSlarkAutoUlt = Menu.AddOptionBool({"VAIO", "Slark"}, "Auto ultimate", false)
VAIO.optionSlarkUltSlider = Menu.AddOptionSlider({"VAIO", "Slark"}, "HP threshold", 10 ,50, 30)
VAIO.check = true
VAIO.casted = false
VAIO.castedm = false

--Brewmaster
VAIO.optionBrewmaster = Menu.AddOptionBool({"VAIO", "Brewmaster"}, "Brewmaster", false)
VAIO.optionBrewmasterStunKey = Menu.AddKeyOption({"VAIO", "Brewmaster"}, "Stun", Enum.ButtonCode.BUTTON_CODE_NONE)
VAIO.optionBrewmasterEulKey = Menu.AddKeyOption({"VAIO", "Brewmaster"}, "Eul", Enum.ButtonCode.BUTTON_CODE_NONE)
VAIO.optionBrewmasterDispelKey = Menu.AddKeyOption({"VAIO", "Brewmaster"}, "Dispel", Enum.ButtonCode.BUTTON_CODE_NONE)
VAIO.optionBrewmasterInvisibleKey = Menu.AddKeyOption({"VAIO", "Brewmaster"}, "Invisible", Enum.ButtonCode.BUTTON_CODE_NONE)
VAIO.optionBrewmasterBeaker = Menu.AddOptionBool({"VAIO", "Brewmaster"}, "Cast breaker", false)
VAIO.optionBrewmasterInvisible = Menu.AddOptionBool({"VAIO", "Brewmaster"}, "Auto invisible", false)
VAIO.optionBrewmasterClap = Menu.AddOptionBool({"VAIO", "Brewmaster"}, "Auto clap(in ult)", false)
VAIO.optionBrewmasterBeer = Menu.AddOptionBool({"VAIO", "Brewmaster"}, "Auto beer(in ult)", false)
VAIO.optionBrewmasterSave = Menu.AddOptionBool({"VAIO", "Brewmaster"}, "Auto ultimate", false)
VAIO.optionBrewmasterSaveSlider = Menu.AddOptionSlider({"VAIO", "Brewmaster"}, "HP threshold", 10 ,70, 40)

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

	--Juggernaut
	if NPC.GetUnitName(myHero) == "npc_dota_hero_juggernaut" and Menu.IsEnabled(VAIO.optionJuggernaut) then
	
		--Skills
		q = NPC.GetAbility(myHero, "juggernaut_blade_fury")
		w = NPC.GetAbility(myHero, "juggernaut_healing_ward")
		r = NPC.GetAbility(myHero, "juggernaut_omni_slash")
		
		--Combo
		if Menu.IsKeyDown(VAIO.optionJuggernautComboKey) then
			if Menu.IsEnabled(VAIO.optionJuggernautBlink) and blink and Ability.IsCastable(blink, mana) and Ability.IsReady(blink) then
				distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D()
				if distance>1200 then 
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION,enemy, Entity.GetAbsOrigin(enemy), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero)
				else 
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy)) 
					return
				end
			end
			if Menu.IsEnabled(VAIO.optionJuggernautMom) and mom and Ability.IsCastable(mom, mana) and Ability.IsReady(mom) then
				Ability.CastNoTarget(mom) 
				return
			end
			if Menu.IsEnabled(VAIO.optionJuggernautBkb) and bkb and Ability.IsCastable(bkb, mana) and Ability.IsReady(bkb) then
				Ability.CastNoTarget(bkb) 
				return
			end
			if Menu.IsEnabled(VAIO.optionJuggernautAbyssal) and abyssal and Ability.IsCastable(abyssal, mana) and Ability.IsReady(abyssal) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) then
				Ability.CastTarget(abyssal, enemy) 
				return
			end
			if Menu.IsEnabled(VAIO.optionJuggernautManta) and manta and Ability.IsCastable(manta, mana) and Ability.IsReady(manta) then
				Ability.CastNoTarget(manta) 
				return
			end
			if Menu.IsEnabled(VAIO.optionJuggernautNullifier) and nullifier and Ability.IsCastable(nullifier, mana) and Ability.IsReady(nullifier) then
				Ability.CastTarget(nullifier, enemy) 
				return
			end
			if Menu.IsEnabled(VAIO.optionJuggernautSilence) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_SILENCED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED)  then
				if orchid and Ability.IsCastable(orchid, mana) and Ability.IsReady(orchid) then
					Ability.CastTarget(orchid, enemy) 
					return
				end
				if bloodthorn and Ability.IsCastable(bloodthorn, mana) and Ability.IsReady(bloodthorn) then
					Ability.CastTarget(bloodthorn, enemy) 
					return
				end
			end
			Player.AttackTarget(Players.GetLocal(), MyHero, enemy)
			return
		end

		--Ult
		if Menu.IsEnabled(VAIO.optionJuggernautAutoUlt) then
			if r and Ability.IsCastable(r, mana) and Ability.IsReady(r) then
				if (Entity.GetHealth(myHero) <= (Entity.GetMaxHealth(myHero) * (Menu.GetValue(VAIO.optionJuggernautUltSlider) / 100))) then
					enemies = Entity.GetHeroesInRadius(myHero, 500, Enum.TeamType.TEAM_ENEMY)
					if not enemies or #enemies < 1 then return end
					for i, enemy in ipairs(enemies) do
						Ability.CastTarget(r, enemy) 
						return
					end 
				end
			end
		end

		--Totem
		if Menu.IsEnabled(VAIO.optionJuggernautTotemControl) then
			for i = 1, NPCs.Count() do
				npc = NPCs.Get(i)
				if npc and npc ~= myHero and Entity.IsSameTeam(myHero, npc) then
					if (Entity.GetOwner(myHero) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, myHero)) then
						if NPC.GetUnitName(npc) == "npc_dota_VAIO_healing_ward" then
							NPC.MoveTo(npc, mypos, false, false)
							return
						end
					end
				end
			end
		end
	end
	
	--Leshrac
	if NPC.GetUnitName(myHero) == "npc_dota_hero_leshrac" and Menu.IsEnabled(VAIO.optionLeshrac) then
	
		--Skills
		q = NPC.GetAbility(myHero, "leshrac_split_earth")
		w = NPC.GetAbility(myHero, "leshrac_diabolic_edict")
		e = NPC.GetAbility(myHero, "leshrac_lightning_storm")
		r = NPC.GetAbility(myHero, "leshrac_pulse_nova")

		--Combo
		if Menu.IsKeyDown(VAIO.optionLeshracCombo) then
			if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then return end
				if Menu.IsEnabled(VAIO.optionLeshracBkb) and bkb and Ability.IsCastable(bkb, mana-Ability.GetManaCost(q)) and Ability.IsReady(bkb) then
					Ability.CastNoTarget(bkb) 
					return
				end 
				if Menu.IsEnabled(VAIO.optionLeshracComboEul) and cyclone then
					if Ability.IsCastable(cyclone, mana-Ability.GetManaCost(q)) and Ability.IsReady(cyclone) then
						target = enemy
						Ability.CastTarget(cyclone, enemy) 
						VAIO.EulTimer = 1.5 + os.clock()
						return
					end
					if VAIO.EulTimer < os.clock() then
						if q and Ability.IsCastable(q, mana) and Ability.IsReady(q) then
							Ability.CastPosition(q, Entity.GetAbsOrigin(target)) 
							return
						end 
						if Menu.IsEnabled(VAIO.optionLeshracSilence) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_SILENCED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED)  then
						if orchid and Ability.IsCastable(orchid, mana) and Ability.IsReady(orchid) then
							Ability.CastTarget(orchid, target) 
							return
						end
						if bloodthorn and Ability.IsCastable(bloodthorn, mana) and Ability.IsReady(bloodthorn) then
							Ability.CastTarget(bloodthorn, target) 
							return
						end
						end
						if Menu.IsEnabled(VAIO.optionLeshracDiscord) and discord and Ability.IsCastable(discord, mana) and Ability.IsReady(discord) then
							Ability.CastPosition(discord, Entity.GetAbsOrigin(target)) 
							return
						end 
						if Menu.IsEnabled(VAIO.optionLeshracShiva) and shiva and Ability.IsCastable(shiva, mana) and Ability.IsReady(shiva) then
							Ability.CastNoTarget(shiva) 
							return
						end 
						if e and Ability.IsCastable(e, mana) and Ability.IsReady(e) then
							Ability.CastTarget(e, target) 
							return
						end 
						if w and Ability.IsCastable(w, mana) and Ability.IsReady(w) then
							Ability.CastNoTarget(w) 
							return
						end 
						if r and Ability.IsCastable(r, mana) and Ability.IsReady(r) and not NPC.HasModifier(myHero, "modifier_VAIO_pulse_nova") then
							Ability.Toggle(r) 
							return
						end 
						distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D()
						if distance<400 then 
							Player.AttackTarget(Players.GetLocal(), myHero, enemy, true) 
							return
						end
					end
				else
					if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) then
						if Menu.IsEnabled(VAIO.optionLeshracHex) and hex and Ability.IsCastable(hex, mana-Ability.GetManaCost(q)) and Ability.IsReady(hex) then
							Ability.CastTarget(hex, enemy) 
							return
						end 
							if Menu.IsEnabled(VAIO.optionLeshracAtos) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) and atos and Ability.IsCastable(atos, mana-Ability.GetManaCost(q)) and Ability.IsReady(atos) then
							Ability.CastTarget(atos, enemy) 
							return
						end 
					end
					if Menu.IsEnabled(VAIO.optionLeshracSilence) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_SILENCED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED)  then
						if orchid and Ability.IsCastable(orchid, mana-Ability.GetManaCost(q)) and Ability.IsReady(orchid) then
							Ability.CastTarget(orchid, enemy) 
							return
						end
						if bloodthorn and Ability.IsCastable(bloodthorn, mana-Ability.GetManaCost(q)) and Ability.IsReady(bloodthorn) then
							Ability.CastTarget(bloodthorn, enemy) 
							return
						end
					end
					if Menu.IsEnabled(VAIO.optionLeshracDiscord) and discord and Ability.IsCastable(discord, mana-Ability.GetManaCost(q)) and Ability.IsReady(discord) then
						Ability.CastPosition(discord, VAIO.InFront(150)) 
						return
					end 
					if Menu.IsEnabled(VAIO.optionLeshracShiva) and shiva and Ability.IsCastable(shiva, mana-Ability.GetManaCost(q)) and Ability.IsReady(shiva) then
						Ability.CastNoTarget(shiva) 
						return
					end 
					if e and Ability.IsCastable(e, mana-Ability.GetManaCost(q)) and Ability.IsReady(e) then
						Ability.CastTarget(e, enemy) 
						return
					end 
					if Menu.IsEnabled(VAIO.optionLeshracUrn) then
						if urn and Ability.IsCastable(urn, mana-Ability.GetManaCost(q)) and Ability.IsReady(urn) then
							Ability.CastTarget(urn, enemy) 
							return
						end
						if vessel and Ability.IsCastable(vessel, mana-Ability.GetManaCost(q)) and Ability.IsReady(vessel) then
							Ability.CastTarget(vessel, enemy) 
							return
						end
					end
					if q and Ability.IsCastable(q, mana) and Ability.IsReady(q) then
							if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) and NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) or not NPC.IsRunning(enemy) or NPC.HasModifier(enemy, "modifier_VAIO_lightning_storm_slow") then
							Ability.CastPosition(q, VAIO.InFront(150)) 
							return
						else
							Ability.CastPosition(q, VAIO.InFront(900)) 
							return
						end 
					end
					if w and Ability.IsCastable(w, mana) and Ability.IsReady(w) then
						Ability.CastNoTarget(w) 
						return
					end 
					if r and Ability.IsCastable(r, mana) and Ability.IsReady(r) and not NPC.HasModifier(myHero, "modifier_VAIO_pulse_nova") then
						Ability.Toggle(r) 
						return
					end 
					distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D()
					if distance<400 then 
						Player.AttackTarget(Players.GetLocal(), myHero, enemy, true)
						return
					end
			end
		end

		--Denying
		if Menu.IsEnabled(VAIO.optionLeshracBSDenying) then
			if bloodstone and Ability.IsCastable(bloodstone, mana) and Ability.IsReady(bloodstone) then
				if (Entity.GetHealth(myHero) <= (Entity.GetMaxHealth(myHero) * (Menu.GetValue(VAIO.optionLeshracHPDenying) / 100))) then
					enemies = Entity.GetHeroesInRadius(myHero, 1000, Enum.TeamType.TEAM_ENEMY)
					if not enemies or #enemies < 1 then return end
					Ability.CastPosition(bloodstone,Entity.GetAbsOrigin(myHero)) 
				end
			end
		end
	end

	--Terrorblade
	if NPC.GetUnitName(myHero) == "npc_dota_hero_terrorblade" and Menu.IsEnabled(VAIO.optionTerrorblade) then
		
		--Skills
		q = NPC.GetAbility(myHero, "terrorblade_reflection")
		w = NPC.GetAbility(myHero, "terrorblade_conjure_image")
		e = NPC.GetAbility(myHero, "terrorblade_metamorphosis")
		r = NPC.GetAbility(myHero, "terrorblade_sunder")

		--Combo
		if Menu.IsKeyDown(VAIO.optionTerrorbladeComboKey) then
			if Menu.IsEnabled(VAIO.optionTerrorbladeBkb) and bkb and Ability.IsCastable(bkb, mana) and Ability.IsReady(bkb) then
				Ability.CastNoTarget(bkb) 
				return
			end
			if Menu.IsEnabled(VAIO.optionTerrorbladeSilence) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_SILENCED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED)  then
				if orchid and Ability.IsCastable(orchid, mana) and Ability.IsReady(orchid) then
					Ability.CastTarget(orchid, enemy) 
					return
				end
				if bloodthorn and Ability.IsCastable(bloodthorn, mana) and Ability.IsReady(bloodthorn) then
					Ability.CastTarget(bloodthorn, enemy) 
					return
				end
			end
			if Menu.IsEnabled(VAIO.optionTerrorbladeNullifier) and nullifier and Ability.IsCastable(nullifier, mana) and Ability.IsReady(nullifier) then
				Ability.CastTarget(nullifier, enemy) 
				return
			end
			if Menu.IsEnabled(VAIO.optionTerrorbladeDiffusal) and diffusal and Ability.IsCastable(diffusal, mana) and Ability.IsReady(diffusal) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
				Ability.CastTarget(diffusal, enemy) 
				return
			end
			if e and Ability.IsCastable(e, mana) and Ability.IsReady(e) then
				Ability.CastNoTarget(e) 
				return
			end 
			if Menu.IsEnabled(VAIO.optionTerrorbladeManta) and manta and Ability.IsCastable(manta, mana) and Ability.IsReady(manta) then
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
		if Menu.IsEnabled(VAIO.optionTerrorbladeAutoUlt) then
			if r and Ability.IsCastable(r, mana) and Ability.IsReady(r) then
				if (Entity.GetHealth(myHero) <= (Entity.GetMaxHealth(myHero) * (Menu.GetValue(VAIO.optionTerrorbladeUltSlider) / 100))) then
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

	--Slark
	if NPC.GetUnitName(myHero) == "npc_dota_hero_slark" and Menu.IsEnabled(VAIO.optionSlark) then
	
		--Skills
		local q = NPC.GetAbility(myHero, "slark_dark_pact")
		local w = NPC.GetAbility(myHero, "slark_pounce")
		local r = NPC.GetAbility(myHero, "slark_shadow_dance")

		--Combo
		if Menu.IsKeyDown(VAIO.optionSlarkComboKey) then
			distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D()
			if distance>650 then 
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION,enemy, Entity.GetAbsOrigin(enemy), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero)
			else
				if NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then 
					Player.AttackTarget(Players.GetLocal(), myHero, enemy, false)
				else
					Player.AttackTarget(Players.GetLocal(), myHero, enemy, false)
					if q and Ability.IsCastable(q, mana) and Ability.IsReady(q) then
						Ability.CastNoTarget(q) 
						return
					end 
					if Menu.IsEnabled(VAIO.optionSlarkNullifier) and nullifier and Ability.IsCastable(nullifier, mana) and Ability.IsReady(nullifier) then
						Ability.CastTarget(nullifier, enemy) 
						return
					end
					if Menu.IsEnabled(VAIO.optionSlarkDiffusal) and diffusal and Ability.IsCastable(diffusal, mana) and Ability.IsReady(diffusal) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						Ability.CastTarget(diffusal, enemy) 
						return
					end
					if Menu.IsEnabled(VAIO.optionSlarkBkb) and bkb and Ability.IsCastable(bkb, mana) and Ability.IsReady(bkb) then
						Ability.CastNoTarget(bkb) 
						return
					end
					if Menu.IsEnabled(VAIO.optionSlarkSilence) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_SILENCED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED)  then
						if orchid and Ability.IsCastable(orchid, mana) and Ability.IsReady(orchid) then
							Ability.CastTarget(orchid, enemy) 
							return
						end
						if bloodthorn and Ability.IsCastable(bloodthorn, mana) and Ability.IsReady(bloodthorn) then
							Ability.CastTarget(bloodthorn, enemy) 
							return
						end
					end
					if distance<140 and Menu.IsEnabled(VAIO.optionSlarkAbyssal) and abyssal and Ability.IsCastable(abyssal, mana) and Ability.IsReady(abyssal) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) then
						Ability.CastTarget(abyssal, enemy) 
						return
					end
					if w and Ability.IsCastable(w, mana) and Ability.IsReady(w) then
						castpos = (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(distance - 1))
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION,enemy, castpos, nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero)
						puncepos = Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(distance)
						if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) or not NPC.IsRunning(enemy) then
							predpos = VAIO.InFront(50)
						else
							predpos = VAIO.InFront(300)
						end
						jump = (puncepos - predpos):Length2D()
						if jump <= 100 then
							Ability.CastNoTarget(w) 
							return 
						end
					end
				end
			end
		end

		--Pounce
		if VAIO.casted == true then
			distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D()
			castpos = (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(distance - 1))
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION,enemy, castpos, nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero)
			puncepos = Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(distance)
			if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) or not NPC.IsRunning(enemy) then
				predpos = VAIO.InFront(50)
			else
				predpos = VAIO.InFront(300)
			end
			jump = (puncepos - predpos):Length2D()
			if jump <= 100 then
				Ability.CastNoTarget(w) 
				VAIO.casted = false
				return 
			end
		end

		if VAIO.castedm == true then
			distance = (Input.GetWorldCursorPos() - Entity.GetAbsOrigin(myHero)):Length2D()
			if w and Ability.IsCastable(w, mana) and Ability.IsReady(w) then
				if VAIO.check == true then
					VAIO.check = false
					VAIO.ComboTimer = os.clock() + 0.3
				end
				if VAIO.check == false then
					castpos = (Input.GetWorldCursorPos() + (Entity.GetAbsOrigin(myHero) - Input.GetWorldCursorPos()):Normalized():Scaled(distance - 1))
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION,enemy, castpos, nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero)
					if VAIO.ComboTimer < os.clock() then
						Ability.CastNoTarget(w) 
						VAIO.check = true
						VAIO.castedm = false
						return
					end 
				end
			end
		end

		--Ult
		if Menu.IsEnabled(VAIO.optionSlarkAutoUlt) then
			if r and Ability.IsCastable(r, mana) and Ability.IsReady(r) then
				if (Entity.GetHealth(myHero) <= (Entity.GetMaxHealth(myHero) * (Menu.GetValue(VAIO.optionSlarkUltSlider) / 100))) then
					if NPC.HasModifier(myHero, "modifier_VAIO_shadow_dance_passive_regen") then return end
					Ability.CastNoTarget(r) 
					return
				end
			end
		end
	end
	
	--Brewmaster
	if NPC.GetUnitName(myHero) == "npc_dota_hero_brewmaster" and Menu.IsEnabled(VAIO.optionBrewmaster) then
	
		--Skills
		local r = NPC.GetAbility(myHero, "brewmaster_primal_split")

		--Ult
		if Menu.IsEnabled(VAIO.optionBrewmasterSave) then
			if r and Ability.IsCastable(r, mana) and Ability.IsReady(r) then
				if (Entity.GetHealth(myHero) <= (Entity.GetMaxHealth(myHero) * (Menu.GetValue(VAIO.optionBrewmasterSaveSlider) / 100))) then
					enemies = Entity.GetHeroesInRadius(myHero, 1000, Enum.TeamType.TEAM_ENEMY)
					if not enemies or #enemies < 1 then return end
					Ability.CastNoTarget(r) 
					return
				end
			end
		end

		--Pandas
		if not r or Ability.IsReady(r) then return end
		for i = 1, NPCs.Count() do
			local npc = NPCs.Get(i)
			if npc and npc ~= myHero and Entity.IsSameTeam(myHero, npc) then
				if (Entity.GetOwner(myHero) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, myHero)) then
					if NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_1" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_2" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_storm_3" then
						spnd=npc
					elseif NPC.GetUnitName(npc) == "npc_dota_brewmaster_earth_1" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_earth_2" or NPC.GetUnitName(npc) == "npc_dota_brewmaster_earth_3" then
						epnd=npc
					end
				end
			end
		end


		if Entity.IsAlive(epnd) then
			if Menu.IsEnabled(VAIO.optionBrewmasterClap) then
				local clap = NPC.GetAbility(epnd, "brewmaster_thunder_clap")
				emana = NPC.GetMana(epnd)
				if clap and Ability.IsCastable(clap, emana) and Ability.IsReady(clap) then
					enemies = Entity.GetHeroesInRadius(epnd, 400, Enum.TeamType.TEAM_ENEMY)
					if not enemies or #enemies < 1 then return end
					Ability.CastNoTarget(clap) 
					return
				end
			end
			if Menu.IsKeyDown(VAIO.optionBrewmasterStunKey) then
				local stun = NPC.GetAbility(epnd, "brewmaster_earth_hurl_boulder")
				emana = NPC.GetMana(epnd)
				if stun and Ability.IsCastable(stun, emana) and Ability.IsReady(stun) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
					Ability.CastTarget(stun, enemy) 
					return
				end
			end
		end

		if Entity.IsAlive(spnd) then
			if Menu.IsKeyDown(VAIO.optionBrewmasterEulKey) then
				local eul = NPC.GetAbility(spnd, "brewmaster_storm_cyclone")
				smana = NPC.GetMana(spnd)
				if eul and Ability.IsCastable(eul, smana) and Ability.IsReady(eul) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
					Ability.CastTarget(eul, enemy) 
					return
				end
			end
			if Menu.IsKeyDown(VAIO.optionBrewmasterDispelKey) then
				local dispel = NPC.GetAbility(spnd, "brewmaster_storm_dispel_magic")
				smana = NPC.GetMana(spnd)
				if dispel and Ability.IsCastable(dispel, smana) and Ability.IsReady(dispel) then
					Ability.CastPosition(dispel, Entity.GetAbsOrigin(enemy)) 
					return
				end
			end
			if Menu.IsKeyDown(VAIO.optionBrewmasterInvisibleKey) then
				local stealth = NPC.GetAbility(spnd, "brewmaster_storm_wind_walk")
				smana = NPC.GetMana(spnd)
				if stealth and Ability.IsCastable(stealth, smana) and Ability.IsReady(stealth) then
					Ability.CastNoTarget(stealth) 
					return
				end
			end
			if Menu.IsEnabled(VAIO.optionBrewmasterBeer) then
				if NPC.HasState(spnd, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then return end
				local beer = NPC.GetAbility(spnd, "brewmaster_drunken_haze")
				smana = NPC.GetMana(spnd)
				if beer and Ability.IsCastable(beer, smana) and Ability.IsReady(beer) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
					Ability.CastTarget(beer, enemy) 
					return
				end
			end
			if Menu.IsEnabled(VAIO.optionBrewmasterInvisible) then
				local stealth = NPC.GetAbility(spnd, "brewmaster_storm_wind_walk")
				smana = NPC.GetMana(spnd)
				if stealth and Ability.IsCastable(stealth, smana) and Ability.IsReady(stealth) then
					Ability.CastNoTarget(stealth) 
					return
				end
			end
			if Menu.IsEnabled(VAIO.optionBrewmasterBeaker) then
				local eul = NPC.GetAbility(spnd, "brewmaster_storm_cyclone")
				smana = NPC.GetMana(spnd)
				if eul and Ability.IsCastable(eul, smana) and Ability.IsReady(eul) then
					CastBreakerRange = 1000
					enemies = Entity.GetHeroesInRadius(spnd, CastBreakerRange, Enum.TeamType.TEAM_ENEMY)
					for i, enemy in ipairs(enemies) do
						if NPC.IsChannellingAbility(enemy) or NPC.HasModifier(enemy, "modifier_teleporting") and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
							Ability.CastTarget(eul, enemy) 
							return
						end
					end
				end
			end
		end 
	end
end

function VAIO.OnPrepareUnitOrders(orders)
	if not Menu.IsEnabled(VAIO.optionEnable) then return end
	if not orders or not orders.ability then return true end
	if not Entity.IsAbility(orders.ability) then return true end
	if orders.order == Enum.UnitOrder.DOTA_UNIT_ORDER_TRAIN_ABILITY then return true end
	
	if Ability.GetName(orders.ability) == "slark_pounce" then
		if Menu.IsEnabled(VAIO.optionSlarkPounceAim) then
			if Menu.GetValue(VAIO.optionSlarkPounce) < 1 then
				distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D()
				if distance>650 then 
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION,enemy, Entity.GetAbsOrigin(enemy), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero)
				else
					VAIO.casted = true
				end
			else
				VAIO.castedm = true
				end
				return false
			else
				return true
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
