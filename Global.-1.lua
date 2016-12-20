--KDM Global Script
--script created by Eskander
--script v0.3

----------------------------------------------------------------
--Globals
----------------------------------------------------------------

---------------------
--Edit Prefs
---------------------
--unsaved
bypassSavedLoad = false 	-- used to bypass load init manually
prologueBypass = true  	--not ready, keep true
--saved
clearSavedData = false 		-- used to clear save data
autoHunt = true		--allows automatic hunt deployment of objects
autoShowdown = true 	--allows automatic showdown deployment of objects
autoMonsterDeck = false		--not ready, keep false
autoDeckRefresh = true		--not ready, keep false
debug = false		--not ready, keep false
devMode = false		--changes interactive for static/placeholder objects, toggles rest interactive options below
interactBox = false 	--makes gamebox interactable if true
interactPlaceholders = false 	-- makes placeholders interactable if true
interactStatics = false		--makes static objs interactable if true

---------------------
--Vars
---------------------
--tables
messages = {
	msgLine = '__________________________________________',
	msgBlank = '                                          ',
	msgPageBreak = '------------------------------------------',
	msgWelcomeTitle = 'Welcome to KINGDOM DEATH MONSTER.',
	msgWelcomeSubtitle = "Eskander's Variant.",
	msgSettingUpHunt1 = 'The survivors have chosen their quarry. A ',
	msgSettingUpHunt2 = '. The survivors prepare...',
	msgHuntIsSetup1 = 'The Hunt for the ',
	msgHuntIsSetup2 = ' awaits.  Prepare any Special Hunt Events and begin.',
	msgHuntCleared = 'The Hunt is ended. The untaken paths erased.',
	msgSettingUpShowdown1 = 'Before the survivors stands the ',
	msgSettingUpShowdown2 = '...',
	msgShowdownIsSetup = 'The survivors prepare to fight.',
	msgShowdownCleared = 'The battle ends.  The settlement provides refuge for any that survive.'
}

boards = {
	boardHunt = {guid = 'd5b02b'},
	boardSettlement = {guid = 'b2be27'},
	boardMonster = {guid = '463cb7'},
	boardStoryL = {guid = '40ac46'},
	boardStoryR = {guid = 'f459e5'},
	boardStoryT = {guid = ' fece67'}
}

staticObjs = {
	gameBox = {guid = '93281a'},
	consoleAdmin = {guid = 'e00199'},
	decorAltarLower = {guid = '111374'},
	decorAltarTable = {guid = 'f0f68c'},
	decorTableRaisedL = {guid = '85cdbe'},
	decorTableRaisedR = {guid = '482e12'},
	decorTableRaisedC = {guid = '1e9020'},
	decorTableFront = {guid = 'ef94c5'},
}

placeholders = {
	--essentialDecks
	deckBasicHunt = {guid = '4e9d9e'},
	deckSpecialHunt = {guid = '148b16'},
	deckTerrain = {guid = '51b305'},
	deckVermin = {guid = '8c28ba'},
	deckStrangeResources = {guid = '7aadc0'},
	deckBasicResources = {guid = '4b6997'},
	deckSevereInjuries = {guid = '421db1'},
	deckDisorders = {guid = '3a5452'},
	deckAbilities = {guid = '625f68'},
	deckFightingArts = {guid = '515434'},
	deckSecretFightingArts = {guid = 'b6c374'},
	--discards
	discardVermin = {guid = '772088'},
	discardStrangeResources = {guid = '215b76'},
	discardBasicResources = {guid = '7e95eb'},
	discardSevereInjuries = {guid = 'd510d7'},
	discardDisorders = {guid = '48ca41'},
	discardAbilities = {guid = '7c0b00'},
	discardFightingArts = {guid = '456940'},
	discardSecretFightingArts = {guid = '7b7ed5'},
	--monsterDecks
	deckMonsterHunt = {guid = 'e80e92'},
	deckMonsterSpecialHunt = {guid = '1dca94'},
	deckMonsterResources = {guid = 'f8c095'},
	deckMonsterAIBasic = {guid = 'be3886'},
	deckMonsterAIAdvanced = {guid = '3b984a'},
	deckMonsterAILegendary = {guid = '918627'},
	deckMonsterAISpecial = {guid = 'da09a1', flip = true},
	cardMonsterBasicAction = {guid = 'ce146d'},
	deckMonsterHitLocations = {guid = '24cc56'},
}

essentialDecks = {
	--essential card decks
	deckBasicHunt = {
		guid = 'a0bf77',
		name = 'Basic Hunt Events Deck',
		description = 'essential, hunt, basic',
		minCount = 12
	},
	deckSpecialHunt = {
		guid = 'ca5915',
		name = 'Special Hunt Events Deck',
		description = 'essential, hunt, special',
		minCount = 2
	},
	deckAbilities = {
		guid = '7e2101',
		name = 'Abilities Deck',
		description = 'essential, character, abilities',
		minCount = 45
	},
	deckSecretFightingArts = {
		guid = '0553f0',
		name = 'Secret Fighting Arts Deck',
		description = 'essential, character, fighting art, secret',
		minCount = 6
	},
	deckFightingArts = {
		guid = '57669f',
		name = 'Fighting Arts Deck',
		description = 'essential, character, fighting art',
		minCount = 20
	},
	deckDisorders = {
		guid = 'd3f480',
		name = 'Disorders Deck',
		description = 'essential, character, disorder',
		minCount = 23
	},
	deckStrangeResources = {
		guid = '697d92',
		name = 'Strange Resources Deck',
		description = 'essential, resource, strange',
		minCount = 21
	},
	deckBasicResources = {
		guid = '6668a5',
		name = 'Basic Resources Deck',
		description = 'essential, resource, basic',
		minCount = 21
	},
	deckVermin = {
		guid = '19d17b',
		name = 'Vermin Deck',
		description = 'essential, vermin',
		minCount = 8
	},
	deckTerrain = {
		guid = '280ec7',
		name = 'Terrain Deck',
		description = 'essential, terrain card',
		minCount = 21
	},
	deckSevereInjuries = {
		guid = '966479',
		name = 'Severe Injuries Deck',
		description = 'essential, character, psi',
		minCount = 26
	},
}

deckTokens = {
	--essential deck refresh tokens
	discardVermin = {
		guid = '1851bd',
	},
	discardStrangeResources = {
		guid = '7e1baa',
	},
	discardBasicResources = {
		guid = '032768',
	},
	discardSevereInjuries = {
		guid = '2a708b',
	},
	discardDisorders = {
		guid = 'e9121e',
	},
	discardAbilities = {
		guid = '0688ee',
	},
	discardFightingArts = {
		guid = 'bf909b',
	},
	discardSecretFightingArts = {
		guid = 'e2bfd3',
	},
}

	--added monster decks
monsterDecks = {
	deckMonsterHunt = {
		name = '__ Hunt Events Deck',
	},
	deckMonsterSpecialHunt = {
		name = '__ Special Hunt Events Deck',
	},
	deckMonsterResources = {
		name = '__ Resources Deck',
	},
	deckMonsterAIBasic = {
		name = '__ Basic AI Deck',
	},
	deckMonsterAIAdvanced = {
		name = '__ Advanced AI Deck',
	},
	deckMonsterAILegendary = {
		name = '__ Legendary AI Deck',
	},
	deckMonsterAISpecial = {
		name = '__ Special AI Deck',
	},
	cardMonsterBasicAction = {
		name = '__ Basic Action Card',
	},
	deckMonsterHitLocations = {
		name = '__ Hit Locations Deck',
	},
}

zones = {
	zoneAll = {guid =''},
	--general areas
	zoneMain = {guid = '63aa2f'},
	zoneHunt = {guid = '7300c1'},
	zoneMonsterBoard = {guid = '4759fe'},
	zoneSettlement = {guid = '7c6c54'},
	zoneSurvivors = {guid = 'a5ff30'},
	--specific areas
	zoneStoryL = {guid = 'df9ce3'},
	zoneStoryR = {guid = 'f44a0d'},
	zoneStoryT = {guid = '6097d8'},
	zoneP1 = {guid = '000000'},
	zoneP2 = {guid = '000000'},
	zoneP3 = {guid = '000000'},
	zoneP4 = {guid = '000000'},
	--essential decks
	deckBasicHunt = {guid = '9e8411'},
	deckSpecialHunt = {guid = '9b055d'},
	deckTerrain = {guid = '09fd7e'},
	deckVermin = {guid = '9e34b0'},
	deckStrangeResources = {guid = '16853a'},
	deckBasicResources = {guid = '76112c'},
	deckSevereInjuries = {guid = '4c84bd'},
	deckDisorders = {guid = '6a128c'},
	deckAbilities = {guid = 'ceac97'},
	deckFightingArts = {guid = '2f833d'},
	deckSecretFightingArts = {guid = 'bd702f'},
	--discards
	discardVermin = {guid = '785048'},
	discardStrangeResources = {guid = '0acd8e'},
	discardBasicResources = {guid = '0cdada'},
	discardSevereInjuries = {guid = 'abf02b'},
	discardDisorders = {guid = '1cc53d'},
	discardAbilities = {guid = 'a35982'},
	discardFightingArts = {guid = '558b62'},
	discardSecretFightingArts = {guid = '782b90'},
}

currentQuarryTable = {'null'}
currentShowdownTable = {'null'}

--vars
offsetXHuntCards = {15.6,13,10.4,7.8,5.2,2.6,0,-2.6,-5.2,-7.8,-10.4,-13,-15.6}
offsetScaleHuntBoard = 4.23325157

--tracking
--always saved
firstGameLoad = true
currentHuntLevel = 1
currentShowdownLevel = 1
--saved unless cleared
huntInProgress = false
huntSettingUp = false
showdownInProgress = false
showdownSettingUp = false
cancelHuntSetup = false
monsterFigurinePlaced = nil
monsterResourcePlaced = false
monsterResourceToBePlace = false
cancelShowdownSetup = false
huntCleaning = false
showdownCleaning = false
huntCleanPending = false
showdownCleanPending = false


--Colors
rgbWhite = {1,1,1}
rgbBlack = {0,0,0}
rgbDarkRed = {0.8,0,0}
rgbError = {1,0,0}
rgbSystem = {0,1,0}
rgbNarrator = {0.3,0.6,0.8}


---------------------
--Save data
---------------------
function onSave()
    local dataToSave = {}

	if clearSavedData == false then
		dataToSave = {
			['clearSavedData'] = clearSavedData,
			['autoHunt'] = autoHunt,
			['autoShowdown'] = autoShowdown,
			['autoMonsterDeck'] = autoMonsterDeck,
			['autoDeckRefresh'] = autoDeckRefresh,
			['debug'] = debug,
			['devMode'] = devMode,
			['interactBox'] = interactBox,
			['interactPlaceholders'] = interactPlaceholders,
			['interactStatics'] = interactStatics,
			['currentQuarryTable'] = currentQuarryTable,
			['currentShowdownTable'] = currentShowdownTable,
			['firstGameLoad'] = firstGameLoad,
			['currentHuntLevel'] = currentHuntLevel,
			['currentShowdownLevel'] = currentShowdownLevel,
			['huntInProgress'] = huntInProgress,
			['huntSettingUp'] = huntSettingUp,
			['showdownInProgress'] = showdownInProgress,
			['showdownSettingUp'] = showdownSettingUp,
			['cancelHuntSetup'] = cancelHuntSetup,
			['monsterFigurinePlaced'] = monsterFigurinePlaced,
			['monsterResourcePlaced'] = monsterResourcePlaced,
			['monsterResourceToBePlace'] = monsterResourceToBePlace,
			['cancelShowdownSetup'] = cancelShowdownSetup,
			['huntCleaning'] = huntCleaning,
			['showdownCleaning'] = showdownCleaning,
			['huntCleanPending'] = huntCleanPending,
			['showdownCleanPending'] = showdownCleanPending,
		}
	else
		dataToSave = {
			['clearSavedData'] = clearSavedData,
			['autoHunt'] = autoHunt,
			['autoShowdown'] = autoShowdown,
			['autoMonsterDeck'] = autoMonsterDeck,
			['autoDeckRefresh'] = autoDeckRefresh,
			['debug'] = debug,
			['devMode'] = devMode,
			['interactBox'] = interactBox,
			['interactPlaceholders'] = interactPlaceholders,
			['interactStatics'] = interactStatics,
			['firstGameLoad'] = firstGameLoad,
			['currentQuarryTable'] = currentQuarryTable,
			['currentShowdownTable'] = currentShowdownTable,
			['currentHuntLevel'] = currentHuntLevel,
			['currentShowdownLevel'] = currentShowdownLevel,
		}
	end

	saved_data = JSON.encode(dataToSave)

	--Uncomment this line to manually clear the save data
	--saved_data = ''

    return saved_data
end

----------------------------------------------------------------
--Initialize
----------------------------------------------------------------

function onLoad(saved_data)
	----------------------------initial chat messages
	printToAll(messages.msgLine,rgbBlack)
	printToAll(messages.msgBlank,rgbBlack)
	printToAll(messages.msgWelcomeTitle,rgbDarkRed)
	printToAll(messages.msgWelcomeSubtitle,rgbWhite)
	printToAll(messages.msgLine,rgbBlack)

	--load saved from previous session
	if bypassSavedLoad == false then
		if saved_data != '' then
			resumeLoadInit(saved_data)
		else
			clearSavedData = false
		end
	end

	--------------------------------always init
	--[[deactivated
	--clear deprecated zones
	local objs = getAllObjects()
	local protected = false
	for k,v in pairs (objs) do
		if v.tag == 'Scripting' then
			protected = false
			for j, h in pairs (zones) do
				if h.guid == v.guid then
					protected = true
				end
			end
			if protected == false then
				v.destruct()
			end
		end
	end
	--]]

	------------------admin move/resize zones, normally disabled
	--[[--]]
	local zone = getObjectFromGUID(zones.zoneHunt.guid)
	local pos = zone.getPosition()
	local adjPos = zone.setPosition({pos[1], 10, pos[3]})
	local scale = zone.getScale()
	zone.setScale({scale[1], 20, scale[3]})
	--zone = getObjectFromGUID(zones.zoneAll.guid)
	--pos = zone.getPosition()
	--adjPos = zone.setPosition({pos[1], 10, pos[3]})
	--scale = zone.getScale()
	--zone.setScale({scale[1], 20, scale[3]})
	zone = getObjectFromGUID(zones.zoneSettlement.guid)
	pos = zone.getPosition()
	adjPos = zone.setPosition({pos[1], 10, pos[3]})
	scale = zone.getScale()
	zone.setScale({scale[1], 20, scale[3]})
	zone = getObjectFromGUID(zones.zoneMain.guid)
	pos = zone.getPosition()
	adjPos = zone.setPosition({pos[1], 10, pos[3]})
	scale = zone.getScale()
	zone.setScale({scale[1], 20, scale[3]})
	zone = getObjectFromGUID(zones.zoneSurvivors.guid)
	pos = zone.getPosition()
	adjPos = zone.setPosition({pos[1], 10, pos[3]})
	scale = zone.getScale()
	zone.setScale({scale[1], 20, scale[3]})
	



	-----------------load essential obj refs
	gameBox = getObjectFromGUID(staticObjs.gameBox.guid)
	consoleAdmin = getObjectFromGUID(staticObjs.consoleAdmin.guid)



	--[[deactivated
	--update essential obj zones
	for k,v in pairs(placeholders) do
		local obj = getObjectFromGUID(v.guid)
		local rot = obj.getRotation()
		local pos = obj.getPosition()
		zones[k] = spawnObject({
			type = 'ScriptingTrigger',
			position = pos,
			rotation = rot,
			scale = {3, 3, 3}
		})
	end
	--]]

	---------------load prefs
	if devMode == true then
		devModeOn()
	else
		devModeOff()
	end
	if interactBox == true then
		unlockGameBox()
	else
		lockGameBox()
	end
	if interactPlaceholders == true then
		unlockPlaceholders()
	else
		lockPlaceholders()
	end
	if interactStatics == true then
		unlockStatics()
	else
		lockStatics()
	end

	--prologue setup load, not ready yet
	if prologueBypass == false and firstGameLoad == true then
		prologueInit()
	elseif firstGameLoad == true then
		firstGameLoad = false
		bypassPrologueLoad()
	else
		fullLoadInit()
	end
end

-----------------------------------------loads saved vars from previous session
function resumeLoadInit(saved_data)
	local dataToLoad = JSON.decode(saved_data)
	clearSavedData = dataToLoad.clearSavedData
	autoHunt = dataToLoad.autoHunt
	autoShowdown = dataToLoad.autoShowdown
	autoMonsterDeck = dataToLoad.autoMonsterDeck
	autoDeckRefresh = dataToLoad.autoDeckRefresh
	debug = dataToLoad.debug
	devMode = dataToLoad.devMode
	interactBox = dataToLoad.interactBox
	interactPlaceholders = dataToLoad.interactPlaceholders
	interactStatics = dataToLoad.interactStatics
	firstGameLoad = dataToLoad.firstGameLoad
	currentQuarryTable = dataToLoad.currentQuarryTable
	currentShowdownTable = dataToLoad.currentShowdownTable
	currentHuntLevel = dataToLoad.currentHuntLevel
	currentShowdownLevel = dataToLoad.currentShowdownLevel
	if clearSavedData == false then
		huntInProgress = dataToLoad.huntInProgress
		huntSettingUp = dataToLoad.huntSettingUp
		showdownInProgress = dataToLoad.showdownInProgress
		showdownSettingUp = dataToLoad.showdownSettingUp
		cancelHuntSetup = dataToLoad.cancelHuntSetup
		monsterFigurinePlaced = dataToLoad.monsterFigurinePlaced
		monsterResourcePlaced = dataToLoad.monsterResourcePlaced
		monsterResourceToBePlace = dataToLoad.monsterResourceToBePlace
		cancelShowdownSetup = dataToLoad.cancelShowdownSetup
		huntCleaning = dataToLoad.huntCleaning
		showdownCleaning = dataToLoad.showdownCleaning
		huntCleanPending = dataToLoad.huntCleanPending
		showdownCleanPending = dataToLoad.showdownCleanPending
	else
		clearSavedData = false
	end
end



--------------------------------loads only prologue setup, currently not ready
function prologueInit()
	printToAll('Choose how to proceed. Choose wisely.', rgbNarrator)
	--gameBox2 = getObjectFromGUID('')
end

--------------------------------loads all assets that would be loaded in stages during prologue
function bypassPrologueLoad()
	fullLoadInit()
end

-----------------------------------------loads normal full init
function fullLoadInit()
	--board ref
	boardHunt = getObjectFromGUID(boards.boardHunt.guid)
	boardMonster = getObjectFromGUID(boards.boardMonster.guid)

end


----------------------------------------------------------------
--Prologue setup
----------------------------------------------------------------

--triggered by bypass button press, players read the intro story, guided on state change for manuals
function prologue1()
	--move manual gamebox, setscale difference
	gameBox2.setPosition({30,10,30})
	gameBox2.setScale({1,1,1})
	--get bag of prologue items
	prologueBag = gameBox2.takeObject({guid = '',position = {0,0,-30},rotation = {0,0,0}})
	prologueBag.lock()
	--spawn prologue book
	prologueBag.takeObject({guid = '',position = {0,0,0},rotation ={0,0,0}})
	--spawn guide for state change
	prologueBag.takeObject({guid = '',position = {0,0,10},rotation ={0,0,0}})
	--spawn essential decks
	sstartLuaCoroutine(Global, 'spawnEssentials1Coroutine')
end

function spawnEssentials1Coroutine()
	local decks = {}
	local d = 1
	for k, v in pairs(essentialDecks) do
		local params = {}
		params.guid = v.guid
		local pos = getObjectFromGUID(placeholders[k].guid).getPosition()
		params.position = {pos[1],pos[2] + 2,pos[3]}
		params.rotation = getObjectFromGUID(placeholders[k].guid).getRotation()
		decks[d] = prologueBag.takeObject(params)
		d = d + 1
		for i=1, 30 do
			coroutine.yield(0)
		end
	end
	for k, v in pairs(decks) do
		v.shuffle()
	end
	return 1
end


--triggered by state change to char gen page, players introed to char stations and set char names
function prologue2()
	--load player stations,starting gear, figurines, stat tokens, and sheet bags
	--spawn guides for sheets
	--spawn manual for create char
end

--triggered by state change on last story page, players introed to showdown setup
function prologue3()
	--load lion statue, showdown setup story book, other needed story books
	--load guides for setting up showdown
	--load manual for conducting showdown
end

--triggered by showdown cleanup, players introed to settlement phase
function prologue4()
	--spawn settlement board, settlement sheets, settlement guides, settlement story books, innovations board, settlement upgrades
end

--triggered by??
function prologue5()
	--spawn hunt board, hunt guide, hunt etc
end




----------------------------------------------------------------
--Admin Console
----------------------------------------------------------------

function showAdmin()
	local params = {0, 10, 0}
	consoleAdmin.setPosition(params)
	consoleAdmin.interactable = true
	consoleAdmin.setRotation({0,180,0})
end

function togglePlaceholders()
	if interactPlaceholders == false then
		unlockPlaceholders()
	else
		lockPlaceholders()
	end
end

function lockPlaceholders()
	for k,v in pairs(placeholders) do
		local obj = getObjectFromGUID(v.guid)
		if obj != nil then
			obj.tooltip = false
			obj.lock()
			obj.interactable = false
		end
	end
	interactPlaceholders = false
end

function unlockPlaceholders()
	for k,v in pairs(placeholders) do
		local obj = getObjectFromGUID(v.guid)
		if obj != nil then
			obj.tooltip = true
			obj.unlock()
			obj.interactable = true
		end
	end
	interactPlaceholders = true
end

function toggleGameBox()
	if gameBox.interactable == true then
		gameBox.interactable = false
		interactBox = false
	else
		gameBox.interactable = true
		interactBox = true
	end
end

function unlockGameBox()
	gameBox.interactable = true
	interactBox = true
end

function lockGameBox()
	gameBox.interactable = false
	interactBox = false
end

function devModeOn()
	unlockGameBox()
	unlockPlaceholders()
	unlockStatics()
	devMode = true
end

function devModeOff()
	lockGameBox()
	lockPlaceholders()
	lockStatics()
	devMode = false
end

function toggleDevMode()
	if devMode == true then
		devModeOff()
	elseif devMode == false then
		devModeOn()
	end
end

function unlockStatics()
	for k, v in pairs(staticObjs) do
		if k != gameBox or k != consoleAdmin then
			local object = getObjectFromGUID(v.guid)
			object.interactable = true
		end
	end
	interactStatics = true
end

function lockStatics()
	for k, v in pairs(staticObjs) do
		if k != gameBox or k != consoleAdmin then
			local object = getObjectFromGUID(v.guid)
			object.interactable = false
		end
	end
	interactStatics = false
end

function toggleAutoHunt()
	if autoHunt == true then
		autoHunt = false
	elseif autoHunt == false then
		autoHunt = true
	end
end

function toggleAutoShowdown()
	if autoShowdown == true then
		autoShowdown = false
	elseif autoShowdown == false then
		autoShowdown = true
	end
end

function toggleAutoMonsterDeck()
	if autoMonsterDeck == true then
		autoMonsterDeck = false
	elseif autoMonsterDeck == false then
		autoMonsterDeck = true
	end
end

function toggleAutoDeckRefresh()
	if autoDeckRefresh == true then
		autoDeckRefresh = false
	elseif autoDeckRefresh == false then
		autoDeckRefresh = true
	end
end



----------------------------------------------------------------
--Common Utility Functions
----------------------------------------------------------------

--[[ ------------------------------custom get obj fcn, searches for obj(s) through custom searches
types of search and params
tag = search for objs by tags, includes/excludes, params = {conditional = 'and' or 'or', criteria = string looked for, exclude = strings to exclude obj if found}
name = search for objs by name, with varying strings, params = {conditional = 'contains' or 'matches', criteria = string looked for, exclude = strings to exclude obj if found}
--]]
function getObj(searchType, container, params)  --params = {conditional = '', criteria = {}, exclude = {}}
	if container != nil then
		local containerType = container.tag
		local objs = container.getObjects()
		local objGUIDs = {}
		local text = {}
		local excludes = params.exclude
		local includes = params.criteria
		local objAdded = false
		local isFound = false
		local foundCount = 0
		if searchType ==  'tag' then
			for k, v in pairs(objs) do
				objAdded = false
				isFound = false
				foundCount = 0
				text = v.getDescription()
				for i = 1, #includes do
					if string.find(string.lower(text), string.lower(includes[i])) then
						foundCount = foundCount + 1
					end
				end
				if params.conditional == 'and' then
					if foundCount == #includes then
						isFound = true
					end
				elseif params.conditional == 'or' then
					if foundCount > 0 then
						isFound = true
					end
				end
				if isFound == true then
					table.insert(objGUIDs, v.getGUID())
					objAdded = true
				end
				isFound = false
				if #excludes > 0 then
					for i = 1, #excludes do
						if string.find(string.lower(text), string.lower(excludes[i])) then
							isFound = true
						end
					end
					if objAdded == true and isFound == true then
						table.remove(objGUIDs)
					end
				end
			end
		elseif searchType == 'name' then
			for k, v in pairs(objs) do
				objAdded = false
				isFound = false
				if containerType == 'Bag' then
					text = v.name
				elseif containerType == 'Deck' then
					text = v.nickname
				else
					text = v.getName()
				end
				for i = 1, #includes do
					if params.conditional == 'matches' then
						if text == includes[i] then
							isFound = true
						end

					elseif params.conditional == 'contains' then
						if string.find(text, includes[i]) then
							isFound = true
						end
					end
					if isFound == true then
						table.insert(objGUIDs, v.guid)
						objAdded = true
					end
				end
				isFound = false
				if #excludes > 0 then
					for i = 1, #excludes do
						if params.conditional == 'matches' then
							if text == excludes[i] then
								isFound = true
							end
						elseif params.conditional == 'contains' then
							if string.find(text, excludes[i]) then
								isFound = true
							end
						end
					end
					if objAdded == true and isFound == true then
						table.remove(objGUIDs)
					end
				end
			end
		end
		if #objGUIDs > 0 then
			local obj = {}
			if containerType == 'Bag' or containerType == 'Deck' then
				obj = objGUIDs
			else
				for i=1,#objGUIDs do
					obj[i] = getObjectFromGUID(objGUIDs[i])
				end
			end
			return obj
		else
			return nil
		end
	else
		printToAll('Container not found!',rgbError)
	end
end

----------------------spawn from box
function spawnFromBox(objects, paramsOverride)
local dy = 0
	local dz = -80
	local py = 2
	local pz = -3
	local params = {}
	local params2 = {}
	local result = {}
	local result2 = {}
	local container = gameBox
	for k,v in pairs(objects) do
		--set params
		if paramsOverride != nil then
			params.position = paramsOverride.position
			params.rotation = paramsOverride.rotation
		else
			local placeholder = getObjectFromGUID(placeholders[k].guid)
			params.position = placeholder.getPosition()
			params.rotation = placeholder.getRotation()
			if placeholders[k].flip != nil then
				if placeholders[k].flip == true then
					params.rotation.z = 0
				end
			end
		end
		params.position[2] = params.position[2] + 5
		params.guid = v
		--take
		result[k] = container.takeObject(params)
		--dupe
		coroutine.yield(0)
		if result[k] != nil then
			dz = dz + pz
			dy = dy + py
			params2.position = gameBox.getPosition()
			params2.position.z = params2.position.z + dz
			result2[k] = duplicate(result[k], params2)
			for i=1,45,1 do
				coroutine.yield(0)
			end
			params2.position = gameBox.getPosition()
			params2.position.y = params2.position.y + dy
			result2[k].setPositionSmooth(params2.position)
			for i=1,45,1 do
				coroutine.yield(0)
			end
			--if result[k].tag == 'Deck' then
				--result[k].shuffle()
			--end
			--coroutine.yield(0)
		else
			printToAll(k .. ' not found! Check component in Master Game Box or remove excess decks on placeholder.', rgbError)
		end
	end
	return result
end


-------------------duplicate object
function duplicate(object, params)
	if object != nil then
		return object.clone(params)
	else
		return nil
	end
end



-------------------clear objs
function cleanup(searchType, container, params)
	local killList = getObj(searchType, container, params)
	if killList != nil or killList != null then
		for k,v in pairs(killList) do
			v.destruct()
		end
		return true
	else
		return false
	end
end

---------------------findDeck or card
function findDeck(zone)
	local isDeck = false
	local obj = {}
	local deck = {}
	local card = nil
	local objs = zone.getObjects()
	for k, v in pairs(objs) do
		if string.find(v.tag,'Deck') then
			isDeck = true
			deck = v
		elseif string.find(v.tag, 'Card') then
			isDeck = false
			card = v
		end
	end
	local foundDeck = {}
	if isDeck == true then
		foundDeck = {deck, 'Deck'}
		return foundDeck
	elseif isDeck == false and card != nil then
		foundDeck = {card, 'Card'}
		return foundDeck
	else
		return nil
	end
end

---------------------trig calc
function trig(obj, distance)
    local r = obj.getRotation()[2]
    r = math.rad(r)
    return {distance * math.cos(r), 0, distance * math.sin(r)}
end


---------------------findPos
function findPos(var)
	local guid =  placeholder[var].guid
	local placeholder = getObjectFromGUID(guid)
	local params = {}
	if placeholder != nil or null then
		local pos = placeholder.getPosition()
		local rot = placeholder.getRotation()
		params = {position = pos, rotation = rot}
		return params
	else
		printToAll('Placeholder not found.', rgbError)
		return nil
	end
end

-----------------------check counts of essential objs
function checkSumEssentials(table, var)
	local checkSumPass = nil
	if getObjectFromGUID(table[var].guid) != nil then
		object = getObjectFromGUID(table[var].guid)
		if object.getQuantity() < table[var].minCount then
			checkSumPass = false
			printToAll('Checksum on ' .. var .. ' failed.  Missing ' .. table[var].minCount - object.getQuantity() .. ' components...', rgbSystem)
		else
			checkSumPass = true
		end
	end
	return checkSumPass
end

----------------------check essential decks -- checks decks by guid, returns table of [1]good decks and [2]broken decks by var
function checkEssentialDecks(deckVars)
	local decksToCheck = {}
	local decksBroken = {}
	local decksGood = {}
	if deckVars != nil then
		decksToCheck = deckVars
	else
		for k, v in pairs(essentialDecks) do
			table.insert(decksToCheck, k)
		end
	end
	for k,v in pairs(decksToCheck) do
		local guid = essentialDecks[v].guid
		if getObjectFromGUID(guid) == nil then
			table.insert(decksBroken, v)
		else
			table.insert(decksGood, v)
		end
	end
	local result = {decksGood, decksBroken}
	return result
end


--------------------reset essential decks --gets deck by guid, resets, and checks count, returns true if meets count, false if not, and nil if no deck
function resetEssentialDeck(deckVar)
	local deck = getObjectFromGUID(essentialDecks[deckVar].guid)
	local reset = false
	if deck != nil then
		deck.reset()
		for i=1, 60 do
			coroutine.yield(0)
		end
		local count = deck.getQuantity()
		if count < essentialDecks[deckVar].minCount then
			reset = false
		else
			reset = true
		end
	else
		reset = nil
	end
	return reset
end

---------------------reconstruct essential decks --attempts to repair by getting all the cards to manually reset deck without changing deck
function reconstructEssentialDeck(deckVar, zoneVar)
	local reconstructed = false
	local zone = {}
	if zoneVar == nil then
		zone = getObjectFromGUID(zones.zoneMain.guid)
	else
		zone = getObjectFromGUID(zones[zoneVar].guid)
	end
	local description = essentialDecks[deckVar].description
	local nospaces = string.gsub(description, ' ', '')
	local tags = {}
	for i in string.gmatch(nospaces, '%a+') do
		table.insert(tags, i)
	end
	local cards = getObj('tag',zone,{conditional = 'and', criteria = tags, exclude = {}})
	local newDeck = {}
	if cards != nil then
		local i = 0
		for k,v in pairs(cards) do
			if v.tag != 'Deck' then
				i=i+1
				local pos = getObjectFromGUID(placeholders[deckVar].guid).getPosition()
				local rot = getObjectFromGUID(placeholders[deckVar].guid).getRotation()
				v.setPositionSmooth({pos[1],pos[2] + i+1,pos[3]})
				v.setRotationSmooth(rot)
			end
		end
		for i=1,120 do
			coroutine.yield(0)
		end
	end
	--rename/retag deck
	local result = findDeck(getObjectFromGUID(zones[deckVar].guid))
	if result != nil then
		if result[2] == 'Deck' then
			local deck = result[1]
			if deck != nil then
				deck.setName(essentialDecks[deckVar].name)
				deck.setDescription(essentialDecks[deckVar].description)
				deck.tooltip = false
				essentialDecks[deckVar].guid = deck.getGUID()
				reconstructed = true
			end
		end
	end
	
	return reconstructed
end

----------------------respawn essential deck
function respawnEssentialDeck(deckVar)
	--purge existing
	local description = essentialDecks[deckVar].description
	local nospaces = string.gsub(description, ' ', '')
	local tags = {}
	for i in string.gmatch(nospaces, '%a+') do
		table.insert(tags, i)
	end
	local zone = getObjectFromGUID(zones.zoneHunt.guid)
	cleanup('tag',zone,{conditional = 'and', criteria = tags, exclude = {'drawn'}})
	coroutine.yield(0)
	--spawn new
	local result = {}
	local getDeck = getObj('name',gameBox, {conditional = 'matches',criteria = {essentialDecks[deckVar].name}, exclude = {}})
	for k,v in pairs(getDeck) do
		result[deckVar] = v
	end
	local deck = spawnFromBox(result, nil)
	for i=1, 30 do
		coroutine.yield(0)
	end
	deck[deckVar].shuffle()
	essentialDecks[deckVar].guid = deck[deckVar].guid
end

------------------debug essential decks
function debugEssentialDecks(deckVars, recall)
	--identify bad decks
	local checkPass = false
	local checkedDecks = checkEssentialDecks(deckVars)
	local badDecks = {}
	local decksBroken = {}
	local checkSum = nil
	local decksBroken = checkedDecks[2]
	if #decksBroken > 0 then
		for k,v in pairs(checkedDecks[2]) do
			table.insert(badDecks, v)
		end
	end
	local decksGood = {}
	local decksGood = checkedDecks[1]
	if #decksGood > 0 then
		for k,v in pairs(decksGood) do
			checkSum = checkSumEssentials(essentialDecks, v)
			if checkSum == false then
				table.insert(badDecks, v)
			end
		end
	end
	local checkFail = false
	if #badDecks < 1 then
		checkPass = true
	else
		printToAll('Essential Deck failure. Attempting to repair...',rgbSystem)
		--attempt repair
		for k, v in pairs(badDecks) do
			local deckVar = v
			local fixed = false
			if recall == true then
				--printToAll(deckVar .. ' resetting...',rgbSystem)
				local reset = resetEssentialDeck(deckVar)
				if reset == false or reset == nil then
					--printToAll(deckVar .. ' reset failed...',rgbSystem)
					--printToAll(deckVar .. ' reconstructing...',rgbSystem)
					local reconstructed = reconstructEssentialDeck(deckVar, 'zoneMain')
					if reconstructed == true then
						--printToAll(deckVar .. ' reconstructed. Checksum...',rgbSystem)
						for i=1,60 do
							coroutine.yield(0)
						end
						checkSum = checkSumEssentials(essentialDecks, deckVar)
						if checkSum == true then
							fixed = true
						end
					else
						--printToAll(deckVar .. ' reconstruct failed...',rgbSystem)
					end
				end
			elseif recall == false then
				recallDiscards({deckVar})
				for i=1, 60 do
					coroutine.yield(0)
				end
				checkSum = checkSumEssentials(essentialDecks, deckVar)
				if checkSum == true then
					fixed = true
				end
			end
			if fixed == false then
				--printToAll(deckVar .. ' respawning from archive...',rgbSystem)
				local deck = respawnEssentialDeck(deckVar)
				--printToAll(deckVar .. ' respawned...',rgbSystem)
				fixed = true
			end
			--printToAll(deckVar .. ' final checksum...',rgbSystem)
			checkSum = checkSumEssentials(essentialDecks, deckVar)
			if checkSum == nil or checkSum == false then
				printToAll('Automated debug of Essential Deck ' .. deckVar .. 'failed! Repair manually.', rgbError)
				checkFail = true
			end
		end
		if checkFail == true then
			checkPass = false
		else
			checkPass = true
		end
		if checkPass == true then
			printToAll('Repair successful.',rgbSystem)
		end
	end
	
	coroutine.yield(0)
	
	for k,v in pairs(deckVars) do
		local shuffleDeck = getObjectFromGUID(essentialDecks[v].guid)
		if shuffleDeck then
			shuffleDeck.shuffle()
		end
	end
	debuggingDecks = false

	return checkPass
end


----------------------------------------------------------------
--Features Functions
----------------------------------------------------------------
recallParams = {}

----------------------
--Essential Deck Refresh
----------------------
function onObjectLeaveScriptingZone(zone, object)
	if autoDeckRefresh == true then
		if object.tag == 'Card' and string.find(object.getDescription(), 'drawn') then
			local guid = zone.getGUID()
			if guid == zones.deckVermin.guid or guid == zones.deckStrangeResources.guid or guid == zones.deckBasicResources.guid or guid == zones.deckSevereInjuries.guid or guid == zones.deckDisorders.guid or guid == zones.deckAbilities.guid or guid == zones.deckFightingArts.guid or guid == zones.deckSecretFightingArts.guid then
				local discard = ''
				local desc = object.getDescription()
				if string.find(desc, 'vermin') then
					discard = 'discardVermin'
				elseif string.find(desc, 'strange') then
					discard = 'discardStrangeResources'
				elseif string.find(desc, 'basic') and string.find(desc, 'resource') then
					discard = 'discardBasicResources'
				elseif string.find(desc, 'injury') then
					discard = 'discardSevereInjuries'
				elseif string.find(desc, 'disorder') then
					discard = 'discardDisorders'
				elseif string.find(desc, 'ability') then
					discard = 'discardAbilities'
				elseif string.find(desc, 'fighting art') and string.find(desc, 'secret') then
					discard = 'discardSecretFightingArts'
				elseif string.find(desc, 'fighting art') then
					discard = 'discardFightingArts'
				end
				local deck = ''
				for k, v in pairs(zones) do
					if guid == v.guid then
						deck = tostring(k)
					end
				end
				deck = string.gsub(deck, 'deck', 'discard')
				if deck != '' and discard != '' then
					if deck == discard then
						local discardPos = {}
						discardPos = getObjectFromGUID(placeholders[discard].guid).getPosition()
						local params = {}
						params.position = {discardPos[1], discardPos[2] + 2, discardPos[3]}
						object.clone(params)
						local token = getObjectFromGUID(deckTokens[discard].guid)
						local rot = token.getRotation().z
						if rot < 170 or rot > 350 then
							table.insert(recallParams, {discard})
							startLuaCoroutine(Global, 'recallAuto')
						end
					end
				end
			end
		end
	end
end

function recallAuto()
	for i = 1, 120 do
		coroutine.yield(0)
	end
	local deck = recallParams[1]
	recallDiscards(deck)
	table.remove(recallParams, 1)
	return 1
end
	
function recallDiscards(deck)
	if autoDeckRefresh == true or debuggingDecks == true then
		local deckString = deck[1]
		local zone = getObjectFromGUID(zones[deckString].guid)
		local result = findDeck(zone)
		if result != nil then
			local obj = result[1]
			deckString = string.gsub(deckString, 'discard', 'deck')
			local params = {}
			local deckPos = getObjectFromGUID(placeholders[deckString].guid).getPosition()
			params.position = {deckPos[1], deckPos[2] + 2, deckPos[3]}
			obj.setPositionSmooth(params.position)
			params.rotation = getObjectFromGUID(placeholders[deckString].guid).getRotation()
			obj.setRotationSmooth(params.rotation)
		end
	end
end

----------------------
--AutoHunt
----------------------

--------launcher
function setupHunt(monsterTable)
	if huntInProgress == false and huntSettingUp == false and autoHunt == true and showdownInProgress == false and showdownSettingUp == false then
		if monsterTable != nil then
			currentQuarryTable = monsterTable
		end
		if currentQuarryTable.huntCardPlacement == nil or currentQuarryTable.huntLocation == nil then
			printToAll(currentQuarryTable.monster .. ' cannot be hunted. ' .. currentQuarryTable.monster .. ' hunts you!', rgbError )
			currentQuarryTable = nil
		else
			if showdownSettingUp == true or showdownCleaning == true then
				if huntSetupPending != true then
					huntSetupPending = true
					startLuaCoroutine(Global, 'huntStandbyCoroutine')
				end
			else
				huntSettingUp = true
				if monsterResourcePlaced == true then
					local zone = getObjectFromGUID(zones.zoneMain.guid)
					cleanup('tag', zone, {conditional = 'and', criteria = {'monster', 'resource'}, exclude = {}})
					monsterResourcePlaced = false
				end
				startLuaCoroutine(Global,'setupHuntCoroutine')
			end
		end
	elseif huntInProgress == true or huntSettingUp == true then
			printToAll('A Hunt is already in progress!',rgbError)
	elseif showdownInProgress == true or showdownSettingUp == true then
			printToAll('A Showdown is already in progress!',rgbError)
	end
end

function huntStandbyCoroutine()
	while showdownSettingUp == true do
		coroutine.yield(0)
	end
	while showdownCleaning == true do
		coroutine.yield(0)
	end
	for i=1, 30 do
		coroutine.yield(0)
	end
	huntSetupPending = false
	setupHunt()
	return 1
end


-----------coroutine
function setupHuntCoroutine()
	local huntTable = currentQuarryTable
	local monster = huntTable.monster

	printToAll(messages.msgSettingUpHunt1 .. monster .. messages.msgSettingUpHunt2, rgbNarrator)

	--find components to spawn
	local container = gameBox
	local componentsToGet = {
		deckMonsterHunt = {monster, 'Hunt Events Deck', 'matches'},
		deckMonsterResources = {monster, 'Resources Deck', 'matches'},
		deckMonsterSpecialHunt = {monster, 'Special Hunt Events Deck', 'matches'},
	}
	local result = {}
	local result2 = {}
	for k,v in pairs(componentsToGet) do
		result[k] = getObj('name', container, {conditional = v[3], criteria = {v[1] .. ' ' .. v[2]}, exclude = {}})
		if result[k] != nil then
			for j, h in pairs(result) do
				result2[k] = h[1]
			end
		else
			if k == 'deckMonsterSpecialHunt' or k == 'deckMonsterResources' then
			else
				printToAll(v[1] .. ' ' .. v[2] .. ' is missing from the Box under the table. Manually replace deck in the Box.', rgbError )
				cancelHuntSetup = true
			end
		end
	end

	--spawn components
	if cancelHuntSetup == false then
		local objects = {}
		local objects = spawnFromBox(result2, nil)
		local decks = {}
		for k,v in pairs(objects) do

			if v.tag == 'Deck' then
				decks[k] = v
			end
		end
		for k, v in pairs(decks) do
			v.shuffle()
		end
		--wait for cards to settle
		for i=1,30,1 do
			coroutine.yield(0)
		end
		monsterResourcePlaced = true


		--check essential decks
		debuggingDecks = true
		local essential = {'deckBasicHunt','deckSpecialHunt'}
		local checkPass = debugEssentialDecks(essential, true)
		while debuggingDecks == true do
			coroutine.yield(0)
		end
		if checkPass != true then
			cancelHuntSetup = true
		end

		--reset loot decks
		debuggingDecks = true
		local lootDecks = {'deckBasicResources','deckStrangeResources','deckVermin'}
		checkPass = debugEssentialDecks(lootDecks, false)
		while debuggingDecks == true do
			coroutine.yield(0)
		end
		
		
		--set positions for hunt cards
		getHuntPositions()

		--set params
		local params = {}
		params.rotation = {}
		params.position = {}

		if cancelHuntSetup == false then
			--determine cards to which location and deal cards to hunt board
			local huntSpace = huntTable.huntCardPlacement
			local basicHuntDeck = getObjectFromGUID(essentialDecks.deckBasicHunt.guid)
			for i=1,#huntSpace do
				params.position = huntPos[i]
				params.rotation = huntRot[i]
				if huntSpace[i] == 'E' then
					decks.deckMonsterHunt.takeObject(params)
				elseif huntSpace[i] == 'S' then
					decks.deckMonsterSpecialHunt.takeObject(params)
				elseif huntSpace[i] == '' then
					basicHuntDeck.takeObject(params)
				end
				coroutine.yield(0)
			end

			--wait for cards to settle
			for i=1,120,1 do
				coroutine.yield(0)
			end
			placeHuntMonster()

			setupHuntClose(monster)
		else
			printToAll('Hunt setup is cancelling due to critical error.',rgbError)
			huntSettingUp = false
			huntInProgress = true
			cleanupHunt()
			cancelHuntSetup = false
		end
	else
		printToAll('Hunt setup is cancelling due to critical error.',rgbError)
		huntSettingUp = false
		huntInProgress = true
		cleanupHunt()
		cancelHuntSetup = false
	end
	return 1
end

function getHuntPositions()
	--set positions for hunt cards
	huntPos = {}
	huntRot = {}
	local offset = {}
	local scale = boardHunt.getScale()
	scale = offsetScaleHuntBoard / scale.x
	offset = offsetXHuntCards
	--translate offsets by any scale changes
	local offsetScaled = {}
	for i=1, #offset do
		offsetScaled[i] = offset[i] * scale
	end
	local origin = {}
	origin = boardHunt.getPosition()

	--translate offsets with trig and set positions
	for i=1, #offsetScaled do
		local offsetTrig = {}
		offsetTrig[i] = trig(boardHunt,offset[i])
		huntPos[i] = {origin.x + offsetTrig[i][1], origin.y + offsetTrig[i][2] + 1, origin.z + offsetTrig[i][3]}
	end
	for i=1, 13 do
		huntRot[i] = {boardHunt.getRotation().x, boardHunt.getRotation().y, boardHunt.getRotation().z + 180}
	end
end


---------------place monster by level
function placeHuntMonster()
	local monster = currentQuarryTable.monster
	local placedMonster = ''
	if monsterFigurinePlaced != nil or huntMonsterFigurine != nil then
		placedMonster = monsterFigurinePlaced
		if placedMonster != monster or huntMonsterFigurine == nil then
			--clear other monster figurines
			local zone = getObjectFromGUID(zones.zoneMain.guid)
			cleanup('tag', zone, {conditional = 'and', criteria = {'monster', 'showdown','figurine'}, exclude = {}})
			monsterFigurinePlaced = nil
		end
	end
	--place monster
	if monsterFigurinePlaced == nil then
		local huntTable = currentQuarryTable
		local level = currentHuntLevel
		local location = huntTable.huntLocation
		local space = location[level]
		getHuntPositions()
		local params = {}
		params.position = huntPos[space]
		params.rotation = {boardHunt.getRotation().x, boardHunt.getRotation().y + 90, boardHunt.getRotation().z}
		local figurineGUID = getObj('name', gameBox, {conditional = "matches", criteria = {monster}, exclude = {}})
		if figurineGUID == nil then
			printToAll('The ' .. monster .. ' Figurine was not found in the box!', rgbError)
		else
			local figureTable = spawnFromBox(figurineGUID, params)
			huntMonsterFigurine = figureTable[1]
			monsterFigurinePlaced = monster
		end
	end
end

-------------------change hunt level
function changeHuntLevel(level)
	local unconvertedLevel = level[1]
	local num = string.gsub(unconvertedLevel,'lvl','')
	currentHuntLevel = tonumber(num)
	--update monster position
	getHuntPositions()
	if huntMonsterFigurine != nil and huntPos != nil and huntInProgress == true then
		local huntTable = currentQuarryTable
		local space = huntTable.huntLocation[currentHuntLevel]
		local pos = huntPos[space]
		huntMonsterFigurine.setPositionSmooth({pos[1], pos[2] + 2, pos[3]})
	end
end


---------------------closing fcn for hunt setup
function setupHuntClose(monster)
	huntInProgress = true
	huntSettingUp = false
	printToAll(messages.msgHuntIsSetup1 .. monster .. messages.msgHuntIsSetup2,rgbNarrator)
end

-------------------clean up hunt
function cleanupHunt()
	if huntSettingUp == false and huntInProgress == true and huntCleaning == false and huntCleanPending == false then
		huntCleaning = true
		startLuaCoroutine(Global,'cleanupHuntCoroutine')
	elseif huntSettingUp == true and huntCleaning == false and huntCleanPending == false then
		huntCleanPending = true
		startLuaCoroutine(Global,'cleanupHuntCoroutineStandby')
	end
end

function cleanupHuntCoroutineStandby()
	while huntSettingUp == true do
		coroutine.yield(0)
	end
	for i=1,30 do
		coroutine.yield(0)
	end
	huntCleanPending = false
	startLuaCoroutine(Global,'cleanupHuntCoroutine')
	return 1
end

function cleanupHuntCoroutine()
	--clear components
	local zone = getObjectFromGUID(zones.zoneHunt.guid)
	cleanup('tag', zone, {conditional = 'and', criteria = {'monster', 'hunt'}, exclude = {'resource'}})

	--reset essential decks
	--reset basic hunt deck
	local deck = 'deckBasicHunt'
	resetEssentialDeck(deck)
	deck = 'deckSpecialHunt'
	resetEssentialDeck(deck)
	for i=1,30 do
		coroutine.yield(0)
	end
	local decks = {'deckBasicHunt', 'deckSpecialHunt'}
	debugEssentialDecks(decks)

	--wait for cards to settle
	for i=1,30 do
		coroutine.yield(0)
	end
	huntInProgress = false
	huntSettingUp = false
	printToAll(huntCleared,rgbNarrator)
	huntCleaning = false
	return 1
end


----------------------
--AutoShowdown
----------------------

--------launcher
function setupShowdown(monsterTable)
	if showdownInProgress == false and showdownSettingUp == false and showdownCleaning == false and autoShowdown == true then
		if monsterTable != nil then
			currentShowdownTable = monsterTable
		end
		if huntSettingUp == true or huntCleaning == true then
			if showdownSetupPending != true then
				showdownSetupPending = true
				startLuaCoroutine(Global, 'showdownStandbyCoroutine')
			end
		else
			showdownSettingUp = true
			if monsterResourcePlaced == true then
				if currentQuarryTable.monster != nil then
					if currentShowdownTable.monster != currentQuarryTable.monster then
						local zone = getObjectFromGUID(zones.zoneMain.guid)
						local criteriaParam = currentQuarryTable.monster .. ' Resources Deck'
						cleanup('name', zone, {conditional = 'matches', criteria = {criteriaParam}, exclude = {}})
						monsterResourcePlaced = false
					end
				end
			end
			startLuaCoroutine(Global,'setupShowdownCoroutine')
		end
	elseif showdownInProgress == true or showdownSettingUp == true then
		printToAll('The survivors are already in a fight!',rgbError)
	end
end

function showdownStandbyCoroutine()
	while huntSettingUp == true do
		coroutine.yield(0)
	end
	while huntCleanPending == true do
		coroutine.yield(0)
	end
	while huntCleaning == true do
		coroutine.yield(0)
	end
	for i=1, 30 do
		coroutine.yield(0)
	end
	showdownSetupPending = false
	setupShowdown()
	return 1
end

-----------coroutine
function setupShowdownCoroutine()
	local showdownTable = currentShowdownTable
	local monster = showdownTable.monster

	printToAll(messages.msgSettingUpShowdown1 .. monster .. messages.msgSettingUpShowdown2, rgbNarrator)

	--find components to spawn
	local container = gameBox
	local componentsToGet = {
		cardMonsterBasicAction = {monster, 'Basic Action Card', 'matches'},
		deckMonsterHitLocations = {monster, 'Hit Locations Deck', 'matches'},
		deckMonsterAIBasic = {monster, 'Basic AI Deck', 'matches'},
		deckMonsterAIAdvanced = {monster, 'Advanced AI Deck', 'matches'},
		deckMonsterAILegendary = {monster, 'Legendary AI Deck', 'matches'},
		deckMonsterAISpecial = {monster, 'Special AI Deck', 'matches'},
	}
	local huntMonster = ''
	if currentQuarryTable != nil then
		huntMonster = currentQuarryTable.monster
	end
	if monsterResourcePlaced == false then
		componentsToGet.deckMonsterResources = {monster, 'Resources Deck', 'matches'}
	elseif monster != huntMonster then
		--clear old monster Resources
		local zone = getObjectFromGUID(zones.zoneMain.guid)
		cleanup('tag', zone, {conditional = 'and', criteria = {'monster', 'resource'}, exclude = {'drawn'}})
		coroutine.yield(0)
		componentsToGet.deckMonsterResources = {monster, 'Resources Deck', 'matches'}
	end
	local result = {}
	local result2 = {}
	for k,v in pairs(componentsToGet) do
		result[k] = getObj('name', container, {conditional = v[3], criteria = {v[1] .. ' ' .. v[2]}, exclude = {}})
		if result[k] != nil then
			for j, h in pairs(result) do
				result2[k] = h[1]
			end
		else
			if k == 'deckMonsterAIAdvanced' or k == 'deckMonsterAISpecial' or k == 'deckMonsterAILegendary' or k == 'deckMonsterAISpecial' or k == 'deckMonsterResources' then
			else
				printToAll(v[1] .. ' ' .. v[2] .. ' is missing from the Box under the table. Manually replace deck in the Box.', rgbError )
				cancelShowdownSetup = true
			end
		end
	end

	--spawn components
	if cancelShowdownSetup == false then
		local objects = {}
		local objects = spawnFromBox(result2, nil)
		local decks = {}
		for k,v in pairs(objects) do
			if v.tag == 'Deck' then
				decks[k] = v
			end
			if string.find(string.lower(v.getDescription()), string.lower('resource')) then
				monsterResourcePlaced = true
			end
		end
		for i=1,30 do
			coroutine.yield(0)
		end
		for k, v in pairs(decks) do
			v.shuffle()
		end

		--spawn monster
		placeShowdownMonster()

		coroutine.yield(0)

		--spawn terrain
		generateShowdownTerrain()

		--wait for cards to settle
		for i=1,120,1 do
			coroutine.yield(0)
		end

		setupShowdownClose(monster)
	else
		printToAll('Showdown setup is cancelling due to critical error.',rgbError)
		showdownSettingUp = false
		showdownInProgress = true
		cleanupShowdown()
	end
	return 1
end

function placeShowdownMonster()
	local huntMonster = ''
	if currentQuarryTable != nil then
		huntMonster = currentQuarryTable.monster
	end
	local showdownMonster = currentShowdownTable.monster
	local params = {}
	params.position = {0,2,1.5}
	params.rotation = {0,180,0}
	if  showdownMonster == huntMonster and huntMonsterFigurine != nil then
		--move hunt figurine to showdown
		huntMonsterFigurine.setPositionSmooth(params.position)
		huntMonsterFigurine.setRotationSmooth(params.rotation)
	else
		--clear other monster figurines
		local zone = getObjectFromGUID(zones.zoneMain.guid)
		cleanup('tag', zone, {conditional = 'and', criteria = {'monster', 'showdown','figurine'}, exclude = {}})
		monsterFigurinePlaced = nil
		--spawn new figurine
		local figurineGUID = getObj('name', gameBox, {conditional = "matches", criteria = {showdownMonster}, exclude = {}})
		if figurineGUID == nil then
			printToAll('The ' .. monster .. ' Figurine was not found in the box!', rgbError)
		else
			local figureTable = spawnFromBox(figurineGUID, params)
			showdownMonsterFigurine = figureTable[1]
			monsterFigurinePlaced = showdownMonster
		end
	end
end

function generateShowdownTerrain()
	local cancelTerrainSetup = false
	--get card counts by type
	local inputTable = currentShowdownTable.showdownTerrain.specifiedCards
	local specifiedCards = {}
	if inputTable != nil then
		for k,v in pairs (inputTable) do
			local prefix = string.sub(v,1,2)
			local cardName = string.gsub(v,prefix,'')
			local string = string.gsub(prefix, ' ', '')
			local integer = tonumber(string)
			specifiedCards[cardName] = integer
		end
		--check terrain deck
		local decks = {'deckTerrain'}
		debugEssentialDecks(decks)
		--get cards to take
		local cardsToTake = {}
		local tilesToGet = {}
		local num = 1
		local deck = getObjectFromGUID(essentialDecks.deckTerrain.guid)
		for k, v in pairs (specifiedCards) do
			local count = 1
			local maxCount = v
			local result = {}
			local keyLabel = ''
			result[k] = getObj('name', deck, {conditional = 'matches', criteria = {k},exclude = {}})
			if result[k] != nil then
				local result2 = {}
				for i=1, #result[k] do
					if count <=maxCount then
						result2[i] = result[k][i]
						local var = 'cardTerrain' .. tostring(num)
						num = num + 1
						count = count + 1
						cardsToTake[var] = result2[i]
						tilesToGet[var] = k
					end
				end
			else
				printToAll(k .. ' is missing from the Terrain Deck. Manually setup Terrain.', rgbError)
				cancelTerrainSetup = true
			end
		end

		if cancelTerrainSetup == false then
			--take cards
			local cardsTaken = {}
			local params = {}
			local origin = deck.getPosition()
			local offset = 3.6
			local offsetTotal = offset
			local offsets = {}
			local offsetTrig = {}
			local cardPos = {}
			for i=1, 6 do
				offsets[i] = offsetTotal
				offsetTotal = offsetTotal + offset
				offsetTrig[i] = trig(deck, offsets[i])
				cardPos[i] = {origin.x - offsetTrig[i][3], origin.y - offsetTrig[i][2], origin.z - offsetTrig[i][1]}
			end
			local rot = deck.getRotation()
			local pos = {}
			local posNum = 0
			for k, v in pairs (cardsToTake) do
				params.rotation = {rot[1], rot[2], 0}
				posNum = string.match(k, "%d")
				posNum = tonumber(posNum)
				pos = cardPos[posNum]
				params.position = {pos[1], pos[2] + 2, pos[3]}
				params.guid = v
				cardsTaken[k] = deck.takeObject(params)

				for i = 1, 30 do
					coroutine.yield(0)
				end
			end

			deck.shuffle()

			for i=1,30 do
				coroutine.yield(0)
			end

			--spawn random cards
			local randomCount = currentShowdownTable.showdownTerrain.randomCards
			params = {}
			params.rotation = {rot[1], rot[2], 0}
			for i=1, randomCount do
				posNum = num
				num = num + 1
				posNum = tonumber(posNum)
				pos = cardPos[posNum]
				params.position = {pos[1], pos[2] + 2, pos[3]}
				cardsTaken[posNum] = deck.takeObject(params)
			end

				--[[ inactive
			--get tiles
			local tilesToTake = {}
			for k,v in pairs (tilesToGet) do
				local result = {}
				result = getObj('name', getObjectFromGUID(staticObjs.gameBox.guid), {conditional = 'matches', criteria = {v}, exclude = {}})
				if result[1] != nil then

					tilesToTake[k] = result[1]

				--]]

		end
	end
end

---------------------closing fcn for showdown setup
function setupShowdownClose(monster)
	showdownInProgress = true
	showdownSettingUp = false
	printToAll(messages.msgShowdownIsSetup,rgbNarrator)
end

---------------------level change for showdown monster
function changeShowdownLevel(level)
	local unconvertedLevel = level[1]
	--update monster stats
	if showdownInProgress == true then
		local showdownTable = currentShowdownTable
		local stats = {}
		local stats = showdownTable.showdownStats[unconvertedLevel]
		if stats != nil then
			local board = getObjectFromGUID(boards.boardMonster.guid)
			board.setTable('transferStats', stats)
			board.call('transfer', nil)
		end
	end
end

-------------------clean up showdown
function cleanupShowdown()
	if showdownSettingUp == false and showdownInProgress == true and showdownCleanPending == false and showdownCleaning == false then
		showdownCleaning = true
		startLuaCoroutine(Global,'cleanupShowdownCoroutine')
	elseif showdownSettingUp == true and showdownCleaning == false and showdownCleanPending == false then
		showdownCleanPending = true
		startLuaCoroutine(Global,'cleanupShowdownCoroutineStandby')
	end
end

function cleanupShowdownCoroutineStandby()
	while showdownSettingUp == true do
		coroutine.yield(0)
	end
	showdownCleanPending = false
	startLuaCoroutine(Global,'cleanupShowdownCoroutine')
	return 1
end

function cleanupShowdownCoroutine()
	--clear components
	local zone = getObjectFromGUID(zones.zoneMain.guid)
	cleanup('tag', zone, {conditional = 'and', criteria = {'terrain tile'}, exclude = {}})
	cleanup('tag', zone, {conditional = 'and', criteria = {'monster', 'showdown'}, exclude = {'drawn'}})
	--newly created decks
	local zone = getObjectFromGUID(zones.zoneMonsterBoard.guid)
	cleanup('name', zone, {conditional = 'and', criteria = {''}, exclude = {"."}})
	local objs = zone.getObjects()
	for k, v in pairs(objs) do
		if v.tag == 'Deck' or string.find(v.getName(),'Token') then
			v.destruct()
		end
	end
	
	--reset terrain deck
	local deck = 'deckTerrain'
	resetEssentialDeck(deck)
	for i=1, 30 do
		coroutine.yield(0)
	end
	local decks = {deck}
	debugEssentialDecks(decks)

	local board = getObjectFromGUID(boards.boardMonster.guid)
	board.call('clear', nil)
	
	

	for i=1, 60 do
		coroutine.yield(0)
	end

	monsterFigurinePlaced = nil
	monsterResourcePlaced = false
	showdownInProgress = false
	showdownSettingUp = false
	currentQuarryTable = {'null'}
	currentShowdownTable = {'null'}
	printToAll(messages.msgShowdownCleared,rgbNarrator)
	showdownCleaning = false
	return 1
end