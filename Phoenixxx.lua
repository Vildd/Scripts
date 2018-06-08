local Phoenix = {}

Phoenix.optionEnable = Menu.AddOptionBool({ "Hero Specific", "Phoenix" }, "Phoenix", false)
Phoenix.FireSpiritKey = Menu.AddKeyOption({ "Hero Specific", "Phoenix" }, "Fire spirit key", Enum.ButtonCode.BUTTON_CODE_NONE)

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

function Phoenix.FireSpirit(me, enemy)

id = NPC.GetAbility(me, "phoenix_icarus_dive")
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
