
sLocations = {
	'bone smith',
	'organ grinder',
	'skinnery',
	'leather worker',
	'plumery',
	'catarium',
	'barber surgeon',
	'blacksmith',
	'mask maker',
	'skinnery',
	'stone circle',
	'rare'
}

function onLoad()
	local zones = Global.getTable('zones')
	settlementZoneGUID = zones.zoneSettlement.guid
end

function onCollisionEnter(collision_info)
	local obj = collision_info.collision_object
	if obj.tag == 'Card' then
		local descript = obj.getDescription()
		if string.find(descript, 'gear') then
			if string.find(descript, 'unique') or string.find(descript, 'copied') then
			else
				--get type
				local sLocation = {}
				for k, v in pairs(sLocations) do
					if string.find(descript, v) then
						sLocation = v
					end
				end
				--get pos
				local objs = getObjectFromGUID(settlementZoneGUID).getObjects()
				local deck = {}
				for k, v in pairs(objs) do
					if v.tag == 'Deck' then
						local name = string.lower(v.getName())
						if string.find(name, sLocation) and string.find(name, 'gear') then
							deck = v
						end
					end
				end
				local params = {}
				local pos = {}
				if deck ~= nil then
					pos = deck.getPosition()
				end
				params.position = {pos[1], pos[2] + 2, pos[3]}
				local clone = obj.clone(params)
				if clone then
					obj.setDescription(descript .. ', copied')
				end
			end
		end
	end
end