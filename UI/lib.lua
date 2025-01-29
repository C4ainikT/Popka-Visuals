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

function uilib.createToggleButton(parent, buttonText, buttonSize, buttonPosition, offColor, toggleColor, Function, Setting)

	local tween = game:GetService("TweenService")

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
            tween:Create(button, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextColor3 = toggleColor or Color3.fromRGB(122, 122, 122)}):Play()
        else
            tween:Create(button, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextColor3 = offColor or Color3.fromRGB(255, 255, 255)}):Play()
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

function uilib.createSetting(offset, size, isOpened)

	if VisualBBGui:FindFirstChild("settingTopBar") then VisualBBGui:FindFirstChild("settingTopBar"):Destroy() end
				
	local s

	if size then
		s = size
	else
		s = UDim2.new(0, 400, 0, 500),
	end

	local frame = ui.createFrame(
		popkavisualGui,
		"Settings",
		UDim2.new(0.5, 250, 0, 200),
		UDim2.new(0, 400, 0, 500),
		Color3.fromRGB(0, 0, 0),
		Color3.fromRGB(255, 255, 255),
		3
	)
end)
			
return uilib
