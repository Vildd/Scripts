local Brewmaster = {}

Brewmaster.option = Menu.AddOptionBool({"VAIO", "Brewmaster"}, "Brewmaster", false)
Brewmaster.optionTarget = Menu.AddOptionSlider({"VAIO", "Brewmaster"}, "Target Radius", 200, 1000, 500)
Brewmaster.optionStunKey = Menu.AddKeyOption({"VAIO", "Brewmaster"}, "Stun", Enum.ButtonCode.BUTTON_CODE_NONE)
Brewmaster.optionEulKey = Menu.AddKeyOption({"VAIO", "Brewmaster"}, "Eul", Enum.ButtonCode.BUTTON_CODE_NONE)
Brewmaster.optionDispelKey = Menu.AddKeyOption({"VAIO", "Brewmaster"}, "Dispel", Enum.ButtonCode.BUTTON_CODE_NONE)
Brewmaster.optionInvisibleKey = Menu.AddKeyOption({"VAIO", "Brewmaster"}, "Invisible", Enum.ButtonCode.BUTTON_CODE_NONE)
Brewmaster.optionBeaker = Menu.AddOptionBool({"VAIO", "Brewmaster"}, "Cast breaker", false)
Brewmaster.optionInvisible = Menu.AddOptionBool({"VAIO", "Brewmaster"}, "Auto invisible", false)
Brewmaster.optionClap = Menu.AddOptionBool({"VAIO", "Brewmaster"}, "Auto clap(in ult)", false)a
Brewmaster.optionBeer = Menu.AddOptionBool({"VAIO", "Brewmaster"}, "Auto beer(in ult)", false)
Brewmaster.optionSave = Menu.AddOptionBool({"VAIO", "Brewmaster"}, "Auto ultimate", false)
Brewmaster.optionSaveSlider = Menu.AddOptionSlider({"VAIO", "Brewmaster"}, "HP threshold", 10 ,70, 40)

function Brewmaster.OnUpdate()
  if not Menu.IsEnabled(Brewmaster.option) then return end
  myHero = Heroes.GetLocal()
  if not myHero or NPC.GetUnitName(myHero) ~= "npc_dota_hero_brewmaster" then return end
  mana = NPC.GetMana(myHero)
  enemy = Brewmaster.Target(myHero)
  mypos = Entity.GetAbsOrigin(myHero)
  
  --Skills
  local r = NPC.GetAbility(myHero, "brewmaster_primal_split")
  
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
  
  if Menu.IsEnabled(Brewmaster.optionSave) then
    if r and Ability.IsCastable(r, mana) and Ability.IsReady(r) then
      if (Entity.GetHealth(myHero) <= (Entity.GetMaxHealth(myHero) * (Menu.GetValue(Brewmaster.optionSaveSlider) / 100))) then
        enemies = Entity.GetHeroesInRadius(myHero, 1000, Enum.TeamType.TEAM_ENEMY)
        if not enemies or #enemies < 1 then return end
        Ability.CastNoTarget(r) 
      end
    end
  end
  
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
    if Menu.IsEnabled(Brewmaster.optionClap) then
      local clap = NPC.GetAbility(epnd, "brewmaster_thunder_clap")
      emana = NPC.GetMana(epnd)
      if clap and Ability.IsCastable(clap, emana) and Ability.IsReady(clap) then
        enemies = Entity.GetHeroesInRadius(epnd, 400, Enum.TeamType.TEAM_ENEMY)
        if not enemies or #enemies < 1 then return end
        Ability.CastNoTarget(clap) 
        return
      end
    end
    if Menu.IsKeyDown(Brewmaster.optionStunKey) then
      local stun = NPC.GetAbility(epnd, "brewmaster_earth_hurl_boulder")
      emana = NPC.GetMana(epnd)
      if stun and Ability.IsCastable(stun, emana) and Ability.IsReady(stun) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
        Ability.CastTarget(stun, enemy) 
        return
      end
    end
  end
  
  if Entity.IsAlive(spnd) then
    if Menu.IsKeyDown(Brewmaster.optionEulKey) then
      local eul = NPC.GetAbility(spnd, "brewmaster_storm_cyclone")
      smana = NPC.GetMana(spnd)
      if eul and Ability.IsCastable(eul, smana) and Ability.IsReady(eul) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
        Ability.CastTarget(eul, enemy) 
        return
      end
    end
    if Menu.IsKeyDown(Brewmaster.optionDispelKey) then
      local dispel = NPC.GetAbility(spnd, "brewmaster_storm_dispel_magic")
      smana = NPC.GetMana(spnd)
      if dispel and Ability.IsCastable(dispel, smana) and Ability.IsReady(dispel) then
        Ability.CastPosition(dispel, Entity.GetAbsOrigin(enemy)) 
        return
      end
    end
    if Menu.IsKeyDown(Brewmaster.optionInvisibleKey) then
      local stealth = NPC.GetAbility(spnd, "brewmaster_storm_wind_walk")
      smana = NPC.GetMana(spnd)
      if stealth and Ability.IsCastable(stealth, smana) and Ability.IsReady(stealth) then
        Ability.CastNoTarget(stealth) 
        return
      end
    end
    if Menu.IsEnabled(Brewmaster.optionBeer) then
      if NPC.HasState(spnd, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then return end
      local beer = NPC.GetAbility(spnd, "brewmaster_drunken_haze")
      smana = NPC.GetMana(spnd)
      if beer and Ability.IsCastable(beer, smana) and Ability.IsReady(beer) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
        Ability.CastTarget(beer, enemy) 
        return
      end
    end
    if Menu.IsEnabled(Brewmaster.optionInvisible) then
      local stealth = NPC.GetAbility(spnd, "brewmaster_storm_wind_walk")
      smana = NPC.GetMana(spnd)
      if stealth and Ability.IsCastable(stealth, smana) and Ability.IsReady(stealth) then
        Ability.CastNoTarget(stealth) 
        return
      end
    end
    if Menu.IsEnabled(Brewmaster.optionBeaker) then
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

function Brewmaster.Target(myHero)
  if not myHero then return end
  enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
  if not enemy then return end
  local targetingRange = Menu.GetValue(Brewmaster.optionTarget)
  local mousePos = Input.GetWorldCursorPos()
  local enemyDist = (Entity.GetAbsOrigin(enemy) - mousePos):Length2D()
  if enemyDist < targetingRange then 
    return enemy
  else
    return mousePos
  end
end

return Brewmaster
