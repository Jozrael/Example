gearGridGUID = ''
armor = {}
isFullyLoaded = false

function onLoad()
	gearGridGUID = self.getDescription()
	isFullyLoaded = true
end

function onCollisionEnter(collision_info)
	collision = collision_info
	startLuaCoroutine(self, 'collisionCoroutine')
end
	
function collisionCoroutine()
	while isFullyLoaded == false do
		coroutine.yield(0)
	end
	local collision_info = collision
    local obj = collision_info.collision_object
	--gear bonus
	if obj.tag == 'Card' then
		local descript = obj.getDescription()
		local tempArmorBonus = {}
		if string.find(descript, 'set') then
			local stringTrim = ''
			local hL = ''
			local bonus = 0
			local possibleHL = {'head', 'body', 'waist', 'arms', 'legs'}
			for k, location in pairs(possibleHL) do
				if string.find(descript, location) then
					stringTrim = string.match(descript, '%d' .. location)
					bonus = string.match(descript, '%d')
					hL = location
					tempArmorBonus[hL] = bonus
				end
			end
			armor[obj.getGUID()] = tempArmorBonus
			local override = false
			if string.find(descript, 'override') then
				override = true
			end
			local params = {armor, override}
			getObjectFromGUID(gearGridGUID).call('loadArmor', params)
		end
	end
	return 1
end

function onCollisionExit(collision_info)
    local obj = collision_info.collision_object
	--gear bonus
	if obj.tag == 'Card' then
		local descript = obj.getDescription()
		if string.find(descript, 'set') then
			armor[obj.getGUID()] = nil
			local override = false
			local params = {armor, override}
			getObjectFromGUID(gearGridGUID).call('loadArmor', params)
		end
	end
end