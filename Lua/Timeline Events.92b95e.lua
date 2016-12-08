function onload()
  b_display = { index = 0,
                      click_function = 'updateDisplay',
                      label = self.getName(),
                      function_owner = self,
                      position = {0, 0.09, 0},
                      rotation = {0, 0, 0},
                      width = 6000,
                      height = 500,
                      font_size = 300}

  local description = string.match(self.getDescription(), '%d+')
    if description != '' and type(tonumber(description)) == 'number' then
        b_display.font_size = tonumber(description)
  end

  self.createButton(b_display)
end

function updateDisplay()
    b_display.label = self.getName()

    local description = string.match(self.getDescription(), '%d+')
    if description != '' and type(tonumber(description)) == 'number' then
        b_display.font_size = tonumber(description)
    end

    self.editButton(b_display)
end