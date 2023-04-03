require "Classes.Button_class"
require "Classes.Button_Manager"
local data = require "Data.Button_DataBase"

local Icon_Path = "Textures/Window Icon/Icon.png"

local ButtonsManager = ButtonManager:new()

local function button_press()
    print("button pressed")
end

function love.load()
    love.window.setTitle("UI Manager")
    local icon = love.image.newImageData(Icon_Path)
    love.window.setIcon(icon)

    local customFont = "Fonts/monogram/ttf/monogram-extended.ttf" -- Create font
    local myButtons = data.Red_Button -- Select button textures
    local title_button = TextButton:create(300,0,myButtons,customFont,28,"Cube Survivors!",function() return print("welcome") end) -- position, x and y, textures, font, size of font, text , custom func
    local play_button = TextButton:create(300,75,myButtons,customFont,34,"Play",function() return print("Play") end)

    -- ADD BUTTONS TO MANAGER
    ButtonsManager:addButton("title",title_button) -- add button to manager to handle rendering
    ButtonsManager:addButton("play",play_button)
end


function love.update(dt)
    ButtonsManager:update()
end

function love.mousereleased( x, y, button, istouch, presses )
    ButtonsManager:mousereleased(button)
end

function love.draw()
    ButtonsManager:draw()
end
