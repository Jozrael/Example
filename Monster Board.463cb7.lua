--KDM Monster Board
--by Eskander and Curnil
--Script adapted from soulburner's dnd sheets and Mr. Stumps Universal Counter Tokens

-------------------------------------------------------------
--Customizable Buttons EDIT BELOW
-------------------------------------------------------------
function initCustomButtons()
	thick = 0.06

	--stats
	dx = -1.13; dy =-0.49; px = 0.333
	createCounter('mov', 'big', dx, dy); dx = dx + px;
	createCounter('spd', 'big', dx, dy); dx = dx + px;
	createCounter('acc', 'big', dx, dy); dx = dx + px;
	createCounter('dmg', 'big', dx, dy); dx = dx + px + px + px;
	
	createCounter('tgh', 'big', dx, dy); dx = dx + px;
	createCounter('evs', 'big', dx, dy); dx = dx + px;
	createCounter('lck', 'big', dx, dy); dx = dx + px;

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
        buttons.params.sizes.std = {
            display = {width = 25, height = 25, font = 50},
            button = {width = 25, height = 25, font = 50},
            offsets = { bottomButtons = {x = 0.3, y = 0, z = 0}, topButtons = {x = 0.1, y = 0, z = -0.17} }
        }

        buttons.params.sizes.big = {
        display = {width = 0, height = 0, font = 100},
        button = {width = 50, height = 50, font = 70},
        offsets = { bottomButtons = {x = 0.07, y = 0, z = 0.1}, topButtons = {x = 0.1, y = 0, z = -0.17} }
        }

        buttons.params.sizes.toggle = {
            display = {width = 25, height = 25, font = 50},
            button = {width = 25, height = 25, font = 50},
            offsets = { bottomButtons = {x = 0, y = 0, z = 0}, topButtons = {x = 0, y = 0, z = 0} }
        }

        buttons.params.sizes.txt = {
            display = {width = 0, height = 0, font = 50},
            button = {width = 50, height = 50, font = 50},
            offsets = { bottomButtons = {x = 2, y = 0, z = 0}, topButtons = {x = 0, y = 0, z = 0} }
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
	tokens = {}

	--categorize buttons
    for i,v in pairs(buttons) do
        buttons.counts[tostring(i)] = 0
        if tostring(i) != 'index' and tostring(i) != 'counts' and tostring(i) != 'params' and tostring(i) != 'targetFunc' then
            self.setVar(tostring(i) .. 'PlusOne', function () plus(tostring(i), 1) end)
            self.setVar(tostring(i) .. 'MinusOne', function () minus(tostring(i), 1) end)
            self.setVar(tostring(i) .. 'ToggleClick', function () toggleClick(tostring(i)) end)
            self.setVar(tostring(i) .. 'EditClick', function () editclick(tostring(i)) end)
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

function dud()
end

--gets buttons params
function generateButtonParameters()
    for i,v in pairs(buttons) do
        if tostring(i) != 'index' and tostring(i) != 'counts' and tostring(i) != 'params' and tostring(i) != 'targetFunc' then
            btn = tostring(i)
            prefix = string.sub(btn, 1, 2)
            if (prefix == "__") then
                buttons[tostring(i)].display = setupButton(tostring(i) .. 'dud', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].display, '', nil, false)
                buttons[tostring(i)].minusOne = setupButton(tostring(i) .. 'EditClick', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].button, 'Edit', buttons.params.sizes[buttons[tostring(i)].type].offsets.bottomButtons, true)
                buttons[tostring(i)].isText = true
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
            if (buttons[tostring(i)].isToggle == true) then
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
                else
					--curnil token script
					if i == "mov" or i == "spd" or i == "acc" or i == "dmg" or i == "tgh" or i == "evs" or i == "lck" then
                        buttons[tostring(i)].display.label = tostring(buttons.counts[tostring(i)])
                        updateStat(i)
					else
						buttons[tostring(i)].display.label = tostring(buttons.counts[tostring(i)])
					end
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
		if nm == '__survivor_name' then
			buttons.counts.__b_survivor_name = objs[nm].getDescription()
			buttons.counts.__b_fam_self = objs[nm].getDescription()
			self.setName(objs[nm].getDescription())
		elseif nm == '__b_survivor_name' then
			buttons.counts.__survivor_name = objs[nm].getDescription()
			buttons.counts.__b_fam_self = objs[nm].getDescription()
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


---------------------
--transfer from level
---------------------

transferStats = {}

function transfer()
	if transferStats != nil then
		for k,v in pairs(transferStats) do
			buttons.counts[k] = v
		end
	end
	updateDisplay(false)
end

function clear()
	if transferStats != nil then
		for k,v in pairs(transferStats) do
			buttons.counts[k] = 0
		end
	end
	updateDisplay(false)
end

--------------------
--token scripts
--------------------
function onCollisionEnter(collision_info)
    local obj = collision_info.collision_object
    if obj.getVar("isKdmEffectsObject") then
        tokens[obj.getGUID()] = obj.call("getEffects", nil)
		updateDisplay(false)
    end
end

-- This function detaches the tile and saves data to it
function onCollisionExit(collision_info)
	local obj = collision_info.collision_object
	if obj.getVar("isKdmEffectsObject") then
		-- remove the token from the tokens collection
		tokens[obj.getGUID()] = nil
		updateDisplay(false)
	end
end

function updateStat(stat)
    local statIncrease = 0
    for i,v in pairs(tokens) do
        for j,w in pairs(v) do
            if stat == "mov" and tostring(j) == "move" then
                statIncrease = statIncrease + w
			elseif stat == "spd" and tostring(j) == "speed" then
				statIncrease = statIncrease + w
			elseif stat == "acc" and tostring(j) == "accuracy" then
				statIncrease = statIncrease + w
			elseif stat == "dmg" and tostring(j) == "damage" then
				statIncrease = statIncrease + w
			elseif stat == "tgh" and tostring(j) == "toughness" then
				statIncrease = statIncrease + w
			elseif stat == "evs" and tostring(j) == "evasion" then
				statIncrease = statIncrease + w
			elseif stat == "lck" and tostring(j) == "luck" then
				statIncrease = statIncrease + w
            elseif stat == j then
                statIncrease = statIncrease + w
            end
        end
    end
    buttons[stat].display.label = tostring(statIncrease + buttons.counts[stat])
end