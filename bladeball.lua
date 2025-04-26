```lua
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local localPlayer = Players.LocalPlayer
local clicked = false

RunService.RenderStepped:Connect(function()
    local playerModel = workspace:FindFirstChild("Alive") and workspace.Alive:FindFirstChild(localPlayer.Name)
    local ball = workspace:FindFirstChild("Balls") and workspace.Balls:FindFirstChild("Ball")

    if playerModel and ball and playerModel:FindFirstChild("HumanoidRootPart") then
        local ballPos = ball:GetPivot().Position
        local playerPos = playerModel.HumanoidRootPart.Position
        local distance = (ballPos - playerPos).Magnitude

        if distance <= 20 and not clicked then
            clicked = true
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
            wait()
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
            print("Pressed F!")
        elseif distance > 20 then
            clicked = false
        end
```