function onPickedUp()
	local name = self.getName()
	local params = {name}
	Global.call('recallDiscards', params)
end