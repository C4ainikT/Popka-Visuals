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

    local function updateButtonState()
        if isOn then
            tween:Create(button, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextColor3 = offColor or Color3.fromRGB(255, 255, 255)}):Play()
        else
            tween:Create(button, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextColor3 = toggleColor or Color3.fromRGB(255, 255, 0)}):Play()
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
		Setting()
    end)

	updateButtonState()

	return button
end

			
function uilib.createSetting(parent, offset, size, id)
    if parent:FindFirstChild("Settings") then parent:FindFirstChild("Settings"):Destroy() end

	local idn 
	if idn == id then parent:FindFirstChild("Settings"):Destroy() end
	idn = id

    local s
    if size then
        s = size
    else
        s = UDim2.new(0, 400, 0, 500)
	end

    local frame = uilib.createFrame(
        parent,
        "Settings",
        UDim2.new(0.5, 250, 0, 200),
        UDim2.new(0, 400, 0, 500),
        Color3.fromRGB(0, 0, 0),
        Color3.fromRGB(255, 255, 255),
        3
    )
    return frame
end

print(2.1)
			
return uilib
