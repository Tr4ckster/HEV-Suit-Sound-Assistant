util.AddNetworkString("SoundAssistantDamage")
util.AddNetworkString("SoundAssistantPoison")
util.AddNetworkString("SoundAssistantBullet")
util.AddNetworkString("SoundAssistantFall")
util.AddNetworkString("SoundAssistantAmmoPick")
util.AddNetworkString("SoundAssistantToxic")
util.AddNetworkString("SoundAssistantRadiation")
util.AddNetworkString("SoundAssistantPlayerRespawn")
--Starting the Players Damage HEV
hook.Add("EntityTakeDamage", "SoundAssistantDamage", function(ply , dmginfo)
	if ply:IsPlayer() then
		local dmgtype = dmginfo:GetDamageType()
		local att = dmginfo:GetAttacker():GetClass()
		if dmgtype == 131072 then
			net.Start("SoundAssistantPoison")
			net.Send(ply)
		elseif dmgtype == 2 or dmgtype == 536870912 or dmgtype == 1073741824 then
			net.Start("SoundAssistantBullet")
			net.Send(ply)
		elseif dmgtype == 32 then
			net.Start("SoundAssistantFall")
			net.Send(ply)
		elseif dmgtype == 1048576 or dmgtype == 262144 then
			net.Start("SoundAssistantToxic")
			net.Send(ply)
		elseif dmgtype == 262144 then
			net.Start("SoundAssistantRadiation")
			net.Send(ply)
		elseif dmgtype == 4 and (att == "npc_headcrab_black") then
			net.Start("SoundAssistantPoison")
			net.Send(ply)
		else
			net.Start("SoundAssistantDamage")
			net.Send(ply)
		end
	end
end)

--Resetting Players "Critical"
hook.Add("PlayerSpawn", "SoundAssistantCReset", function(ply)
	net.Start("SoundAssistantPlayerRespawn")
	net.Send(ply)
end)