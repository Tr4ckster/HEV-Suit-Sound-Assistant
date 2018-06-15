local shouldfalloccur = true
local shouldtoxioccur = true
local shouldradioccur = true
local shouldbulloccur = true
local falldmgs = {
    "major_fracture.wav",
    "minor_fracture.wav",
    "major_lacerations.wav"
}
local toxidmgs = {
    "biohazard_detected.wav",
    "chemical_detected.wav"
}
local bulletdmgs = {
    "wound_sterilized",
    "blood_loss.wav"
}

net.Receive("SoundAssistantDamage", function()
    SAPlaySound("health_dropping2.wav")
end)

net.Receive("SoundAssistantPoison", function()
    SAPlaySound("blood_toxins.wav")
end)

net.Receive("SoundAssistantBullet", function()
    local health = LocalPlayer():Health()
    if shouldbulloccur and health > 25 then
        local Randomizer = math.random(1,2)
        SAPlaySound(bulletdmgs[Randomizer])
        shouldbulloccur = false
        timer.Simple(10, function() shouldbulloccur = true end)
    end
end)

net.Receive("SoundAssistantFall", function()
    local health = LocalPlayer():Health()
    if shouldfalloccur and health > 25 then
        local Randomizer = math.random(1,3)
        SAPlaySound(falldmgs[Randomizer])
        shouldfalloccur = false
        timer.Simple(5, function() shouldfalloccur = true end)
    end
end)

net.Receive("SoundAssistantToxic", function()
    local health = LocalPlayer():Health()
    if shouldtoxioccur and health > 25 then
        local Randomizer = math.random(1,2)
        SAPlaySound(toxidmgs[Randomizer])
        shouldtoxioccur = false
        timer.Simple(15, function() shouldtoxioccur = true end)
    end
end)

net.Receive("SoundAssistantRadiation", function()
    if shouldradioccur then
        SAPlaySound("radiation_detected.wav")
        shouldradioccur = false
        timer.Simple(60, function() shouldradioccur = true end)
    end
end)