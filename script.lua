local player = game.Players.LocalPlayer
local SoundService = game:GetService("SoundService")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "FakeVirus"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- messages safe
local messages = {
	"Système en cours...",
	"Erreur détectée",
	"Analyse du système...",
	"Avertissement",
	"Connexion instable"
}

-- SON
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://138081500" -- ton son popup
sound.Volume = 2
sound.Parent = SoundService

sound:Play()

-- POPUPS (limité pour éviter crash)
for i = 1, 150 do
	task.spawn(function()
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(0, 250, 0, 120)
		frame.Position = UDim2.new(
			math.random(),
			-125,
			math.random(),
			-60
		)
		frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		frame.BorderSizePixel = 0
		frame.Parent = gui

		local title = Instance.new("TextLabel")
		title.Size = UDim2.new(1, 0, 0, 30)
		title.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
		title.TextColor3 = Color3.new(1, 1, 1)
		title.TextScaled = true
		title.Text = "SYSTEM"
		title.Parent = frame

		local text = Instance.new("TextLabel")
		text.Size = UDim2.new(1, -20, 1, -50)
		text.Position = UDim2.new(0, 10, 0, 40)
		text.BackgroundTransparency = 1
		text.TextWrapped = true
		text.TextScaled = true
		text.TextColor3 = Color3.new(1,1,1)
		text.Text = messages[((i - 1) % #messages) + 1]
		text.Parent = frame
	end)

	task.wait(0.05)
end
