--KDM Survivor Sheet-Full (Slate) v.3
--by Eskander and Curnil
--Script adapted from soulburner's dnd sheets and Mr. Stumps Universal Counter Tokens

-------------------------------------------------------------
--Customizable Buttons EDIT BELOW
-------------------------------------------------------------
function initCustomButtons()
	thick = 0.14

	--minimize button
	dx = 4.3; dy = -12
	createMinimize('minimize', 'collapse', dx, dy)

	--header
	dx = 0; dy =-11.8
	createTextField('survivor_name', 'txtbig', dx, dy)

	dx =-4.65 ; dy =-11.25; px = 0.53
	createToggle('gender_m', dx, dy); dx = dx + px;
	createToggle('gender_f', dx, dy)

	--survival
	dx = -4.35; dy =-9.8
	createCounter('survival', 'big', dx, dy)

	dx = -3.2; dy = -9.25
	createCounter('survival_limit', 'mid', dx, dy)

	dx = -2.48; dy = -9.25
	createToggle('survival_disabled', dx, dy)

	dx = -0.78; dy = -10.48; py = 0.4
	createToggle('dodge', dx, dy); dy = dy + py;
	createToggle('encourage', dx, dy); dy = dy + py;
	createToggle('surge', dx, dy); dy = dy + py;
	createToggle('dash', dx, dy)

	--stats
	dx = -4.33; dy = -7.7
	createCounter('movement', 'big', dx, dy)

	dx = -2.98; dy = -7.8 ; px = 1.27
	createCounter('accuracy', 'mid', dx, dy) dx = dx + px;
	createCounter('strength', 'mid', dx, dy) dx = dx + px;
	createCounter('evasion', 'mid', dx, dy) dx = dx + px;
	createCounter('luck', 'mid', dx, dy) dx = dx + px;
	createCounter('speed', 'mid', dx, dy)

	--insanity
	dx = 3.93; dy = -9.1
	createCounter('insanity', 'big', dx, dy)
	dx = 4.985; dy = -9.65
	createToggle('brain_injury', dx, dy)

	--experience
	dx = -3.17; dy = -6.05; px = 0.513
	createToggle('xp_1', dx, dy); dx = dx + px;
	createToggle('xp_2', dx, dy); dx = dx + px;
	createToggle('xp_3', dx, dy); dx = dx + px;
	createToggle('xp_4', dx, dy); dx = dx + px;
	createToggle('xp_5', dx, dy); dx = dx + px;
	createToggle('xp_6', dx, dy); dx = dx + px;
	createToggle('xp_7', dx, dy); dx = dx + px;
	createToggle('xp_8', dx, dy); dx = dx + px;
	createToggle('xp_9', dx, dy); dx = dx + px;
	createToggle('xp_10', dx, dy); dx = dx + px;
	createToggle('xp_11', dx, dy); dx = dx + px;
	createToggle('xp_12', dx, dy); dx = dx + px;
	createToggle('xp_13', dx, dy); dx = dx + px;
	createToggle('xp_14', dx, dy); dx = dx + px;
	createToggle('xp_15', dx, dy); dx = dx + px;
	createToggle('xp_16', dx, dy)

	dx = 4.94; dy = -6.9
	createToggle('no_hunt', dx, dy)

	--skills
	dx = -1.65; dy =-3.45
	createTextField('proficiency_type', 'txt', dx, dy)

	dx = 1.038; dy = -4.1; px = 0.494
	createToggle('proficiency_1', dx, dy); dx = dx + px;
	createToggle('proficiency_2', dx, dy); dx = dx + px;
	createToggle('proficiency_3', dx, dy); dx = dx + px;
	createToggle('proficiency_4', dx, dy); dx = dx + px;
	createToggle('proficiency_5', dx, dy); dx = dx + px;
	createToggle('proficiency_6', dx, dy); dx = dx + px;
	createToggle('proficiency_7', dx, dy); dx = dx + px;
	createToggle('proficiency_8', dx, dy)

	dx = -4.43; dy = -1.65; px =0.473
	createToggle('courage_1', dx, dy); dx = dx + px;
	createToggle('courage_2', dx, dy); dx = dx + px;
	createToggle('courage_3', dx, dy); dx = dx + px;
	createToggle('courage_4', dx, dy); dx = dx + px;
	createToggle('courage_5', dx, dy); dx = dx + px;
	createToggle('courage_6', dx, dy); dx = dx + px;
	createToggle('courage_7', dx, dy); dx = dx + px;
	createToggle('courage_8', dx, dy); dx = dx + px;
	createToggle('courage_9', dx, dy)

	dx = 0.64; dy = -1.65; px =0.473
	createToggle('understanding_1', dx, dy); dx = dx + px;
	createToggle('understanding_2', dx, dy); dx = dx + px;
	createToggle('understanding_3', dx, dy); dx = dx + px;
	createToggle('understanding_4', dx, dy); dx = dx + px;
	createToggle('understanding_5', dx, dy); dx = dx + px;
	createToggle('understanding_6', dx, dy); dx = dx + px;
	createToggle('understanding_7', dx, dy); dx = dx + px;
	createToggle('understanding_8', dx, dy); dx = dx + px;
	createToggle('understanding_9', dx, dy)

	dx = -4.43; dy = 0; py = 0.87
	createToggle('stalwart', dx, dy); dy = dy + py;
	createToggle('prepared', dx, dy); dy = dy + py;
	createToggle('matchmaker', dx, dy)

	dx = 0.6; dy = 0; py = 0.87
	createToggle('analyze', dx, dy); dy = dy + py;
	createToggle('explore', dx, dy); dy = dy + py;
	createToggle('tinker', dx, dy)

	--conditions
	dx = -2.5; dy = 3.77; py = 1.46
	createTextField('impairments', 'txt2', dx, dy); dy = dy + py
	createTextField('disorders', 'txt2', dx, dy); dy = dy + py
	createTextField('fighting_arts', 'txt2', dx, dy)

	dx = -0.2; dy = 6
	createToggle('disable_fightingarts', dx , dy)

	dx = -2.5; dy = 9.5; px = 5
	createTextField('abilities', 'txt3', dx, dy); dx = dx + px


	dx = 4.73; dy = 3.66; px =0.36; py =0.38; rx = dx
	createToggle('intracranial_hemorrhage', dx, dy); dy = dy + py;
	createToggle('deaf', dx, dy); dy = dy + py;
	createToggle('blind_1', dx, dy); dx = dx - px;
	createToggle('blind_2', dx, dy); dx = rx;dy = dy + py
	createToggle('shattered_jaw', dx, dy);

	dx = 4.73; dy = 5.44; px =0.36; py =0.38; rx = dx
	createToggle('dismembered_arm_1', dx, dy); dx = dx - px;
	createToggle('dismembered_arm_2', dx, dy); dx = rx; dy = dy + py
	createToggle('ruptured_muscle', dx, dy); dy = dy + py;
	createToggle('contracture_1', dx, dy); dx = dx - px;
	createToggle('contracture_2', dx, dy); dx = dx - px;
	createToggle('contracture_3', dx, dy); dx = dx - px;
	createToggle('contracture_4', dx, dy); dx = dx - px;
	createToggle('contracture_5', dx, dy); dx = rx;dy = dy + py
	createToggle('broken_arm_1', dx, dy); dx = dx - px
	createToggle('broken_arm_2', dx, dy); dx = dx - px

	dx = 4.73; dy = 7.22; px =0.36; py =0.38; rx = dx
	createToggle('gaping_chest_wound_1', dx, dy); dx = dx - px;
	createToggle('gaping_chest_wound_2', dx, dy); dx = dx - px;
	createToggle('gaping_chest_wound_3', dx, dy); dx = dx - px;
	createToggle('gaping_chest_wound_4', dx, dy); dx = dx - px;
	createToggle('gaping_chest_wound_5', dx, dy); dx = rx;dy = dy + py
	createToggle('destroyed_back', dx, dy); dx = rx; dy = dy + py
	createToggle('broken_rib_1', dx, dy); dx = dx - px;
	createToggle('broken_rib_2', dx, dy); dx = dx - px;
	createToggle('broken_rib_3', dx, dy); dx = dx - px;
	createToggle('broken_rib_4', dx, dy); dx = dx - px;
	createToggle('broken_rib_5', dx, dy)

	dx = 4.73; dy = 8.6; px =0.36; py =0.38; rx = dx
	createToggle('intestinal_prolapse', dx, dy); dy = dy + py
	createToggle('warped_pelvis_1', dx, dy); dx = dx - px;
	createToggle('warped_pelvis_2', dx, dy); dx = dx - px;
	createToggle('warped_pelvis_3', dx, dy); dx = dx - px;
	createToggle('warped_pelvis_4', dx, dy); dx = dx - px;
	createToggle('warped_pelvis_5', dx, dy); dx = rx;dy = dy + py
	createToggle('destroyed_genitals', dx, dy); dy = dy + py
	createToggle('broken_hip', dx, dy)

	dx = 4.73; dy = 10.38; px =0.36; py =0.38; rx = dx
	createToggle('dismembered_leg_1', dx, dy); dx = dx - px;
	createToggle('dismembered_leg_2', dx, dy); dx = rx;dy = dy + py
	createToggle('hamstrung', dx, dy); dy = dy + py
	createToggle('broken_leg_1', dx, dy); dx = dx - px;
	createToggle('broken_leg_2', dx, dy)

	--------------------
	--backside buttons
	-------------------
	thick = -0.14
	--header
	dx = 0; dy =-11.8
	createTextField('b_survivor_name', 'txtbig', dx, dy)

	dx =-4.475 ; dy =-11.8; px = -0.525
	createToggle('b_gender_m', dx, dy); dx = dx + px;
	createToggle('b_gender_f', dx, dy)

	--chronicles
	dx = -1; dy = -9.3; py = 0.9
	createCounter('b_year_born', 'mid', dx, dy); dy = dy + py
	createCounter('b_year_died', 'mid', dx, dy)

	dx = -3.8; dy =-9
	createCounter('b_age', 'big', dx, dy)

	dx = 0; dy = -7.5
	createTextField('b_cause_death', 'txt4', dx, dy)

	--family
	dx = 2.5; dy = -5; px = 5; py = 1.02
	createTextField('b_parent_1', 'txt', dx, dy); dx = dx - px
	createTextField('b_parent_2', 'txt', dx, dy); dx = 0; dy = dy + py
	createTextField('b_fam_self', 'txt', dx, dy); dx = 2.5; dy = dy + py
	createTextField('b_child_1', 'txt', dx, dy); dx = dx - px
	createTextField('b_child_2', 'txt', dx, dy); dx = 2.5; dy = dy + py
	createTextField('b_child_3', 'txt', dx, dy); dx = dx - px
	createTextField('b_child_4', 'txt', dx, dy); dx = 2.5; dy = dy + py
	createTextField('b_child_5', 'txt', dx, dy); dx = dx - px
	createTextField('b_child_6', 'txt', dx, dy)

	--freetext etc
	dx = 0; dy = 1.3
	createTextField('b_mates', 'txt2', dx, dy)

	dx = 0; dy = 5.1
	createTextField('b_deeds', 'txt3', dx, dy)

	dx = 0; dy = 9.8
	createTextField('b_notes', 'txt3', dx, dy)


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
	buttons.params.sizes.collapse = {
        display = {width = 450, height = 450, font = 450},
        button = {width = 0, height = 0, font = 100},
        offsets = { bottomButtons = {x = 0, y = 0, z = 0}, topButtons = {x = 0, y = 0, z = 0} }
	}
    buttons.params.sizes.mid = {
        display = {width = 0, height = 0, font = 400},
        button = {width = 150, height = 200, font = 200},
        offsets = { bottomButtons = {x = 0.28, y = 0, z = -0.3}, topButtons = {x = 0.1, y = 0, z = -0.17} }
    }
    buttons.params.sizes.big = {
        display = {width = 0, height = 0, font = 800},
        button = {width = 180, height = 250, font = 400},
        offsets = { bottomButtons = {x = 0.5, y = 0, z = -0.5}, topButtons = {x = 0.1, y = 0, z = -0.17} }
    }
    buttons.params.sizes.toggle = {
        display = {width = 150, height = 150, font = 200},
        button = {width = 200, height = 200, font = 200},
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
    buttons.params.sizes.txtbig = {
        display = {width = 0, height = 0, font = 300},
        button = buttons.params.sizes.txt.button,
        offsets = { bottomButtons = {x = 3.8, y = 0, z = 0}, topButtons = {x = 0, y = 0, z = 0} }
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

-------------curnils tokens standalone
--used to determine if collision(enter/exit) is Full Char Sheet
isKDMFULL = true
tokens = {}
tempStats = {}
--------------

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
			self.setVar(tostring(i) .. 'Minimize', function () minimizeSheet(tostring(i)) end)
			self.setVar(tostring(i) .. 'Maximize', function () maximizeSheet(tostring(i)) end)
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

function createMinimize(name, type, px, py)
	name = 'm-' .. name
	buttons[name] = {type = type}
	buttons.params.positions[name] = {x = px, y = thick, z = py}
end

function createMaximize(name, type, px, py)
	name = 'm+' .. name
	buttons[name] = {type = type}
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
			elseif (prefix == "m-") then
				buttons[tostring(i)].display = setupButton(tostring(i) .. 'Minimize', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].display, '', nil, false)
				buttons[tostring(i)].isMinimize = true
			elseif (prefix == "m+") then
				buttons[tostring(i)].display = setupButton(tostring(i) .. 'Maximize', buttons.params.positions[tostring(i)], buttons.params.sizes[buttons[tostring(i)].type].display, '', nil, false)
				buttons[tostring(i)].isMaximize = true
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
			if (buttons[tostring(i)].isMinimize == true) then
				buttons[tostring(i)].display.label = '-'
			elseif (buttons[tostring(i)].isMaximize == true) then
				buttons[tostring(i)].display.label = '+'
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
                else
					--curnil token script
					if i == "movement" or i == "accuracy" or i == "strength" or i == "evasion" or i == "luck" or i == "speed"then
                        buttons[tostring(i)].display.label = tostring(buttons.counts[tostring(i)])
                        updateStat(i)
                    else
					--
                    buttons[tostring(i)].display.label = tostring(buttons.counts[tostring(i)])
					end
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

---------------------------------------------
--functions activated by button click/other
--------------------------------------------

function toggleClick(location)
	if buttons.counts[location] > 0 then
		buttons.counts[location] = 0
		if location == "t_gender_m" or location == "t_b_gender_m" then
			buttons.counts["t_b_gender_m"] = 0
			buttons.counts["t_gender_m"] = 0
		elseif location == "t_gender_f" or location == "t_b_gender_f" then
			buttons.counts["t_b_gender_f"] = 0
			buttons.counts["t_gender_f"] = 0
		end
	else
		buttons.counts[location] = 1
		if location == "t_gender_m" or location == "t_b_gender_m" then
			buttons.counts["t_gender_f"] = 0
			buttons.counts["t_b_gender_f"] = 0
			buttons.counts["t_b_gender_m"] = 1
			buttons.counts["t_gender_m"] = 1
		elseif location == "t_gender_f" or location == "t_b_gender_f" then
			buttons.counts["t_gender_f"] = 1
			buttons.counts["t_b_gender_f"] = 1
			buttons.counts["t_b_gender_m"] = 0
			buttons.counts["t_gender_m"] = 0
		end
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

function editclick(location)
    nm = tostring(location) --string.gsub(location, "", "")
    local sizes = buttons.params.sizes[buttons[nm].type].offsets
    mpos = self.getPosition(); pos = buttons.params.positions[nm]
    local btns = self.getButtons()
    if (btns == nil) then return end
    button = nil
    fname = tostring(location) .. 'EditClick'
    ppos = {pos.x + 2, pos.y, pos.z}
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

--------------------------
--transfer for minimize
--------------------------
function minimizeSheet()
	if buttons.counts != nil then
		--hardsave
		local data_to_save = {}
		data_to_save.saved_counts = {}
		for i,v in pairs(buttons.counts) do
			data_to_save.saved_counts[tostring(i)] = v or 0
		end
		saved_data = JSON.encode(data_to_save)
		self.script_state = saved_data
		transfer_data = data_to_save
		startLuaCoroutine(self, 'transferCoroutine')
	end
end

function transferCoroutine()
	local object = self.setState(2)
	coroutine.yield(0)
    object.call('loadData', transfer_data)
	return 1
end

--------------------------
--save when dropped (for dropping into bags)
--------------------------
function onDropped()
	local data_to_save = {}
	data_to_save.saved_counts = {}
	for i,v in pairs(buttons.counts) do
		data_to_save.saved_counts[tostring(i)] = v or 0
	end
	saved_data = JSON.encode(data_to_save)
	self.script_state = saved_data
end




---------------------------
--Curnils token standalone script version
---------------------------
--Curnil's Token scripts
function loadTokens(loadedTokens)
    tokens = loadedTokens
    updateDisplay(false)
end

function updateStat(stat)
    local statIncrease = 0
    for i,v in pairs(tokens) do
        for j,w in pairs(v) do
            if stat == "movement" and tostring(j) == "move" then
                statIncrease = statIncrease + w
            elseif stat == j then
                statIncrease = statIncrease + w
            end
        end
    end
    buttons[stat].display.label = tostring(statIncrease + buttons.counts[stat])
    loadComplete = true
end

function onCollisionExit(collision_info)
    local obj = collision_info.collision_object
    if obj.getVar("isGearGrid") then
        -- remove the token from the tokens collection
        tokens = {}
        updateDisplay(false)
    end
end

function onPickedUp()
	tokens = {}
	updateDisplay(false)
end