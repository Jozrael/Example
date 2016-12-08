--placeholder script

function onLoad()
end

function onDropped()
	local var = self.getName()
	local zoneTable = {}
	local zoneTable = Global.getTable('zones')
	local guid = zoneTable[var].guid
	local zone = getObjectFromGUID(guid)
	local pos = self.getPosition()
	zone.setPosition(pos)
end