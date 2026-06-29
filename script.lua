local player = game.Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "FakeVirus"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local messages = {
	"T VRAIMENT CON !",
	"FDP",
	"TA VRAIMENT CRUE FDP",
	"ACHETE LES FDP",
	"T UN CLOCHARD ?"
}

-- SON (corrigé)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9118823105"
sound.Volume = 2
sound.Parent = game:GetService("SoundService")

-- charge le son correctement
sound:LoadAsync()
sound:Play()

-- limite pour éviter crash (IMPORTANT)
for i = 1, 900 do
	task.spawn(function()
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
		frame.Parent = gui

		local title = Instance.new("TextLabel")
		title.Size = UDim2.new(1, 0, 0, 30)
		title.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
		title.TextColor3 = Color3.new(1, 1, 1)
		title.TextScaled = true
		title.Text = "popup"
		title.Parent = frame

		local text = Instance.new("TextLabel")
		text.Size = UDim2.new(1, -20, 1, -50)
		text.Position = UDim2.new(0, 10, 0, 40)
		text.BackgroundTransparency = 1
		text.TextWrapped = true
		text.TextScaled = true
		text.Text = messages[((i - 1) % #messages) + 1]
		text.Parent = frame
	end)

	task.wait(0.05)
end
