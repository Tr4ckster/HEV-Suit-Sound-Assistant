local sound_info = {
    ["timestamp"] = 0,
    ["duration"] = 0
}

local function SAQueueSound(duration)
    sound_info.timestamp, sound_info.duration = CurTime(), duration
end

local function SASoundIsPlaying()
    return CurTime() - sound_info.timestamp < sound_info.duration
end



function SAPlaySound(sound, duration)
    if SASoundIsPlaying() then return false end
    if not duration then duration = SoundDuration(sound) end

    surface.PlaySound(sound)
    SAQueueSound(duration)

    return true
end