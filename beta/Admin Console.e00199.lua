--------------------
--KDM Admin Console
-------------------

-------------------
--Variables
------------------

-------------------
--Init
--------------------
function onLoad()

	local label = {}
	if Global.getVar('autoHunt') == false then
		label.huntLabel = 'Auto-Hunt is OFF'
	elseif Global.getVar('autoHunt') == true then
		label.huntLabel = 'Auto-Hunt is ON'
	end
	if Global.getVar('autoShowdown') == false then
		label.showdownLabel = 'Auto-Showdown is OFF'
	elseif Global.getVar('autoShowdown') == true then
		label.showdownLabel = 'Auto-Showdown is ON'
	end
	if Global.getVar('devMode') == true then
		label.devLabel = 'Dev Mode is ON'
	elseif Global.getVar('devMode') == false then
		label.devLabel = 'Dev Mode is OFF'
	end
	if Global.getVar('autoDeckRefresh') == true then
		label.deckRefreshLabel = 'Deck Refresh is ON'
	elseif Global.getVar('autoDeckRefresh') == false then
		label.deckRefreshLabel = 'Deck Refresh is OFF'
	end
	if Global.getVar('autoMonsterDeck') == true then
		label.monsterDeckLabel = 'Showdown Deckbuilder (INACTIVE)'
	elseif Global.getVar('autoMonsterDeck') == false then
		label.monsterDeckLabel = 'Showdown Deckbuilder (INACTIVE)'
	end


	--reset saved data
	self.createButton({
		click_function = 'clearSavedData',
		function_owner = self,
		label = 'Reset Script Variables',
		position = {4,1,-1},
		rotation = {0,0,0},
		width = 3000,
		height = 400,
		font_size = 200
	})
	--dev mode(unlock statics)
	self.createButton({
		click_function = 'devModeToggle',
		function_owner = self,
		label = label.devLabel,
		position = {4,1,-3},
		rotation = {0,0,0},
		width = 3000,
		height = 400,
		font_size = 200
	})
	--auto hunt
	self.createButton({
		click_function = 'autoHuntToggle',
		function_owner = self,
		label = label.huntLabel,
		position = {-4,1,-5},
		rotation = {0,0,0},
		width = 3000,
		height = 400,
		font_size = 200
	})
	--auto showdown
	self.createButton({
		click_function = 'autoShowdownToggle',
		function_owner = self,
		label = label.showdownLabel,
		position = {-4,1,-3},
		rotation = {0,0,0},
		width = 3000,
		height = 400,
		font_size = 200
	})
	--auto showdown deck build (inactive)
	self.createButton({
		click_function = 'autoShowdownDeckBuildToggle',
		function_owner = self,
		label = label.monsterDeckLabel,
		position = {-4,1,-1},
		rotation = {0,0,0},
		width = 3000,
		height = 400,
		font_size = 200
	})
	--auto deck refresh (inactive)
	self.createButton({
		click_function = 'autoDeckRefreshToggle',
		function_owner = self,
		label = label.deckRefreshLabel,
		position = {-4,1,1},
		rotation = {0,0,0},
		width = 3000,
		height = 400,
		font_size = 200
	})
	--hide
	self.createButton({
		click_function = 'hideConsole',
		function_owner = self,
		label = 'Hide Console',
		position = {4,1,-5},
		rotation = {0,0,0},
		width = 3000,
		height = 400,
		font_size = 200
	})

end

--------------------
--Fcns
--------------------


function updateLabels()
	local buttonList = {}
	buttonList = self.getButtons()
	btns = {}
	for k,v in pairs(buttonList) do
		local index = v.index
		local key = v.click_function
		btns[key] = index
	end

	params = {}
	if Global.getVar('autoHunt') == false then
		params.index = btns.autoHuntToggle
		params.label = 'Auto-Hunt is OFF'
		self.editButton(params)
	elseif Global.getVar('autoHunt') == true then
		params.index = btns.autoHuntToggle
		params.label = 'Auto-Hunt is ON'
		self.editButton(params)
	end
	if Global.getVar('autoShowdown') == false then
		params.index = btns.autoShowdownToggle
		params.label = 'Auto-Showdown is OFF'
		self.editButton(params)
	elseif Global.getVar('autoShowdown') == true then
		params.index = btns.autoShowdownToggle
		params.label = 'Auto-Showdown is ON'
		self.editButton(params)
	end
	if Global.getVar('devMode') == true then
		params.index = btns.devModeToggle
		params.label = 'Dev Mode is ON'
		self.editButton(params)
	elseif Global.getVar('devMode') == false then
		params.index = btns.devModeToggle
		params.label = 'Dev Mode is OFF'
		self.editButton(params)
	end
	if Global.getVar('autoDeckRefresh') == true then
		params.index = btns.autoDeckRefreshToggle
		params.label = 'Deck Refresh is ON'
		self.editButton(params)
	elseif Global.getVar('autoDeckRefresh') == false then
		params.index = btns.autoDeckRefreshToggle
		params.label = 'Deck Refresh is OFF'
		self.editButton(params)
	end
	if Global.getVar('autoMonsterDeck') == true then
		params.index = btns.autoShowdownDeckBuildToggle
		params.label = 'Showdown Deckbuilder (INACTIVE)'
		self.editButton(params)
	elseif Global.getVar('autoMonsterDeck') == false then
		params.index = btns.autoShowdownDeckBuildToggle
		params.label = 'Showdown Deckbuilder (INACTIVE)'
		self.editButton(params)
	end
end

function clearSavedData()
	Global.setVar('clearSavedData', true)
	printToAll('Saved scripted variables have been cleared.',{0,0.8,0})
	printToAll('IMPORTANT, Manually delete any remaining hunt/showdown components that would normally be cleaned up or you may trigger errors in future auto setups.',{0.8,0,0})
	printToAll('Save and reload the game to complete variable reset.',{0,0.8,0})
end

function autoHuntToggle()
	Global.call('toggleAutoHunt')
	updateLabels()
end

function autoShowdownToggle()
	Global.call('toggleAutoShowdown')
	updateLabels()
end

function autoShowdownDeckBuildToggle()
	printToAll('Feature is not implemented.',{0.8,0,0})
	Global.call('toggleAutoMonsterDeck')
	updateLabels()
end

function autoDeckRefreshToggle()
	Global.call('toggleAutoDeckRefresh')
	updateLabels()
end

function devModeToggle()
	Global.call('toggleDevMode')
	updateLabels()
end

function hideConsole()
	local params = {50,5,-200}
	self.setPosition(params)
	self.interactable = false
	self.setRotation({0,180,180})
end

function showConsole()
end