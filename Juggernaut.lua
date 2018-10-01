local Juggernaut = {}

Juggernaut.option = Menu.AddOptionBool({"VAIO", "Juggernaut"}, "Juggernaut", false)
Juggernaut.optionTarget = Menu.AddOptionSlider({"VAIO", "Juggernaut"}, "Target Radius", 200, 1000, 500)
Juggernaut.optionComboKey = Menu.AddKeyOption({"VAIO", "Juggernaut"}, "Combo key", Enum.ButtonCode.BUTTON_CODE_NONE)
Juggernaut.optionBlink  = Menu.AddOptionBool({"VAIO", "Juggernaut", "Items"}, "Blink", false)
Juggernaut.optionAbyssal  = Menu.AddOptionBool({"VAIO", "Juggernaut", "Items"}, "Abyssal", false)
Juggernaut.optionManta  = Menu.AddOptionBool({"VAIO", "Juggernaut", "Items"}, "Manta", false)
Juggernaut.optionNullifier  = Menu.AddOptionBool({"VAIO", "Juggernaut", "Items"}, "Nullifier", false)
Juggernaut.optionSilence  = Menu.AddOptionBool({"VAIO", "Juggernaut", "Items"}, "Silence", false)
Juggernaut.optionMom  = Menu.AddOptionBool({"VAIO", "Juggernaut", "Items"}, "Mom", false)
Juggernaut.optionBkb  = Menu.AddOptionBool({"VAIO", "Juggernaut", "Items"}, "Bkb", false)
Juggernaut.optionTotemControl = Menu.AddOptionBool({"VAIO", "Juggernaut"}, "Totem control", false)
Juggernaut.optionAutoUlt = Menu.AddOptionBool({"VAIO", "Juggernaut"}, "Auto ultimate", false)
Juggernaut.optionUltSlider = Menu.AddOptionSlider({"VAIO", "Juggernaut"}, "HP threshold", 10 ,50, 30)

function Juggernaut.OnUpdate()
  if not Menu.IsEnabled(Juggernaut.option) then return end
  myHero = Heroes.GetLocal()
  if not myHero or NPC.GetUnitName(myHero) ~= "npc_dota_hero_juggernaut" then return end
  mana = NPC.GetMana(myHero)
  enemy = Juggernaut.Target(myHero)
  mypos = Entity.GetAbsOrigin(myHero)
  
  --Skills
  q = NPC.GetAbility(myHero, "juggernaut_blade_fury")
  w = NPC.GetAbility(myHero, "juggernaut_healing_ward")
  r = NPC.GetAbility(myHero, "juggernaut_omni_slash")
  
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
  
  if Menu.IsKeyDown(Juggernaut.optionComboKey) then
    if Menu.IsEnabled(Juggernaut.optionBlink) and blink and Ability.IsCastable(blink, mana) and Ability.IsReady(blink) then
      distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D()
      if distance>1200 then 
        Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION,enemy, Entity.GetAbsOrigin(enemy), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero)
      else 
        Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy)) 
        return
      end
    end
    if Menu.IsEnabled(Juggernaut.optionMom) and mom and Ability.IsCastable(mom, mana) and Ability.IsReady(mom) then
      Ability.CastNoTarget(mom) 
      return
    end
    if Menu.IsEnabled(Juggernaut.optionBkb) and bkb and Ability.IsCastable(bkb, mana) and Ability.IsReady(bkb) then
      Ability.CastNoTarget(bkb) 
      return
    end
    if Menu.IsEnabled(Juggernaut.optionAbyssal) and abyssal and Ability.IsCastable(abyssal, mana) and Ability.IsReady(abyssal) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) then
      Ability.CastTarget(abyssal, enemy) 
      return
    end
    if Menu.IsEnabled(Juggernaut.optionManta) and manta and Ability.IsCastable(manta, mana) and Ability.IsReady(manta) then
      Ability.CastNoTarget(manta) 
      return
    end
    if Menu.IsEnabled(Juggernaut.optionNullifier) and nullifier and Ability.IsCastable(nullifier, mana) and Ability.IsReady(nullifier) then
      Ability.CastTarget(nullifier, enemy) 
      return
    end
    if Menu.IsEnabled(Juggernaut.optionSilence) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_SILENCED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED)  then
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
  
  if Menu.IsEnabled(Juggernaut.optionAutoUlt) then
    if r and Ability.IsCastable(r, mana) and Ability.IsReady(r) then
      if (Entity.GetHealth(myHero) <= (Entity.GetMaxHealth(myHero) * (Menu.GetValue(Juggernaut.optionUltSlider) / 100))) then
        enemies = Entity.GetHeroesInRadius(myHero, 500, Enum.TeamType.TEAM_ENEMY)
        if not enemies or #enemies < 1 then return end
        for i, enemy in ipairs(enemies) do
          Ability.CastTarget(r, enemy) 
          return
        end 
      end
    end
  end
  
  if Menu.IsEnabled(Juggernaut.optionTotemControl) then
    for i = 1, NPCs.Count() do
      local npc = NPCs.Get(i)
      if npc and npc ~= myHero and Entity.IsSameTeam(myHero, npc) then
        if (Entity.GetOwner(myHero) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, myHero)) then
          if NPC.GetUnitName(npc) == "npc_dota_juggernaut_healing_ward" then
            NPC.MoveTo(npc, mypos, false, false)
            return
          end
        end
      end
    end
  end
end

function Juggernaut.Target(myHero)
  if not myHero then return end
  enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
  if not enemy then return end
  local targetingRange = Menu.GetValue(Juggernaut.optionTarget)
  local mousePos = Input.GetWorldCursorPos()
  local enemyDist = (Entity.GetAbsOrigin(enemy) - mousePos):Length2D()
  if enemyDist < targetingRange then 
    return enemy
  else
    return mousePos
  end
end

return Juggernaut
