local Phoenix = {}

Phoenix.optionEnable = Menu.AddOptionBool({ "Hero Specific", "Phoenix" }, "Phoenix", false)
Phoenix.FireSpiritKey = Menu.AddKeyOption({ "Hero Specific", "Phoenix" }, "Fire spirit key", Enum.ButtonCode.BUTTON_CODE_NONE)
Phoenix.ComboKey = Menu.AddKeyOption({ "Hero Specific", "Phoenix" }, "Combo key", Enum.ButtonCode.BUTTON_CODE_NONE)

function Phoenix.OnUpdate()
  if not Menu.IsEnabled( Phoenix.optionEnable ) then return 
  end

  me = Heroes.GetLocal()
  mana = NPC.GetMana(me)
  
  if not me or NPC.GetUnitName(me) ~= "npc_dota_hero_phoenix" then return 
  end

    if Menu.IsKeyDownOnce(Phoenix.FireSpiritKey) then 
	Phoenix.FireSpirit(me, enemy) 
	end
	
	if Menu.IsKeyDown(Phoenix.ComboKey) then 
	Phoenix.Combo(me, enemy) 
	end
	
	enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(me), Enum.TeamType.TEAM_ENEMY)
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

function Phoenix.Combo(me, enemy)
fs = NPC.GetAbility(me, "phoenix_fire_spirits")
lfs = NPC.GetAbility(me, "phoenix_launch_fire_spirit")
sr = NPC.GetAbility(me, "phoenix_sun_ray")
sn = NPC.GetAbility(me, "phoenix_supernova")
veil = NPC.GetItem(me, "item_veil_of_discord", true)
shiva = NPC.GetItem(me, "item_shivas_guard", true)
scptr = NPC.GetItem(me, "item_ultimate_scepter", true)
aBuff = NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed")

if Ability.IsCastable(sn, mana) and Ability.IsReady(sn) then
      if fs and Ability.IsReady(fs) and Ability.IsCastable(fs, mana-Ability.GetManaCost(sn)) then
	  Ability.CastNoTarget(fs)
	  end
	  if veil and Ability.IsReady(veil) and Ability.IsCastable(veil, mana-Ability.GetManaCost(sn))  then
	  Ability.CastPosition(veil, Entity.GetAbsOrigin(enemy))
	  end
	  if shiva and Ability.IsReady(shiva) and Ability.IsCastable(shiva, mana-Ability.GetManaCost(sn)) then
	  Ability.CastNoTarget(shiva)
	  end
	  else
	  if fs and Ability.IsReady(fs) and Ability.IsCastable(fs, mana) then
	  Ability.CastNoTarget(fs)
	  end
	  if veil and Ability.IsReady(veil) and Ability.IsCastable(veil, mana) then
	  Ability.CastPosition(veil, Entity.GetAbsOrigin(enemy))
	  end 
	  if shiva and Ability.IsReady(shiva) and Ability.IsCastable(shiva, mana) then
	  Ability.CastNoTarget(shiva)
	  end
	  end
  
	local range = 1400
    local enemyHeroes = Entity.GetHeroesInRadius(me, range, Enum.TeamType.TEAM_ENEMY)
    for i, enemy in ipairs(enemyHeroes) do
          if Ability.IsCastable(lfs, 0) and Ability.IsReady(lfs) then 
	  if NPC.HasModifier(enemy, "modifier_phoenix_fire_spirit_burn") then return 
	  else
		if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) or not NPC.IsRunning(enemy) then
			Ability.CastPosition(lfs, Entity.GetAbsOrigin(enemy))
			else
			Ability.CastPosition(lfs, Entity.GetAbsOrigin(enemy))
		end
		end
		end
end
if not NPC.HasModifier(me, "modifier_phoenix_fire_spirit") then
	if Ability.IsCastable(sn, mana) and Ability.IsReady(sn) then
	if scptr or aBuff then 
	Ability.CastTarget(sn, me)
	else
	Ability.CastNoTarget(sn)
	end
	end
    end
	end

function Phoenix.FireSpirit(me, enemy)
fs = NPC.GetAbility(me, "phoenix_fire_spirits")
lfs = NPC.GetAbility(me, "phoenix_launch_fire_spirit")
sn = NPC.GetAbility(me, "phoenix_supernova")

if Ability.IsCastable(sn, mana) and Ability.IsReady(sn) then
if Ability.IsCastable(fs, mana-Ability.GetManaCost(sn)) and Ability.IsReady(fs) then
	  Ability.CastNoTarget(fs)
	  end
else
if Ability.IsCastable(fs, mana) and Ability.IsReady(fs) then
	  Ability.CastNoTarget(fs)
	  end
	  end
	
      if Ability.IsCastable(lfs, 0) and Ability.IsReady(lfs) then 
	  if NPC.HasModifier(enemy, "modifier_phoenix_fire_spirit_burn") then return 
	  else
		if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) or not NPC.IsRunning(enemy) then
			Ability.CastPosition(lfs, Phoenix.InFront(200))
			else
			Ability.CastPosition(lfs, Phoenix.InFront(650))
		end
		end
		end
end

return Phoenix
