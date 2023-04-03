-- Define button
-- Button class
TextButton = {}
TextButton.__index = TextButton

function TextButton:create(x, y,spritesPath,fontPath,size, text,func)
    local button = {
        x = x,
        y = y,
        text = text,
        callFunction = func,
        isHovered = false,
        selected = false,
        isClicked = false,
        state = "default"
    }
    button.buttonSprites = {}
    button.font = love.graphics.newFont(fontPath, size)

    local key = {"default","hover","pressed"}
    for i = 1, 3 do
        button.buttonSprites[key[i]] = love.graphics.newImage(spritesPath[key[i]])
    end

    button.width = button.buttonSprites["default"]:getWidth()
    button.height = button.buttonSprites["default"]:getHeight()

    setmetatable(button, TextButton)
    return button
end



function TextButton:update()
    
    local mx, my = love.mouse.getPosition()
    
    -- Check if the mouse is hovering over the button
    if mx > self.x and mx < self.x + self.width and my > self.y and my < self.y + self.height then
        self.isHovered = true
    else
        self.isHovered = false
    end
    
    -- Check if the button is being clicked
    

    if self.isClicked then
        self.state = "pressed"
        self.callFunction()
    elseif self.isHovered or self.selected then
        self.state = "hover"
    else
        self.state = "default"
    end

    self.isClicked = false
end

function TextButton:mousereleased(button)
    if self.isHovered and button == 1 then
        self.isClicked = true
    end
end

function TextButton:draw()
    local transform = love.math.newTransform(self.x, self.y) -- Set the position of the button
    love.graphics.draw(self.buttonSprites[self.state],transform) -- Draw the button depending on state.

    love.graphics.setColor(1, 1, 1) -- Set text colour
    love.graphics.setFont(self.font) -- Set font for this specific button
    love.graphics.printf(self.text, self.x, self.y + self.height/2 - 12, self.width, "center") -- Draw the text
end