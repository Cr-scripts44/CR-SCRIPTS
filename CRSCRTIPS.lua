local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CRHUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

-- CR ICON
local Icon = Instance.new("TextButton")
Icon.Size = UDim2.new(0,55,0,55)
Icon.Position = UDim2.new(0.05,0,0.5,0)
Icon.BackgroundColor3 = Color3.fromRGB(0,0,0)
Icon.BackgroundTransparency = 0.2
Icon.Text = "CR"
Icon.TextColor3 = Color3.new(1,1,1)
Icon.Font = Enum.Font.GothamBold
Icon.TextSize = 20
Icon.AutoButtonColor = false
Icon.Parent = ScreenGui
Instance.new("UICorner", Icon).CornerRadius = UDim.new(1,0)

-- CR MAIN HUB
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0,360,0,180)
Main.Position = UDim2.new(0.32,0,0.28,0)
Main.BackgroundColor3 = Color3.fromRGB(15,15,15)
Main.BackgroundTransparency = 0.35
Main.Visible = false
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,14)

-- RAINBOW BORDER
local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 2.5
Stroke.Parent = Main

-- CR TITLE
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,45)
Title.BackgroundTransparency = 1
Title.Text = "CR WareX"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.new(1,1,1)
Title.Parent = Main

-- CR AUTO GRAB BUTTON
local GrabBtn = Instance.new("TextButton")
GrabBtn.Size = UDim2.new(0.8,0,0,50)
GrabBtn.Position = UDim2.new(0.1,0,0.35,0)
GrabBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
GrabBtn.Text = "CR Auto Grab"
GrabBtn.Font = Enum.Font.GothamBold
GrabBtn.TextSize = 20
GrabBtn.TextColor3 = Color3.new(1,1,1)
GrabBtn.Parent = Main
Instance.new("UICorner", GrabBtn).CornerRadius = UDim.new(0,12)

-- CR KIK BUTTON
local KikBtn = Instance.new("TextButton")
KikBtn.Size = UDim2.new(0.8,0,0,50)
KikBtn.Position = UDim2.new(0.1,0,0.65,0)
KikBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
KikBtn.Text = "CR Kik"
KikBtn.Font = Enum.Font.GothamBold
KikBtn.TextSize = 20
KikBtn.TextColor3 = Color3.new(1,1,1)
KikBtn.Parent = Main
Instance.new("UICorner", KikBtn).CornerRadius = UDim.new(0,12)

-- TOGGLE HUB
Icon.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)

-- DRAG ICON
local dragI, startI, posI
Icon.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragI = true
        startI = i.Position
        posI = Icon.Position
    end
end)

UserInputService.InputChanged:Connect(function(i)
    if dragI and i.UserInputType == Enum.UserInputType.MouseMovement then
        local d = i.Position - startI
        Icon.Position = UDim2.new(posI.X.Scale, posI.X.Offset + d.X, posI.Y.Scale, posI.Y.Offset + d.Y)
    end
end)

UserInputService.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragI = false
    end
end)

-- DRAG HUB
local dragM, startM, posM
Main.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragM = true
        startM = i.Position
        posM = Main.Position
    end
end)

UserInputService.InputChanged:Connect(function(i)
    if dragM and i.UserInputType == Enum.UserInputType.MouseMovement then
        local d = i.Position - startM
        Main.Position = UDim2.new(posM.X.Scale, posM.X.Offset + d.X, posM.Y.Scale, posM.Y.Offset + d.Y)
    end
end)

UserInputService.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragM = false
    end
end)

-- RAINBOW
local h = 0
RunService.RenderStepped:Connect(function()
    h = (h + 1) % 360
    Stroke.Color = Color3.fromHSV(h/360,1,1)
end)

-- CR AUTO GRAB FUNCTION
local grabting = false
GrabBtn.MouseButton1Click:Connect(function()
    grabting = not grabting
    if grabting then
        GrabBtn.Text = "CR Auto Grab ✅"
    else
        GrabBtn.Text = "CR Auto Grab"
    end
end)

-- CR AUTO GRAB LOOP
RunService.RenderStepped:Connect(function()
    if grabting then
        for _, item in pairs(workspace:GetChildren()) do
            if item.Name:lower():find("cr") then
                if item:IsA("Model") and item:FindFirstChild("TouchInterest") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = item:GetModelCFrame() or item:GetModelCFrame()
                end
            end
        end
    end
end)

-- CR KIK BUTTON
KikBtn.MouseButton1Click:Connect(function() end)