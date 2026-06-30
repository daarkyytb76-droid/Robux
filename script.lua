local CoreGui = game:GetService("CoreGui")
local Debris = game:GetService("Debris")
local StarterGui = game:GetService("StarterGui")

pcall(function()
	StarterGui:SetCore("TopbarEnabled", false)
end)

local gui = Instance.new("ScreenGui")
gui.Name = "FakeVirus"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999999
gui.Parent = CoreGui

local messages = {
	"T VRAIMENT CON !",
	"FDP",
	"TA VRAIMENT CRUE FDP",
	"ACHETE LES FDP",
	"T UN CLOCHARD ?"
}

for i = 1, 1000 do
	task.spawn(function()
		local baseZ = i * 10

		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(0, 250, 0, 120)
		frame.Position = UDim2.new(
			math.random(),
			-125,
			math.random(),
			-60
		)
		frame.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
		frame.BorderSizePixel = 2
		frame.ClipsDescendants = true
		frame.ZIndex = baseZ
		frame.Parent = gui

		local topBar = Instance.new("Frame")
		topBar.Size = UDim2.new(1, 0, 0, 30)
		topBar.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
		topBar.ZIndex = baseZ + 1
		topBar.Parent = frame

		local title = Instance.new("TextLabel")
		title.Size = UDim2.new(1, -30, 1, 0)
		title.BackgroundTransparency = 1
		title.TextColor3 = Color3.new(1, 1, 1)
		title.TextScaled = true
		title.Text = "popup"
		title.ZIndex = baseZ + 2
		title.Parent = topBar

		local closeBtn = Instance.new("TextButton")
		closeBtn.Size = UDim2.new(0, 30, 1, 0)
		closeBtn.Position = UDim2.new(1, -30, 0, 0)
		closeBtn.BackgroundTransparency = 1
		closeBtn.Text = "❌"
		closeBtn.TextColor3 = Color3.new(1, 1, 1)
		closeBtn.TextScaled = true
		closeBtn.ZIndex = baseZ + 2
		closeBtn.Parent = topBar

		local textBg = Instance.new("Frame")
		textBg.Size = UDim2.new(1, 0, 1, -30)
		textBg.Position = UDim2.new(0, 0, 0, 30)
		textBg.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
		textBg.BorderSizePixel = 0
		textBg.ZIndex = baseZ + 1
		textBg.Parent = frame

		local text = Instance.new("TextLabel")
		text.Size = UDim2.new(1, -20, 1, -20)
		text.Position = UDim2.new(0, 10, 0, 10)
		text.BackgroundTransparency = 1
		text.TextWrapped = true
		text.TextScaled = true
		text.Text = messages[((i - 1) % #messages) + 1]
		text.ZIndex = baseZ + 2
		text.Parent = textBg

		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://138081500"
		sound.Volume = 2
		sound.Parent = frame
		sound:Play()

		Debris:AddItem(sound, 2)

		closeBtn.MouseButton1Click:Connect(function()
			frame:Destroy()
		end)
	end)

	task.wait(0.1)
end
