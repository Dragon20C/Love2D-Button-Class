-- Define a Scene Manager class
ButtonManager = {}
ButtonManager.__index = ButtonManager

-- Constructor
function ButtonManager:new()
  local this = {
    buttons = {},
    selection = 1,
    amount = 0
  }
  setmetatable(this, self)
  return this
end

function ButtonManager:addButton(name,button)
  self.amount = self.amount + 1
  self.buttons[name] = {button = button,index = self.amount }
end

function ButtonManager:removeButton(name)
    self.buttons[name] = nil
end

-- Updates buttons
function ButtonManager:update()

  -- Keeps the button focus inside the buttons.
  if self.selection < 1 then
    self.selection = 1
  elseif self.selection > self.amount then
    self.selection = self.amount
  end

    for key in pairs(self.buttons) do
      local currentButton = self.buttons[key].button
      
      local mx, my = love.mouse.getPosition()
      
      -- Check if the mouse is hovering over the button
      if mx > currentButton.x and mx < currentButton.x + currentButton.width and my > currentButton.y and my < currentButton.y + currentButton.height then
        currentButton.isHovered = true
        self.selection = self.buttons[key].index
      elseif self.selection == self.buttons[key].index then
        currentButton.isHovered = true
      else
        currentButton.isHovered = false
      end

      if currentButton.isClicked then
        currentButton.state = "pressed"
        currentButton.action()
      elseif currentButton.isHovered or currentButton.selected then
        currentButton.state = "hover"
      else
        currentButton.state = "default"
      end

      currentButton.isClicked = false
  end
end

-- Check for keyboard input
function ButtonManager:keypressed(key)
  if key == "down" then
    self.selection = self.selection + 1
  end
  if key == "up" then
    self.selection = self.selection - 1
  end
  if key == "space" then
    for key in pairs(self.buttons) do
      local currentButton = self.buttons[key].button
      if currentButton.isHovered then
        currentButton.isClicked = true
      end
    end
  end


end

function ButtonManager:mousereleased(button)
    for key in pairs(self.buttons) do
      local currentButton = self.buttons[key].button
      if currentButton.isHovered and button == 1 then
        currentButton.isClicked = true
      end
    end    
end

-- Draw buttons
function ButtonManager:draw()
    for key in pairs(self.buttons) do
        self.buttons[key].button:draw()
    end
end

-- TO DO LIST

-- Buttons shouldnt handle input for them selfs instead have this button manager handle input, the button class shouldnt
-- only hold the needed data like the function it does, and the textures