--KDM Level Marker for Hunt

-------------------------
--variables
---------------------------

level1guid = '8c918d'
level2guid = '844c0e'
level3guid = '5ffbab'
-----------------------
--init
------------------------
function onLoad()
	initialized = true
end


------------------------
--Triggers
------------------------
function onCollisionEnter(info)
	if info.collision_object != nil and initialized == true then
		local obj = info.collision_object
		local guid = obj.getGUID()
		local level = ''
		if guid == level1guid then
			level = 'lvl1'
			changeHuntLevel(level)
		elseif guid == level2guid then
			level = 'lvl2'
			changeHuntLevel(level)
		elseif guid == level3guid then
			level = 'lvl3'
			changeHuntLevel(level)
		end
	end
end


-------------------------
--Global Calls
------------------------

function changeHuntLevel(level)
	Global.call('changeHuntLevel', {level})
end