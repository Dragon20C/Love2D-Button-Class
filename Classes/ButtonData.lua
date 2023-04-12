-- Define button
-- Button class
ButtonData = {}
ButtonData.__index = ButtonData

--           Position       Text        Font Table          Textures    Function
-- EXAMPLE ({x = 0, y = 0}, "EXIT", {font = FONT,size = 28},Textures,function() return print("Exit") end)

function ButtonData:create(Position,Text,Font_Table,Textures,Action)
    local button = {
        x = Position.x, -- Storing the position of the button
        y = Position.y,
        text = Text, -- Text to show
        textures = Textures, -- A table with the textures
        action = Action, -- Runs the function
        state = "default" -- "default" _ "hover" _ "pressed"

    }
    -- Get the width and height of the button to do box detection
    button.width = button.textures[button.state]:getWidth()
    button.height = button.textures[button.state]:getHeight()
    button.font = love.graphics.newFont(Font_Table.font, Font_Table.size)

    setmetatable(button, ButtonData)
    return button
end

function ButtonData:draw()
    local transform  = love.math.newTransform(self.x, self.y)
    love.graphics.draw(self.textures[self.state],transform) -- Draw button based on state
    love.graphics.setFont(self.font) -- Set font for this specific button
    love.graphics.printf(self.text, self.x, self.y + self.height/2 - 12, self.width, "center") -- Draw the text
end

-- The button class should only hold the data and button manager should handle all input including button press.