local uilib = {}

function uilib.createToggleButton(parent, buttonText, buttonSize, buttonPosition, onToggleFunction, LKM, toggleColor, offColor)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Size = buttonSize
    button.Position = buttonPosition
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BorderColor3 = Color3.fromRGB(0, 0, 0)
    button.Font = Enum.Font.Arimo
    button.TextSize = 18
    button.TextDirection = Enum.TextDirection.LeftToRight
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.AutoButtonColor = false
    button.Text = buttonText

    local isOn = false

    local function updateButtonState()
        if isOn then
            button.TextColor3 = toggleColor or Color3.fromRGB(122, 122, 122)
        else
            button.TextColor3 = offColor or Color3.fromRGB(255, 255, 255)
        end
    end

    updateButtonState()

    button.MouseButton1Click:Connect(function()
        isOn = not isOn
        updateButtonState()
        if onToggleFunction then
            onToggleFunction(isOn)
        end
    end)
    
    button.MouseButton2Click:Connect(function()
        LKM()
    end)
    
    return button
end

return uilib
