require "Classes.Button_class"
require "Classes.ButtonData"
require "Classes.Button_Manager"
local data = require "Data.Button_DataBase"

local Icon_Path = "Textures/Window Icon/Icon.png"

local ButtonsManager = ButtonManager:new()

function love.load()
    love.window.setTitle("UI Manager")
    local icon = love.image.newImageData(Icon_Path)
    love.window.setIcon(icon)

    -- Button Stuff
    local Font = "Fonts/monogram/ttf/monogram-extended.ttf" -- Create font
    local RedTexture = ConvertToTextures(data.Red_Button) -- Select button textures by path and then convert to usable textures
    local BLueTexture = ConvertToTextures(data.Blue_Button)
    local title_button = ButtonData:create({x = 300,y = 0},"Cube survivors!",{font = Font, size = 28},RedTexture,function() return print("welcome") end)
    local play_button = ButtonData:create({x = 300,y = 75},"Play",{font = Font, size = 34},BLueTexture,function() return print("Play the game") end)
    --OLD
    --local title_button = TextButton:create(300,0,myButtons,customFont,28,"Cube Survivors!",function() return print("welcome") end) -- position, x and y, textures, font, size of font, text , custom func
    --local play_button = TextButton:create(300,75,myButtons,customFont,34,"Play",function() return print("Play") end)

    -- ADD BUTTONS TO MANAGER
    ButtonsManager:addButton("title",title_button) -- add button to manager to handle rendering
    ButtonsManager:addButton("Play",play_button)
    --ButtonsManager:addButton("play",play_button)
end


function love.update(dt)
    ButtonsManager:update()
end

function love.keypressed(key)
    ButtonsManager:keypressed(key)
end

function love.mousereleased( x, y, button, istouch, presses )
    ButtonsManager:mousereleased(button)
end

function love.draw()
    ButtonsManager:draw()
end
