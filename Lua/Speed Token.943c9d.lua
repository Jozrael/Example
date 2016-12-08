isKdmEffectsObject = true
effects = {
    speed = 1
}

function getEffects()
    rot = self.getRotation()
    if rot[3] > 345 or rot[3] < 15 then
        effects.speed = -1
    else
        effects.speed = 1
    end
    return effects
end