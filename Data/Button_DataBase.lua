local Button_DataBase = {
    Red_Button = {
        default = "Textures/My Buttons/RedButtonDefault 1.png",
        hover = "Textures/My Buttons/RedButtonHover 1.png",
        pressed = "Textures/My Buttons/RedButtonPressed 1.png"
    },
    Blue_Button = {
        default = "Textures/My Buttons/BlueButtonDefault 1.png",
        hover = "Textures/My Buttons/BlueButtonHover 1.png",
        pressed = "Textures/My Buttons/BlueButtonPressed 1.png"
    },
    Blue_Small_Button = {
        default = "Textures/My Buttons/BlueSmallDefault 1.png",
        hover = "Textures/My Buttons/BlueSmallHover 1.png",
        pressed = "Textures/My Buttons/BlueSmallPressed 1.png"
    }
}

function ConvertToTextures(TexturePaths)
    local key = {"default","hover","pressed"}
    local TextureTable = {}

    for i = 1, 3 do
        TextureTable[key[i]] = love.graphics.newImage(TexturePaths[key[i]])
    end
    
    return TextureTable
end

return Button_DataBase
