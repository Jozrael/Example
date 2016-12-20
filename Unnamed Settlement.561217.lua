--kdm cover sheet
--eskander

--init
function onLoad()
	local thick = 0.08
	local params = {}
	params.click_function = 'dud'
	params.function_ownwer = self
	params.label = ''
	params.position = {dx, thick, dy}
	params.rotation = {0, 0, 0}
	params.width = 0
	params.height = 0
	params.font_size = 100
	
	--sname
	params.position = {0, thick, -0.1}
	self.createButton(params)
	
	--p1
	params.position = {0, thick, 0.32}
	self.createButton(params)
	
	--p2
	params.position = {0, thick, 0.49}
	self.createButton(params)
	
	--p3
	params.position = {0, thick, 0.66}
	self.createButton(params)
	
	--p4
	params.position = {0, thick, 0.83}
	self.createButton(params)

	local sName = self.getName()
	local descr = self.getDescription()
	updateLabels(sName, descr)
end

function onPickedUp()
	local sName = self.getName()
	local descr = self.getDescription()
	updateLabels(sName, descr)
end

function updateLabels(sName, descr)
	local p1 = ''
	local p2 = ''
	local p3 = ''
	local p4 = ''
	if descr != '' then
		local allPlayers = split(descr, ',')
		for i=1, 4 do
			p1 = allPlayers[1]
			p2 = allPlayers[2]
			p3 = allPlayers[3]
			p4 = allPlayers[4]
		end
	end
	self.editButton({index = 0, label = sName})
	self.editButton({index = 1, label = p1})
	self.editButton({index = 2, label = p2})
	self.editButton({index = 3, label = p3})
	self.editButton({index = 4, label = p4})
end

function dud()
end

function split(input, split)
  local returnarr = {}
  local i = 1
  for str in string.gmatch(input, '([^' .. split .. ']+)') do
    returnarr[i] = str
    i = i + 1
  end
  return returnarr
end