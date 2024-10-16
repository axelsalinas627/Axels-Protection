-- Axels Protection
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local myzaza = false

-- Create control button
local function createControlButton()
    local screenGui = Instance.new("ScreenGui")
    local button = Instance.new("TextButton")

    screenGui.Name = "KillBlockControlGUI"
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    button.Name = "ToggleKillBlockButton"
    button.Size = UDim2.new(0, 100, 0, 25)
    button.Position = UDim2.new(0.5, -50, 0, 23)
    button.Text = "Axels Protection"
    button.Parent = screenGui

    button.MouseButton1Click:Connect(function()
        myzaza = not myzaza
        if myzaza then
            button.Text = "Protection OFF"
        else
            button.Text = "Protection ON"
        end
    end)
end

createControlButton()

while task.wait() do
    local parts = workspace:GetPartBoundsInRadius(humanoidRootPart.Position, 10)
    for _, part in ipairs(parts) do
        part.CanTouch = myzaza
    end
end
