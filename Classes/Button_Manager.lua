-- Define a Scene Manager class
ButtonManager = {}
ButtonManager.__index = ButtonManager

-- Constructor
function ButtonManager:new()
  local this = {
    buttons = {},
    selection = 1
  }
  setmetatable(this, self)
  return this
end

function ButtonManager:addButton(name,button)
    local index = #self.buttons + 1
    self.buttons[name] = {button = button,index = index }
end

function ButtonManager:removeButton(name)
    self.buttons[name] = nil
end

-- Updates buttons
function ButtonManager:update()
    for key in pairs(self.buttons) do
        self.buttons[key].button:update()
    end
end

-- Check for keyboard input
function ButtonManager:keypressed(key)
    if key == "up" then
      self:changeFocus(-1)
    elseif key == "down" then
      self:changeFocus(1)
    end
  end

function ButtonManager:mousereleased(button)
    --for key in pairs(self.buttons) do
    --    self.buttons[key].button:mousereleased(button)
    --end
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