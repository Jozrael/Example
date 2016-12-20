--KDM Settlement Sheet (Slate v3)
--by Eskander and Curnil
--Script adapted from soulburner's dnd sheets and Mr. Stumps Universal Counter Tokens

-------------------------------------------------------------
--Customizable Buttons EDIT BELOW
-------------------------------------------------------------
function initCustomButtons()
	thick = 0.14
	
	--header
	dx = -0.35; dy = -0.515; px = 0.35
	createCounter('survival_perm', 'count', dx, dy); dx = dx + px;
	createCounter('survivalN_perm', 'count', dx, dy); dx = dx + px;
	createCounter('insanity_perm', 'count', dx, dy); dx = dx + px;
	
	dx = 0; dy = -0.28
	createAddText('other_perm', 'txt', dx, dy)
	
	dx = -0.35; dy = 0.13; px = 0.35
	createCounter('survival_temp', 'count', dx, dy); dx = dx + px;
	createCounter('survivalN_temp', 'count', dx, dy); dx = dx + px;
	createCounter('insanity_temp', 'count', dx, dy); dx = dx + px;
	
	dx = 0; dy = 0.532
	createAddText('other_temp', 'txt', dx, dy)
	
	dx = -0.445; dy = 0.87
	createResetTemps('reset', dx, dy)
end

------------------
--Style Sheet
------------------

function initButtonsTable()

    buttons = {}
    buttons.index = 0
    buttons.counts = {}
    buttons.params = {}
    buttons.params.positions = {}
	buttons.params.rotations = {}
    buttons.params.positions.offsets = {}
    buttons.params.sizes = {}
    buttons.targetFunc = {}

	--make a style of button by adding a new size
    buttons.params.sizes.count = {
        display = {width = 0, height = 0, font = 100},
        button = {width = 40, height = 40, font = 60},
        offsets = { bottomButtons = {x = 0.08, y = 0, z = -0.12}, topButtons = {x = 0.1, y = 0, z = -0.17} }
    }
    buttons.params.sizes.toggle = {
        display = {width = 100, height = 100, font = 200},
        button = {width = 25, height = 25, font = 50},
        offsets = { bottomButtons = {x = 0, y = 0, z = 0}, topButtons = {x = 0, y = 0, z = 0} }
    }
    buttons.params.sizes.txt = {
        display = {width = 0, height = 0, font = 50},
        button = {width = 50, height = 50, font = 75},
        offsets = { bottomButtons = {x = 0.5, y = 0, z = 0}, topButtons = {x = 0, y = 0, z = 0} }
    }
	buttons.params.sizes.std = {
		display = {width = 150, height = 70, font = 50},
		button = {width = 0, height = 0, font = 40},
		offsets = { bottomButtons = {x = 0, y = 0, z = 0}, topButtons = {x = 0, y = 0, z = 0} }
    }
end

----------------------------------------------------
--DO NO EDIT BELOW unless you know what you're doing
--SAVE
----------------------------------------------------

--Saves the count value into a table (data_to_save) then encodes it into the Tabletop save
function onSave()
	local data_to_save = {}
	data_to_save.saved_counts = {}
	for i,v in pairs(buttons.counts) do
		data_to_save.saved_counts[tostring(i)] = v or 0
	end
	saved_data = JSON.encode(data_to_save)

	--Uncomment this line to reset the save data
	--saved_data = ''
	return saved_data
end

----------------------------------------------------
--INIT
----------------------------------------------------


--loads buttons and gets saved data
function onload(saved_data)
    original_rot = {['x'] = 0,['y'] = 180,['z'] = 0}
    initButtonsTable()
    objs = {}
	initCustomButtons()

	--categorize buttons
    for i,v in pairs(buttons) do
        buttons.counts[tostring(i)] = 0
        if tostring(i) != 'index' and tostring(i) != 'counts' and tostring(i) != 'params' and tostring(i) != 'targetFunc' then
            self.setVar(tostring(i) .. 'PlusOne', function () plus(tostring(i), 1) end)
            self.setVar(tostring(i) .. 'MinusOne', function () minus(tostring(i), 1) end)
            self.setVar(tostring(i) .. 'ToggleClick', function () toggleClick(tostring(i)) end)
            self.setVar(tostring(i) .. 'EditClick', function () editclick(tostring(i)) end)
			self.setVar(tostring(i) .. 'AddClick', function () editclick(tostring(i)) end)
			self.setVar(tostring(i) .. 'ResetTemps', function () resetTemps(tostring(i)) end)
        end
    end
    generateButtonParameters()

    --loads saved data if exists
    if saved_data != '' then
        local loaded_data = JSON.decode(saved_data)
        buttons.counts = loaded_data.saved_counts
        for i,v in pairs(buttons) do
            if tostring(i) != 'index' and tostring(i) != 'counts' and tostring(i) != 'params'  and tostring(i) != 'targetFunc' then
                if buttons.counts[tostring(i)] == nil then
                    buttons.counts[tostring(i)] = 0
                end
            end
        end
    else
        for i,v in pairs(buttons) do
            if tostring(i) != 'index' and tostring(i) != 'counts' and tostring(i) != 'params'  and tostring(i) != 'targetFunc' then
                buttons.counts[tostring(i)] = 0
            end
        end
    end

	--update display
    updateDisplay(true)
end

--------------------------
--creates buttons by type
-------------------------

function createAddText(sname, type, px, py)
    name = 'a_' .. sname;
    buttons[name] = {type = type }
    buttons.params.positions[name] = {x = px, y = thick, z = py}
end

function createToggle(name, px, py)
    createCounter('t_' .. name, 'toggle', px, py)
end

function createCounter(name, btype, px, py)
    buttons[name] = {type = btype}
    buttons.params.positions[name] = {x = px, y = thick, z = py}
end

function createTextField(sname, type, px, py)
    name = '__' .. sname;
    buttons[name] = {type = type }
    buttons.params.positions[name] = {x = px, y = thick, z = py}
end

function createResetTemps(name, px, py)
    name = "r_" .. name
    buttons[name] = { type = 'std'}
    buttons.params.positions[name] = {x = px, y= thick, z = py}
end

function dud()
end

--gets buttons params
function generateButtonParameters()
    for i,v in pairs(buttons) do
        if tostring(i) != 'index' and tostring(i) != 'counts' and tostring(i) != 'params' and tostring(i) != 'targetFunc' then
            btn = tostring(i)
            prefix = string.sub(btn, 1, 2)
			if (prefix == "r_") then
				buttons[tostring(i)].display = setupButton(tostring(i) .. 'ResetTemps', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].display, '', nil, false)
				buttons[tostring(i)].isReset = true
            elseif (prefix == "__") then
                buttons[tostring(i)].display = setupButton(tostring(i) .. 'dud', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].display, '', nil, false)
                buttons[tostring(i)].minusOne = setupButton(tostring(i) .. 'EditClick', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].button, 'Edit', buttons.params.sizes[buttons[tostring(i)].type].offsets.bottomButtons, true)
                buttons[tostring(i)].isText = true
			elseif (prefix == "a_") then
                buttons[tostring(i)].display = setupButton(tostring(i) .. 'dud', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].display, '', nil, false)
                buttons[tostring(i)].minusOne = setupButton(tostring(i) .. 'AddClick', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].button, '+', buttons.params.sizes[buttons[tostring(i)].type].offsets.bottomButtons, true)
                buttons[tostring(i)].isAddText = true
            elseif (prefix != "t_") then
                buttons[tostring(i)].display = setupButton(tostring(i) .. 'dud', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].display, '', nil, false)
                buttons[tostring(i)].plusOne = setupButton(tostring(i) .. 'PlusOne', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].button, '+', buttons.params.sizes[buttons[tostring(i)].type].offsets.bottomButtons, false)
                buttons[tostring(i)].minusOne = setupButton(tostring(i) .. 'MinusOne', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].button, '-', buttons.params.sizes[buttons[tostring(i)].type].offsets.bottomButtons, true)
            else
                buttons[tostring(i)].display = setupButton(tostring(i) .. 'ToggleClick', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].display, '', nil, false)
                buttons[tostring(i)].isToggle = true
            end
        end
    end
end

--creates buttons
function setupButton(targetFunc, positions, sizes, label, offsets, isLeft)
	local buttonInfo = {}
	buttonInfo.function_owner = self
	buttonInfo.index = buttons.index
	buttonInfo.click_function = targetFunc
	--reverse things for backside
	if string.sub(targetFunc, 3, 4) == 'b_' or string.sub(targetFunc, 1, 2) == 'b_' then
		buttonInfo.rotation = {0,0,180}
		if offsets != nil then
			reverse_x = -offsets.x
		end
	elseif offsets != nil then
		reverse_x = offsets.x
	end
	--reversed
	if isLeft then
		orientationModifier = -1
	else
		orientationModifier = 1
	end
	if offsets == nil then
		buttonInfo.position = {positions.x, positions.y, positions.z}
	else
		buttonInfo.position = {positions.x + (reverse_x) * orientationModifier, positions.y + offsets.y, positions.z + offsets.z}
	end
	buttonInfo.width = sizes.width
	buttonInfo.height = sizes.height
	buttonInfo.font_size = sizes.font
	buttonInfo.label = label
	buttons.index = buttons.index + 1
	return buttonInfo
end

----------------------------------------------
--Utility functions
----------------------------------------------
function updateDisplay(firstTime)
    for i,v in pairs(buttons) do
        if tostring(i) != 'index' and tostring(i) != 'counts' and tostring(i) != 'params' and tostring(i) != 'targetFunc' then
            if (buttons[tostring(i)].isReset == true) then
				buttons[tostring(i)].display.label = 'Reset'
			elseif (buttons[tostring(i)].isToggle == true) then
				if (buttons.counts[tostring(i)] > 0) then
                    buttons[tostring(i)].display.label = "X"
                else
                    buttons[tostring(i)].display.label = ""
                end
            else
                if (buttons[tostring(i)].isText == true) then
                    buttons[tostring(i)].display.label = tostring(buttons.counts[tostring(i)])
                    if (objs[tostring(i)] == nil) then
                        buttons[tostring(i)].minusOne.label = "Edit"
                    else
                        buttons[tostring(i)].minusOne.label = "Done"
                    end
                elseif (buttons[tostring(i)].isAddText == true) then
                    buttons[tostring(i)].display.label = tostring(buttons.counts[tostring(i)])
                    if (objs[tostring(i)] == nil) then
                        buttons[tostring(i)].minusOne.label = "+"
                    else
                        buttons[tostring(i)].minusOne.label = "X"
                    end
				else
                    buttons[tostring(i)].display.label = tostring(buttons.counts[tostring(i)])
                end
            end
            if (firstTime) then
                self.createButton(buttons[tostring(i)].display)
                if (buttons[tostring(i)].plusOne != nil) then
					self.createButton(buttons[tostring(i)].plusOne)
				end
                if (buttons[tostring(i)].minusOne != nil) then
					self.createButton(buttons[tostring(i)].minusOne)
				end
            else
                self.editButton(buttons[tostring(i)].display)
            end
        end
    end
end

---------------------------------------------
--functions activated by button click/other
--------------------------------------------
--reset temps
function resetTemps()
    --Resets counts on each display to 0
    for i,v in pairs(buttons) do
        if tostring(i) == 'survival_temp' or tostring(i) == 'survivalN_temp' or tostring(i) == 'insanity_temp' then
            buttons.counts[tostring(i)] = 0
        elseif tostring(i) == 'a_other_temp' then
			buttons.counts[tostring(i)] = ''
		end
    end
    updateDisplay(false)
end

function toggleClick(location)
	if buttons.counts[location] > 0 then
		buttons.counts[location] = 0
	else
		buttons.counts[location] = 1
	end
    updateDisplay(false)
end

function plus(location, amount)
    buttons.counts[location] = buttons.counts[location] + amount
    updateDisplay(false)
end

function minus(location, amount)
    --Prevents count from going below 0
    --if buttons.counts[location] > amount - 1 then
        buttons.counts[location] = buttons.counts[location] - amount
    --else
		--buttons.counts[location] = 0
    --end
    updateDisplay(false)
end

function editclick(location)
    nm = tostring(location) --string.gsub(location, "", "")
    local sizes = buttons.params.sizes[buttons[nm].type].offsets
    mpos = self.getPosition(); pos = buttons.params.positions[nm]
    local btns = self.getButtons()
    if (btns == nil) then
		return
	end
    button = nil
    fname = tostring(location) .. 'EditClick'
    ppos = {pos.x + 0.5, pos.y, pos.z}
    if (objs[nm] != nil) then
        buttons.counts[nm] = objs[nm].getDescription()
		if nm == '__settlement_name' then
			self.setName(objs[nm].getDescription())
		elseif nm == '__b_survivor_name' then
			self.setName(objs[nm].getDescription())
		end
        destroyObject(objs[nm])
        objs[nm] = nil
    else
        local pos = self.getPosition()
        local rot = self.getRotation()
        local sca = self.getScale()
        local pawn_pos = {}
        pawn_pos['x'] = pos['x']+ppos[1]--+1.2
        pawn_pos['z'] = pos['z']-ppos[3] --1.8
        --translate point to origin
        local tempX = (pawn_pos['x'] - pos['x'])*sca['x']
        local tempZ = (pawn_pos['z'] - pos['z'])*sca['z']
        --now apply rotation
        local rad_rot = math.rad(original_rot['y'] - rot['y'])
        local obj_rotatedX = tempX * math.cos(rad_rot) - tempZ * math.sin(rad_rot)
        local obj_rotatedZ = tempX * math.sin(rad_rot) + tempZ * math.cos(rad_rot);
        --translate back
        local new_pawn_x = obj_rotatedX + pos['x'];
        local new_pawn_z = obj_rotatedZ + pos['z'];
        local params = {}
        local final_pos={new_pawn_x, pos['y']+1, new_pawn_z}

        o = spawnObject({
            type = 'go_game_piece_black',
            position = final_pos, --{mpos[1] + pos[1], mpos[2] + pos[2]+2, mpos[3] - pos[3]},
            scale = {1, 1, 1}
        })
        objs[nm] = o
        o.setDescription(tostring(buttons.counts[nm]))
		o.setName('Edit my description and re-click Edit')
    end
    updateDisplay(false)
end