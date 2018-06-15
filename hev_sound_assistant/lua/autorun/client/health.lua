CreateClientConVar("SA_Welcome", 1, true)
local healthrepeat = true
local criticalsounds = {
    "health_critical.wav",
    "near_death.wav",
    "seek_medic.wav",
    "morphine_shot.wav"
}

hook.Add("PostGamemodeLoaded", "SAIsKatoInstalled", function()
    local inst = steamworks.IsSubscribed("1382783795")
    if inst then
        local txt1 = "You already have Trackster Laboratories Assistant KATO installed. "
        local txt2 = "It is not recommended to use 2 Sound Assistants, since it can lead to "
        local txt3 = "problems between both AIs."
        SAPlaySound("bell.wav")
        chat.AddText(Color(255,136,0),txt1..txt2..txt3)
    end
end)

hook.Add("HUDPaint", "SoundAssistantWelcome", function()
    if GetConVar("SA_Welcome"):GetInt() == 1 then
        SAPlaySound("welcome.wav")
    end
    hook.Remove("HUDPaint", "SoundAssistantWelcome")
end)

hook.Add("HUDPaint", "SoundAssistantHealth", function()
    local Randomizer = math.random(1,4)
    local ply = LocalPlayer()
    local health = ply:Health()
    if health < 25 and healthrepeat then
        SAPlaySound(criticalsounds[Randomizer])
        healthrepeat = false
        timer.Simple(120, function() healthrepeat = true end)
    end
end)

net.Receive("SoundAssistantPlayerRespawn", function()
    healthrepeat = true
end)