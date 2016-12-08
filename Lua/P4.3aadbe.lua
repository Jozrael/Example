--KDM Gear Sheet (Slate) v.3
--by Eskander and Curnil
--Script adapted from soulburner's dnd sheets and Mr. Stumps Universal Counter Tokens

-------------------------------------------------------------
--Customizable Buttons EDIT BELOW
-------------------------------------------------------------

function initCustomButtons()
	thick = 0.14

	--armor and hit locations
    dx = 6.35; dy = -8.7; px =2.36
	createCounter('armor_head', 'big', dx, dy); dx = dx + px + 0.15
	createCounter('armor_body', 'big', dx, dy); dx = dx + px + 0.15
	createCounter('armor_waist', 'big', dx, dy); dx = dx + px + 0.1
	createCounter('armor_arms', 'big', dx, dy); dx = dx + px + 0.13
	createCounter('armor_legs', 'big', dx, dy)

	dx = 6.8; dy = -7.1; px = 1.63; py = 0.65; ry = dy
	createToggle('injury_head', dx, dy); dx = dx + px;
	createToggle('injury_body_l', dx, dy); dx = dx + 0.85
	createToggle('injury_body_h', dx, dy); dx = dx + px;
	createToggle('injury_wasit_l', dx, dy); dx = dx + 0.86
	createToggle('injury_wasit_h', dx, dy); dx = dx + px;
	createToggle('injury_arms_l', dx, dy); dx = dx + 0.85
	createToggle('injury_arms_h', dx, dy); dx = dx + px;
	createToggle('injury_legs_l', dx, dy); dx = dx + 0.85
	createToggle('injury_legs_h', dx, dy)

    dx = 18; dy = -5.25;
    createResetArmor('resetArmor', dx, dy)
	
    --if you added a location, you need to give it a position, coordinates are relative to the center of the model
    --buttons.params.positions.test = {x = 1, y = 1, z = 1}

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
        display = {width = 800, height = 250, font = 130},
        button = {width = 0, height = 0, font = 100},
        offsets = { bottomButtons = {x = 0, y = 0, z = 0}, topButtons = {x = 0, y = 0, z = 0} }
    }
    buttons.params.sizes.mid = {
        display = {width = 0, height = 0, font = 400},
        button = {width = 150, height = 200, font = 200},
        offsets = { bottomButtons = {x = 0.28, y = 0, z = -0.3}, topButtons = {x = 0.1, y = 0, z = -0.17} }
    }
    buttons.params.sizes.big = {
        display = {width = 0, height = 0, font = 1000},
        button = {width = 280, height = 280, font = 350},
        offsets = { bottomButtons = {x = 0.44, y = 0, z = -1.66} }
    }
    buttons.params.sizes.small = {
        display = {width = 0, height = 0, font = 80},
        button = {width = 100, height = 100, font = 100},
        offsets = { bottomButtons = {x = 0.2, y = 0, z = 0}, topButtons = {x = 0.1, y = 0, z = -0.1} }
    }
    buttons.params.sizes.toggle = {
        display = {width = 280, height = 280, font = 290},
        button = {width = 300, height = 300, font = 300},
        offsets = { bottomButtons = {x = 0, y = 0, z = 0}, topButtons = {x = 0, y = 0, z = 0} }
    }

    buttons.params.sizes.txt = {
        display = {width = 0, height = 0, font = 150},
        button = {width = 300, height = 200, font = 100},
        offsets = { bottomButtons = {x = 2, y = 0, z = 0}, topButtons = {x = 0, y = 0, z = 0} }
    }

    buttons.params.sizes.txt2 = {
        display = buttons.params.sizes.txt.display, button = buttons.params.sizes.txt.button,
        offsets = { bottomButtons = {x = 0, y = 0, z = -0.68}, topButtons = {x = 0, y = 0, z = 0} }
    }
    buttons.params.sizes.txt3 = {
        display = buttons.params.sizes.txt.display, button = buttons.params.sizes.txt.button,
        offsets = { bottomButtons = {x = 0, y = 0, z = -2}, topButtons = {x = 0, y = 0, z = 0} }
    }
	buttons.params.sizes.txt4 = {
        display = buttons.params.sizes.txt.display, button = buttons.params.sizes.txt.button,
        offsets = { bottomButtons = {x = 4.4, y = 0, z = 0}, topButtons = {x = 0, y = 0, z = 0} }
    }
	buttons.params.sizes.txt5 = {
        display = buttons.params.sizes.txt.display, button = buttons.params.sizes.txt.button,
        offsets = { bottomButtons = {x = 4.4, y = 0, z = 0}, topButtons = {x = 0, y = 0, z = 0} }
    }
    buttons.params.sizes.txtbig = {
        display = {width = 0, height = 0, font = 300},
        button = buttons.params.sizes.txt.button,
        offsets = { bottomButtons = {x = 3.9, y = 0, z = -0.25}, topButtons = {x = 0, y = 0, z = 0} }
    }
    buttons.params.sizes.txtbig2 = {
        display = {width = 0, height = 0, font = 300},
        button = buttons.params.sizes.txt.button,
        offsets = { bottomButtons = {x = 4, y = 0, z = 0}, topButtons = {x = 4, y = 0, z = 0} }
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

-------curnil's standalone token script
--used to determine if collision(enter/exit) is Full Char Sheet
isKDMFULL = true
FullCharSheet = ''
tokens = {}
-------------


--Loads
function onload(saved_data)
    original_rot = {['x'] = 0,['y'] = 180,['z'] = 0}
    initButtonsTable()
    objs = {}
	initCustomButtons()

    for i,v in pairs(buttons) do
        buttons.counts[tostring(i)] = 0

        if tostring(i) != 'index' and tostring(i) != 'counts' and tostring(i) != 'params' and tostring(i) != 'targetFunc' then
            self.setVar(tostring(i) .. 'PlusOne', function () plus(tostring(i), 1) end)
            self.setVar(tostring(i) .. 'MinusOne', function () minus(tostring(i), 1) end)
            self.setVar(tostring(i) .. 'ToggleClick', function () toggleClick(tostring(i)) end)
			self.setVar(tostring(i) .. 'ResetArmor', function () resetArmor(tostring(i)) end)
        end
    end

    generateButtonParameters()

    --loads saved data
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

function createResetArmor(name, px, py)
    name = "r_" .. name
    buttons[name] = { type = 'std'}
    buttons.params.positions[name] = {x = px, y= thick, z = py}
end

function generateButtonParameters()
    for i,v in pairs(buttons) do
        if tostring(i) != 'index' and tostring(i) != 'counts' and tostring(i) != 'params' and tostring(i) != 'targetFunc' then
            btn = tostring(i)
            prefix = string.sub(btn, 1, 2)
			if (prefix == "r_") then
				buttons[tostring(i)].display = setupButton(tostring(i) .. 'ResetArmor', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].display, '', nil, false)
				buttons[tostring(i)].isReset = true
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

function setupButton(targetFunc, positions, sizes, label, offsets, isLeft)
    local buttonInfo = {}
	buttonInfo.function_owner = self
	buttonInfo.index = buttons.index
	buttonInfo.click_function = targetFunc
	if offsets != nil then
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
				buttons[tostring(i)].display.label = 'Reset Armor'
            elseif (buttons[tostring(i)].isToggle == true) then
				if (buttons.counts[tostring(i)] > 0) then
                --if (buttons.toggles[tostring(i)].isClicked == false) then
                    buttons[tostring(i)].display.label = "X"
					--buttons.toggles[tostring(i)].isClicked = true
                    --buttons[tostring(i)].display.label.setColorTint(0, 0, 0)
                else
                    buttons[tostring(i)].display.label = ""
					--buttons.toggles[tostring(i)].isClicked = false
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
                    buttons[tostring(i)].display.label = tostring(buttons.counts[tostring(i)])
                end
            end
            if (firstTime) then
                self.createButton(buttons[tostring(i)].display)
                if (buttons[tostring(i)].plusOne != nil) then self.createButton(buttons[tostring(i)].plusOne) end
                if (buttons[tostring(i)].minusOne != nil) then self.createButton(buttons[tostring(i)].minusOne) end
            else
                self.editButton(buttons[tostring(i)].display)
            end
        end
    end

end

--------------------------------------------
--functions activated by button click/other
--------------------------------------------

function dud()
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
    --    buttons.counts[location] = 0
    --end
    updateDisplay(false)
end

--reset armor
function resetArmor()
    --Resets counts on each display to 0
    --Resets Armor and Injuries
    for i,v in pairs(buttons) do
        if tostring(i) != 'r_resetArmor' then
            buttons.counts[tostring(i)] = 0
        end
    end
    --This section will add armor counts for each area
    --[[

    ]]
    updateDisplay(false)
end



----------------------------
--curnil's token scripts standlone
----------------------------
function onCollisionEnter(collision_info)
    local obj = collision_info.collision_object
    if obj.getVar("isKDMFULL") then
        if FullCharSheet == '' then
            FullCharSheet = obj
        end
    end

    -- special rules for bonus tiles
    if obj.getVar("isKdmEffectsObject") then
        tokens[obj.getGUID()] = obj.call("getEffects", nil)
        if FullCharSheet ~= '' then
			FullCharSheet.call('loadTokens', tokens)
        end
    end
end

-- This function detaches the tile and saves data to it
function onCollisionExit(collision_info)
    local obj = collision_info.collision_object
        if obj.getVar("isKDMFULL") then
            if FullCharSheet ~= '' and FullCharSheet.guid == obj.guid then
                FullCharSheet = ''
            end
        end

        if obj.getVar("isKdmEffectsObject") then
            -- remove the token from the tokens collection
            tokens[obj.getGUID()] = nil
            if FullCharSheet ~= '' then
                FullCharSheet.call('loadTokens', tokens)
            end
        end
end

--[[
function onObjectDestroyed(dying_object)
    guid = dying_object.getGUID()
    if FullCharSheet ~= '' and FullCharSheet.guid == guid then
        onCollisionExit({collision_object = dying_object})
    end

    if guid and (tokens and tokens[guid]) then
        onCollisionExit({collision_object = dying_object})
    end
end
--]]