local Phoenix = {}

Phoenix.optionEnable = Menu.AddOptionBool({ "Hero Specific", "Phoenix" }, "Phoenix", false)
Phoenix.FireSpiritKey = Menu.AddKeyOption({ "Hero Specific", "Phoenix" }, "Fire spirit key", Enum.ButtonCode.BUTTON_CODE_NONE)

function Phoenix.OnUpdate()
  if not Menu.IsEnabled( Phoenix.optionEnable ) then return end

  me = Heroes.GetLocal()
  mana = NPC.GetMana(me)
  
  if not me or NPC.GetUnitName(me) ~= "npc_dota_hero_phoenix" then return end

    if Menu.IsKeyDownOnce(Phoenix.FireSpiritKey) then Phoenix.FireSpirit(me, enemy) end
	
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
	  
	  Ability.CastNoTarget(fs)
      
		if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) then
			Ability.CastPosition(lfs, Phoenix.InFront(200))
			elseif NPC.IsRunning(enemy) then
			Ability.CastPosition(lfs, Phoenix.InFront(650))
			else Ability.CastPosition(lfs, Phoenix.InFront(200))
		end
end


return Phoenix