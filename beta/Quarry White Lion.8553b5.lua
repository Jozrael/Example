--White Lion
-------------------------
--variables
---------------------------
monsterTable = {
	monster = 'White Lion',
	level = 1,
	huntCardPlacement = {
		'__',
		'E',
		'E',
		'',
		'',
		'E',
		'__',
		'',
		'E',
		'E',
		'',
		'',
		'__'
	},
	huntLocation = {
		5,
		8,
		12,
		12
	},
	showdownDecks = {
		lvl1 = {
			b = 7,
			a = 3,
			l = 0,
			s = 0
		},
		lvl2 = {
			b = 10,
			a = 5,
			l = 0,
			s = {'Cunning'}
		},
		lvl3 = {
			b = 10,
			a = 9,
			l = 2,
			s = {'Cunning','Merciless'}
		},
		beastOfSorrow ={
			b = 10,
			a = 5,
			l = 1,
			s = {'Cunning','Trample', 'Weak Spot'}
		},
		greatGoldenCat = {
			b = 0,
			a = 0,
			l = 0,
			s = {'Life 15', 'Cunning','Trample', 'Merciless','Golden Eyes'}
		},
		prologue = {
			b = {'Claw', 'Chomp','Size Up','Power Swat', 'Grasp'},
			a = {'Maul', 'Terrifying Roar', 'Enraged'},
			l = 0,
			s = 0
		}
	},
	showdownStats = {
		lvl1 = {
			mov = 6,
			tgh = 8,
			spd = 0,
			dmg = 0,
			acc = 0,
			lck = 0,
			evs = 0,
		},
		lvl2 = {
			mov = 7,
			tgh = 10,
			spd = 1,
			dmg = 1,
			acc = 0,
			lck = 0,
			evs = 0,
		},
		lvl3 = {
			mov = 8,
			tgh = 14,
			spd = 2,
			dmg = 2,
			acc = 2,
			lck = 1,
			evs = 0,
		},
		beastOfSorrow ={
			mov = 7,
			tgh = 13,
			spd = 1,
			dmg = 1,
			acc = 2,
			lck = 1,
			evs = 0,
		},
		greatGoldenCat = {
			mov = 9,
			tgh = 17,
			spd = 2,
			dmg = 5,
			acc = 2,
			lck = 1,
			evs = 0,
		},
		prologue = {
			mov = 6,
			tgh = 6,
			spd = 0,
			dmg = 0,
			acc = 0,
			lck = 0,
			evs = 0,
		}
	},
	showdownTerrain = {
		specifiedCards = {'1 Tall Grass'},
		randomCards = 2
	}
}

huntObjTriggerGUID = '51b619'
showdownObjTriggerGUID = 'edeb20'
huntTriggered = false
showdownTriggered = false

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
	if huntTriggered == false and initialized == true then
		local obj = info.collision_object
		local guid = obj.getGUID()
		if guid == huntObjTriggerGUID and huntTriggered == false then
			hunt()
		elseif guid == showdownObjTriggerGUID and showdownTriggered == false then
			showdown()
		end
	end
end

function onPickedUp()
	if huntTriggered == true then
		cleanupHunt()
	end
	if showdownTriggered == true then
		cleanupShowdown()
	end
end

--[[ inactive, exit collision method
function onCollisionExit(info2)
	local obj = info2.collision_object
	local guid = obj.getGUID()
	if guid == huntObjTriggerGUID then
		cleanupHunt()
	elseif guid == showdownObjTriggerGUID then
		cleanupShowdown()
	end
end
--]]

-------------------------
--Global Calls
------------------------
function hunt()
	Global.call('setupHunt', monsterTable)
	huntTriggered = true
end

function cleanupHunt()
	Global.call('cleanupHunt')
	huntTriggered = false
end

function showdown()
	Global.call('setupShowdown', monsterTable)
	showdownTriggered = true
end

function cleanupShowdown()
	Global.call('cleanupShowdown')
	showdownTriggered = false
end