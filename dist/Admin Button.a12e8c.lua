--------------------
--KDM Admin Button
-------------------

-------------------
--Variables
------------------

-------------------
--Init
--------------------
function onLoad()

	--show admin
	self.createButton({
		click_function = 'showAdmin',
		function_owner = self,
		label = 'Show Admin Console',
		position = {0,0.5,0},
		rotation = {0,0,0},
		width = 3000,
		height = 400,
		font_size = 200
	})

end

--------------------
--Fcns
--------------------

function showAdmin()
	Global.call('showAdmin')
end