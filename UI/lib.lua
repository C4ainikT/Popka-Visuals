local uilib = {}

function uilib.createFrame(parent, name, pos, size, color, zIndex)

	local Frame = Instance.new("Frame")
	Frame.Parent = parent
	Frame.Name = name
	Frame.Position = pos
	Frame.Size = size
	Frame.BackgroundColor3 = color
	Frame.ZIndex = zIndex or 1
	local cornerFrame = Instance.new("UICorner")
	cornerFrame.Parent = Frame
end

function uilib.createToggleButton(parent, buttonText, buttonSize, buttonPosition, toggleColor, offColor, Function, Setting)
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
	local isOpenedSetting = false

    local function updateButtonState()
        if isOn then
            button.TextColor3 = toggleColor or Color3.fromRGB(122, 122, 122)
        else
            button.TextColor3 = offColor or Color3.fromRGB(255, 255, 255)
        end
    end

	button.MouseButton1Click:Connect(function()
        isOn = not isOn
        updateButtonState()
		if Function then
			Function(isOn)
		end
		
    end)

	button.MouseButton2Click:Connect(function()
        isOpenedSetting = not isOpenedSetting
		if Setting then
			Setting(isOpenedSetting)
		end
		
    end)

	updateButtonState()

	return button
end

return uilib
