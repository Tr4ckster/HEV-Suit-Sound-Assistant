local shouldoccur = true
hook.Add("HUDPaint", "SoundAssistantAmmoEmpty", function()
    local ply = LocalPlayer()
    if (ply:GetActiveWeapon():IsValid()) then
        local Clip1Ammo     = ply:GetActiveWeapon():Clip1()
        local Clip2Ammo     = ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())
        if Clip1Ammo == 0 and Clip2Ammo == 0 and shouldoccur then
            SAPlaySound("ammo_depleted.wav")
            shouldoccur = false
        end
    end
end)

hook.Add("HUDAmmoPickedUp", "SAResetshouldoccur", function()
	shouldoccur = true
end)