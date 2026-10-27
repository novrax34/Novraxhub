-- MADE BY NOVRAX - CUSTOM HUD & STATUS MENU
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

if CoreGui:FindFirstChild("NovraxMenuGui") then
    CoreGui.NovraxMenuGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NovraxMenuGui"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Ana Pencere (Gövde)
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -100)
MainFrame.Size = UDim2.new(0, 320, 0, 180)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true

-- Sol Menü (Tuşlar Paneli)
local Sidebar = Instance.new("Frame")
Sidebar.Parent = MainFrame
Sidebar.Size = UDim2.new(0, 90, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Sidebar.BorderSizePixel = 0

-- Sağ İçerik Paneli (Seçilen Sekmeye Göre Değişir)
local ContentArea = Instance.new("Frame")
ContentArea.Parent = MainFrame
ContentArea.Position = UDim2.new(0, 95, 0, 0)
ContentArea.Size = UDim2.new(1, -95, 1, 0)
ContentArea.BackgroundTransparency = 1

-----------------------------------------------------------------
-- İÇERİK SAYFALARI (PANELLER)
-----------------------------------------------------------------

-- 1. Info Paneli
local InfoPage = Instance.new("TextLabel")
InfoPage.Parent = ContentArea
InfoPage.Size = UDim2.new(1, 0, 1, 0)
InfoPage.BackgroundTransparency = 1
InfoPage.Font = Enum.Font.SourceSansBold
InfoPage.Text = "MADE BY NOVRAX\n\nCustom UI Hub\nBlox Fruits Edition"
InfoPage.TextColor3 = Color3.fromRGB(255, 50, 50)
InfoPage.TextSize = 15
InfoPage.Visible = true

-- 2. Status Paneli
local StatusPage = Instance.new("Frame")
StatusPage.Parent = ContentArea
StatusPage.Size = UDim2.new(1, 0, 1, 0)
StatusPage.BackgroundTransparency = 1
StatusPage.Visible = false

local TimeLabel = Instance.new("TextLabel")
TimeLabel.Parent = StatusPage
TimeLabel.Size = UDim2.new(1, 0, 0, 30)
TimeLabel.Position = UDim2.new(0, 0, 0, 20)
TimeLabel.BackgroundTransparency = 1
TimeLabel.Font = Enum.Font.SourceSansBold
TimeLabel.Text = "Server Time: --"
TimeLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
TimeLabel.TextSize = 14

local PlayersLabel = Instance.new("TextLabel")
PlayersLabel.Parent = StatusPage
PlayersLabel.Size = UDim2.new(1, 0, 0, 30)
PlayersLabel.Position = UDim2.new(0, 0, 0, 60)
PlayersLabel.BackgroundTransparency = 1
PlayersLabel.Font = Enum.Font.SourceSansBold
PlayersLabel.Text = "Players: --"
PlayersLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
PlayersLabel.TextSize = 14

-- 3. FPS Boost Paneli
local FpsPage = Instance.new("Frame")
FpsPage.Parent = ContentArea
FpsPage.Size = UDim2.new(1, 0, 1, 0)
FpsPage.BackgroundTransparency = 1
FpsPage.Visible = false

local FpsToggleBtn = Instance.new("TextButton")
FpsToggleBtn.Parent = FpsPage
FpsToggleBtn.Size = UDim2.new(0, 180, 0, 40)
FpsToggleBtn.Position = UDim2.new(0, 15, 0, 30)
FpsToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FpsToggleBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
FpsToggleBtn.Font = Enum.Font.SourceSansBold
FpsToggleBtn.Text = "FPS Boost: OFF"
FpsToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FpsToggleBtn.TextSize = 14

-----------------------------------------------------------------
-- SOL MENÜ BUTONLARI
-----------------------------------------------------------------

local function hideAllPages()
    InfoPage.Visible = false
    StatusPage.Visible = false
    FpsPage.Visible = false
end

-- Tuş 1: Info
local BtnInfo = Instance.new("TextButton")
BtnInfo.Parent = Sidebar
BtnInfo.Size = UDim2.new(1, 0, 0, 40)
BtnInfo.Position = UDim2.new(0, 0, 0, 20)
BtnInfo.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
BtnInfo.BorderSizePixel = 0
BtnInfo.Font = Enum.Font.SourceSansBold
BtnInfo.Text = "Info"
BtnInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnInfo.TextSize = 14
BtnInfo.MouseButton1Click:Connect(function()
    hideAllPages()
    InfoPage.Visible = true
end)

-- Tuş 2: Status
local BtnStatus = Instance.new("TextButton")
BtnStatus.Parent = Sidebar
BtnStatus.Size = UDim2.new(1, 0, 0, 40)
BtnStatus.Position = UDim2.new(0, 0, 0, 70)
BtnStatus.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
BtnStatus.BorderSizePixel = 0
BtnStatus.Font = Enum.Font.SourceSansBold
BtnStatus.Text = "Status"
BtnStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnStatus.TextSize = 14
BtnStatus.MouseButton1Click:Connect(function()
    hideAllPages()
    StatusPage.Visible = true
end)

-- Tuş 3: FPS
local BtnFps = Instance.new("TextButton")
BtnFps.Parent = Sidebar
BtnFps.Size = UDim2.new(1, 0, 0, 40)
BtnFps.Position = UDim2.new(0, 0, 0, 120)
BtnFps.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
BtnFps.BorderSizePixel = 0
BtnFps.Font = Enum.Font.SourceSansBold
BtnFps.Text = "FPS"
BtnFps.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnFps.TextSize = 14
BtnFps.MouseButton1Click:Connect(function()
    hideAllPages()
    FpsPage.Visible = true
end)

-----------------------------------------------------------------
-- ARKA PLAN LOOP & FPS BOOST FONKSİYONU
-----------------------------------------------------------------

local boostActive = false

FpsToggleBtn.MouseButton1Click:Connect(function()
    boostActive = not boostActive
    if boostActive then
        FpsToggleBtn.Text = "FPS Boost: ON"
        FpsToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        -- FPS Boost Uygula
        pcall(function()
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 9e9
            local Terrain = workspace:FindFirstChildOfClass('Terrain')
            if Terrain then
                Terrain.WaterWaveSize = 0
                Terrain.WaterWaveSpeed = 0
                Terrain.WaterReflectance = 0
                Terrain.WaterTransparency = 0
            end
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
                    v.Material = Enum.Material.SmoothPlastic
                    v.Reflectance = 0
                elseif v:IsA("Decal") or v:IsA("Texture") then
                    v:Destroy()
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Enabled = false
                end
            end
        end)
    else
        FpsToggleBtn.Text = "FPS Boost: OFF"
        FpsToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)

-- Status Bilgilerini Güncelleme Döngüsü
RunService.RenderStepped:Connect(function()
    if StatusPage.Visible then
        local hours = math.floor(workspace.DistributedGameTime / 3600)
        local minutes = math.floor((workspace.DistributedGameTime % 3600) / 60)
        local seconds = math.floor(workspace.DistributedGameTime % 60)
        TimeLabel.Text = string.format("Server Time: %02d:%02d:%02d", hours, minutes, seconds)
        
        local playerCount = #Players:GetPlayers()
        PlayersLabel.Text = "Players: " .. playerCount .. " / " .. Players.MaxPlayers
    end
end)
