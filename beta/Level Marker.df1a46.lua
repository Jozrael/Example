--KDM Level Marker for Showdown

-------------------------
--variables
---------------------------

level1guid = 'd55917'
level2guid = 'c0087a'
level3guid = '6d5b9b'
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
			changeShowdownLevel(level)
		elseif guid == level2guid then
			level = 'lvl2'
			changeShowdownLevel(level)
		elseif guid == level3guid then
			level = 'lvl3'
			changeShowdownLevel(level)
		end
	end
end


-------------------------
--Global Calls
------------------------

function changeShowdownLevel(level)
	Global.call('changeShowdownLevel', {level})
end