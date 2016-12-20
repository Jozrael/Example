-------------------------------
--KDM terrain card script
---------------------------------

------------------------------
--Globals
---------------------------
terrainType = ''
gameBoxGUID = ''


--------------------------
--Init
----------------------------
function onLoad()

	self.createButton({
		click_function = 'spawnTiles',
		function_owner = self,
		label = '+',
		position = {0.9,0.3,-1.4},
		rotation = {0,0,0},
		width = 150,
		height = 150,
		font_size = 150
	})

end

---------------------------
--functions
----------------------------

function spawnTiles()
	terrainType = self.getName()
	local gameBoxTable = Global.getTable('staticObjs')
	gameBoxGUID = gameBoxTable.gameBox.guid
	local gameBox = getObjectFromGUID(gameBoxGUID)
	local objects = gameBox.getObjects()
	local i = 0
	for k, v in pairs(objects) do
		if v.name == terrainType then
			i = i + 2
			local guid = v.guid
			local params = {}
			params.guid = guid
			params.position = {0, 0, -80}
			params.rotation = self.getRotation ()
			local object = gameBox.takeObject(params)

			local clone = {}
			params = {}
			local pos = self.getPosition()
			params.position = {pos[1],pos[2] + i, pos[3]}
			params.rotation = self.getRotation()
			if object != nil then
				clone = object.clone(params)
			end

			pos = {}
			params = {}
			pos = gameBox.getPosition()
			params = {pos[1], pos[2] + 5 + i, pos[3]}
			object.setPositionSmooth(params)
		end
	end
end