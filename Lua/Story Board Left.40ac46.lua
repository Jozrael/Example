--KDM Storybook

---------------------------------
--Vars
--------------------------------
manualsIndex = {
	tab1 = {
		tabName = 'Rules', 
		pages = {
			{pageName = 'Introduction', stateNum = 2},
			{pageName = 'Prologue', stateNum = 5},
			{pageName = 'First Story', stateNum = 23},
			{pageName = 'Survival Guide', stateNum = 36},
			{pageName = 'Survivors', stateNum = 40},
			{pageName = 'Monsters', stateNum = 48},
			{pageName = 'Resources', stateNum = 56},
			{pageName = 'Terrain', stateNum = 59},
			{pageName = 'Hunt Phase', stateNum = 61},
			{pageName = 'Showdown Phase', stateNum = 65},
			{pageName = 'Settlement Phase', stateNum = 79},
			{pageName = 'Game Variants', stateNum = 85},
			{pageName = 'Glossary', stateNum = 87},
		}
	},
	tab2 = {
		tabName = 'Timeline Events', 
		pages = {
			{pageName = 'Returning Survivors', stateNum = 2},
			{pageName = 'Endless Screams', stateNum = 4},
			{pageName = 'Bone Witch', stateNum = 6},
			{pageName = 'Hands of Heat', stateNum = 8},
			{pageName = 'Armored Strangers', stateNum = 10},
			{pageName = 'Phoenix Feather', stateNum = 12},
			{pageName = 'Regal Visit', stateNum = 14},
			{pageName = 'Principle: Conviction', stateNum = 16},
			{pageName = 'Watched', stateNum = 18},
		}
	},
	tab3 = {
		tabName = 'Hunt Events', 
		pages = {
			{pageName = 'Random Events 1-8', stateNum = 2},
			{pageName = 'Random Events 9-15', stateNum = 3},
			{pageName = 'Random Events 16-25', stateNum = 4},
			{pageName = 'Random Events 26-31', stateNum = 5},
			{pageName = 'Random Events 32-44', stateNum = 6},
			{pageName = 'Random Events 45-53', stateNum = 7},
			{pageName = 'Random Events 54-63', stateNum = 8},
			{pageName = 'Random Events 64-71', stateNum = 9},
			{pageName = 'Random Events 72-80', stateNum = 10},
			{pageName = 'Random Events 81-87', stateNum = 11},
			{pageName = 'Random Events 88-96', stateNum = 12},
			{pageName = 'Random Events 97-100', stateNum = 13},
			{pageName = 'Overwhelming Darkness', stateNum = 14},
			{pageName = 'Herb Gathering', stateNum = 16},
			{pageName = 'Mineral Gathering', stateNum = 18},
			{pageName = 'Run Away', stateNum = 20},
		}
	},
	tab4 = {
		tabName = 'Showdown Setups', 
		pages = {
			{pageName = 'White Lion', stateNum = 2},
			{pageName = 'Screaming Antelope', stateNum = 4},
			{pageName = 'Phoenix', stateNum = 6},
			{pageName = 'Nemesis: Butcher', stateNum = 8},
			{pageName = "Nemesis: King's Man", stateNum = 10},
			{pageName = 'Nemesis: The Hand', stateNum = 12},
			{pageName = 'Nemesis: Watcher', stateNum = 14},
			{pageName = 'Legendary Monsters', stateNum = 16},
		}
	},
	tab5 = {
		tabName = 'Settlement Events', 
		pages = {
			{pageName = 'Intimacy', stateNum = 2},
			{pageName = 'Birth of a Savior', stateNum = 4},
			{pageName = 'Cooking', stateNum = 6},
			{pageName = 'White Speaker', stateNum = 8},
		}
	},
	tab6 = {
		tabName = 'Milestone Events', 
		pages = {
			{pageName = 'Age', stateNum = 2},
			{pageName = 'Bold', stateNum = 4},
			{pageName = 'Insight', stateNum = 6},
			{pageName = 'See the Truth', stateNum = 8},
			{pageName = 'White Secret', stateNum = 10},
			{pageName = 'Principle: New Life', stateNum = 12},
			{pageName = 'Principle: Death', stateNum = 14},
			{pageName = 'Principle: Society', stateNum = 16},
			{pageName = 'Hooded Knight', stateNum = 18},
			{pageName = 'Game Over', stateNum = 20},
		}
	},
	tab7 = {
		tabName = 'Severe Injuries', 
		pages = {
			{pageName = 'Brain Trauma', stateNum = 2},
			{pageName = 'Head, Arms', stateNum = 3},
			{pageName = 'Body, Waist, Legs', stateNum = 4},
		}
	},
	tab8 = {
		tabName = 'Monster Events', 
		pages = {
			{pageName = 'Zero Presence', stateNum = 2},
			{pageName = 'Crush and Devour', stateNum = 4},
			{pageName = 'Legendary Lungs', stateNum = 6},
			{pageName = "King's Step", stateNum = 8},
			{pageName = "King's Curse", stateNum = 10},
			{pageName = 'Run Away', stateNum = 12},
			{pageName = 'Blackout', stateNum = 14},
		}
	},
}
gameBoxGUID = ''
zoneSelfGUID = ''

activeBook = {}
changingBook = false
currentPage = 1

cloneSpawnPos = {0,0,-80}

---------------------------------
--Init
--------------------------------


function onLoad()

	local table = Global.getTable('staticObjs')
	gameBoxGUID = table.gameBox.guid
	table = Global.getTable('zones')
	zoneSelfGUID = table.zoneStoryL.guid
	
	initTabButtons()
	initBrowseButtons()

end

function initTabButtons()
	local index = manualsIndex
	local col = 4
	local row = 2
	local dx = ( 24 / col / 2 ) - 12
	local dy = 8.5
	local w = (12000 / col) - (col * 25)
	local px = 24/ col
	local py = -1.25
	local i = 1
	local h = 600
	local f = 350
	for k,v in pairs(index) do
		local func = k
		local label = v.tabName
		self.createButton({
			click_function = func,
			function_owner = self,
			label = label,
			position = {dy,0.14,dx},
			rotation = {0,90,0},
			width = w,
			height = h,
			font_size = f
		})
		if i < col or i > col then
			dx = dx + px
		elseif i == col then
			dx = dx - (px*(col-1))
			dy = dy + py
		else
			dx = dx
		end
		i = i+1
	end
end

function initBrowseButtons()
	self.createButton({
		click_function = 'nextPage',
		function_owner = self,
		label = '>',
		position = {-8.5,0.14,-1.5},
		rotation = {0,90,0},
		width = 1400,
		height = 600,
		font_size = 350
	})
	self.createButton({
		click_function = 'previousPage',
		function_owner = self,
		label = '<',
		position = {-8.5,0.14,-4.5},
		rotation = {0,90,0},
		width = 1400,
		height = 600,
		font_size = 350
	})
end


---------------------------------
--Events
--------------------------------

function onDropped()
	local zone = getObjectFromGUID(zoneSelfGUID)
	local pos = self.getPosition()
	zone.setPosition(pos)
end

---------------------------------
--Button fnc
--------------------------------

function nextPage()
	local zoneSelf = getObjectFromGUID(zoneSelfGUID)
	local objects = zoneSelf.getObjects()
	for k,v in pairs(objects) do
		if string.find(v.getDescription(), 'reference') then
			local obj = v.setState(currentPage + 1)
			if obj != nil then
				currentPage = currentPage + 1
			end
		end
	end
end

function previousPage()
	local zoneSelf = getObjectFromGUID(zoneSelfGUID)
	local objects = zoneSelf.getObjects()
	for k,v in pairs(objects) do
		if string.find(v.getDescription(), 'reference') then
			if currentPage != 1 then
				local obj = v.setState(currentPage - 1)
				if obj != nil then
					currentPage = currentPage - 1
				end
			end
		end
	end
end

function tab1()
	local tab = 'tab1'
	tabClick(tab)
end

function tab2()
	local tab = 'tab2'
	tabClick(tab)
end

function tab3()
	local tab = 'tab3'
	tabClick(tab)
end

function tab4()
	local tab = 'tab4'
	tabClick(tab)
end

function tab5()
	local tab = 'tab5'
	tabClick(tab)
end

function tab6()
	local tab = 'tab6'
	tabClick(tab)
end

function tab7()
	local tab = 'tab7'
	tabClick(tab)
end	

function tab8()
	local tab = 'tab8'
	tabClick(tab)
end

---------pages

function page1()
	local page = 1
	pageClick(page)
end

function page2()
	local page = 2
	pageClick(page)
end

function page3()
	local page = 3
	pageClick(page)
end

function page4()
	local page = 4
	pageClick(page)
end

function page5()
	local page = 5
	pageClick(page)
end

function page6()
	local page = 6
	pageClick(page)
end

function page7()
	local page = 7
	pageClick(page)
end	

function page8()
	local page = 8
	pageClick(page)
end

function page9()
	local page = 9
	pageClick(page)
end

function page10()
	local page = 10
	pageClick(page)
end

function page11()
	local page = 11
	pageClick(page)
end

function page12()
	local page = 12
	pageClick(page)
end

function page13()
	local page = 13
	pageClick(page)
end

function page14()
	local page = 14
	pageClick(page)
end

function page15()
	local page = 15
	pageClick(page)
end

function page16()
	local page = 16
	pageClick(page)
end	

----------------------------------------
--primary fcns
---------------------------------------

function tabClick(tab)
	--clear books
	changeBook(tab)
	--clear last tab pages
	local btns = self.getButtons()
	for k,v in pairs(btns) do
		local text = v.click_function
		if string.find(text, 'page') then
			local index = v.index
			self.removeButton(index)
		end
	end
	--create page list
	local pagesTable = manualsIndex[tab].pages
	local col = 1
	local row = #pagesTable
	local dx = 9
	local dy = 5.75
	local w = 2900
	local px = 24/ col
	local py = -0.95
	local i = 1
	local h = 400
	local f = 300
	local btn = {}
	pageBtns = {}
	for k,v in pairs(pagesTable) do
		local func = 'page' .. i
		local label = v.pageName
		local btn = self.createButton({
			click_function = func,
			function_owner = self,
			label = label,
			position = {dy,0.14,dx},
			rotation = {0,90,0},
			width = w,
			height = h,
			font_size = f
		})
		dy = dy + py
		i = i+1
	end
end

function changeBook(tab)
	if changingBook != true then
		changingBook = true
		local calledNameTag = manualsIndex[tab].tabName
		activeBook = calledNameTag
		startLuaCoroutine(self, 'changeBookCoroutine')
	end
end

function changeBookCoroutine()
	local alreadyExists = false
	--clear old books
	local zoneSelf = getObjectFromGUID(zoneSelfGUID)
	local objects = zoneSelf.getObjects()
	for k,v in pairs(objects) do
		if string.find(v.getDescription(), 'reference') then
			if v.getName() != activeBook then
				v.destruct()
			else
				alreadyExists = true
			end
		end
	end
	--spawn new one
	if alreadyExists == false then
		local book = {}
		local gameBox = getObjectFromGUID(gameBoxGUID)
		objects = gameBox.getObjects()
		for k,v in pairs(objects) do
			if v.name == activeBook then
				table.insert(book, v.guid)
			end
		end
		--spawn
		if book[1] != nil then
			local params = {}
			params.guid = book[1]
			local pos = self.getPosition()
			params.position = {pos[1]-3,pos[2] + 2,pos[3]+0.2}
			local rot = self.getRotation()
			params.rotation = {rot[1], rot[2] + 90, rot[3]}
			book = gameBox.takeObject(params)
			currentPage = 1
			coroutine.yield(0)
			--dupe
			params = {}
			params.position = cloneSpawnPos
			local clone = book.clone(params)
			coroutine.yield(0)
			pos = gameBox.getPosition()
			params = {pos[1],pos[2] + 2,pos[3]}
			clone.setPositionSmooth(params)
			coroutine.yield(0)
		end
	end
	changingBook = false
	return 1
end

function pageClick(pageNum)
	local zoneSelf = getObjectFromGUID(zoneSelfGUID)
	local objects = zoneSelf.getObjects()
	local tabTable = {}
	if activeBook != nil then
		for k,v in pairs(manualsIndex) do
			if v.tabName == activeBook then
				tabTable = v
			end
		end
		local state = tabTable.pages[pageNum].stateNum
		for k,v in pairs(objects) do
			if string.find(v.getName(), string.sub(activeBook, 1, 4)) and string.find(v.getDescription(), 'reference') then
				if currentPage != state then
					v.setState(state)
					currentPage = state
				end
			end
		end
	end
end