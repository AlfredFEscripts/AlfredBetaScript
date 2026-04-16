local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TextChatService = game:GetService("TextChatService")

-- GOOGLE LOGGING URL (DO NOT CHANGE)
local GoogleSheetURL = "https://script.google.com/macros/s/AKfycbzDJ2Q2BvwYSqs3UIqyW1PlXBJfGdPnHBbMaXKMLIooXCvfGEoi8lVIfHmT9JFIc26M/exec"

-- Chat Function
local function SendChatMessage(msg)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local channel = TextChatService.TextChannels.RBXGeneral
        channel:SendAsync(msg)
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
    end
end

local LocalPlayer = Players.LocalPlayer

-- CONFIGURATION
local OwnerUser = "Dadrails912"
local PermKey = "AIfredFESCRlPTS"
local SaveFile = "AlfredAuth.json"

-- KEYS LIST (30 Randomized Keys)
local ValidFreeKeys = {
    ["Alfredfreekey24hr"] = true,
    ["Alfredfreekey24hr-1432"] = true, ["Alfredfreekey24hr-8854"] = true, ["Alfredfreekey24hr-2109"] = true,
    ["Alfredfreekey24hr-5647"] = true, ["Alfredfreekey24hr-3321"] = true, ["Alfredfreekey24hr-9087"] = true,
    ["Alfredfreekey24hr-4456"] = true, ["Alfredfreekey24hr-1122"] = true, ["Alfredfreekey24hr-7765"] = true,
    ["Alfredfreekey24hr-6543"] = true, ["Alfredfreekey24hr-2980"] = true, ["Alfredfreekey24hr-8172"] = true,
    ["Alfredfreekey24hr-4498"] = true, ["Alfredfreekey24hr-5001"] = true, ["Alfredfreekey24hr-1987"] = true,
    ["Alfredfreekey24hr-3344"] = true, ["Alfredfreekey24hr-9981"] = true, ["Alfredfreekey24hr-2233"] = true,
    ["Alfredfreekey24hr-7070"] = true, ["Alfredfreekey24hr-6611"] = true, ["Alfredfreekey24hr-1029"] = true,
    ["Alfredfreekey24hr-8542"] = true, ["Alfredfreekey24hr-4114"] = true, ["Alfredfreekey24hr-5522"] = true,
    ["Alfredfreekey24hr-3698"] = true, ["Alfredfreekey24hr-1209"] = true, ["Alfredfreekey24hr-7431"] = true,
    ["Alfredfreekey24hr-9876"] = true, ["Alfredfreekey24hr-2580"] = true, ["Alfredfreekey24hr-4040"] = true
}

-- LOGGING FUNCTION
local function LogToSheet(key)
    local url = GoogleSheetURL .. "?username=" .. LocalPlayer.Name .. "&nickname=" .. LocalPlayer.DisplayName .. "&key=" .. key
    pcall(function()
        game:HttpGet(url)
    end)
end

local MyData = {Rank = "Guest", ExpireTime = 0}

-- AUTH LOGIC
if isfile(SaveFile) then
    local success, data = pcall(function() return HttpService:JSONDecode(readfile(SaveFile)) end)
    if success then MyData = data end
end

if LocalPlayer.Name == OwnerUser then MyData.Rank = "Owner" end

local function Save() writefile(SaveFile, HttpService:JSONEncode(MyData)) end

-- MAIN HUB
local function LoadHub()
    local Window = Rayfield:CreateWindow({
        Name = "Alfred Simple Accessories Hub",
        LoadingTitle = "Rank: " .. MyData.Rank,
        LoadingSubtitle = "by Dadrails912"
    })

    local HomeTab = Window:CreateTab("Home", 4483362458)
    HomeTab:CreateButton({Name = "Kill Script and GUI", Callback = function() Rayfield:Destroy() end})

    local ScriptTab = Window:CreateTab("Scripts", 4483362458)
    ScriptTab:CreateButton({Name = "Invisible FE", Callback = function() loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))() end})
    
    -- UPDATED FLING BUTTON
    ScriptTab:CreateButton({Name = "Fling People FE", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AlfredFEscripts/Fling-All-script./main/Fling%20people.lua"))() end})
    
    ScriptTab:CreateButton({Name = "Quizbot", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Damian-11/quizbot/master/quizbot.luau"))() end})
    ScriptTab:CreateButton({Name = "Infinite Yield", Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end})
    ScriptTab:CreateButton({Name = "Scriptblox Searcher", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))() end})
    ScriptTab:CreateButton({Name = "Delta Keyboard", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))() end})
    ScriptTab:CreateButton({Name = "Dances FE (Requires Keyboard)", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/UP-Just-a-baseplate.-KDV3-Modded-177753"))() end})
    ScriptTab:CreateButton({Name = "Sky Hub", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Sky-Hub-18710"))() end})
    ScriptTab:CreateButton({Name = "Fearless Chat Bypass", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fearless-Chat-Bypass-101789"))() end})
end

-- KEY SYSTEM STARTUP
local function StartKeySystem()
    SendChatMessage("AlfredCracked-Scripts, Welcome!")
    task.wait(2)

    if MyData.Rank == "Owner" or MyData.Rank == "Permanent" then
        LoadHub() return
    elseif MyData.Rank == "Free" and os.time() < MyData.ExpireTime then
        LoadHub() return
    end

    SendChatMessage("Access denied, Enter key to continue")

    local keyGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
    local keyFrame = Instance.new("Frame", keyGui)
    keyFrame.Size, keyFrame.Position, keyFrame.BackgroundColor3 = UDim2.new(0, 300, 0, 200), UDim2.new(0.5, -150, 0.5, -100), Color3.fromRGB(30,30,30)
    Instance.new("UICorner", keyFrame)

    local input = Instance.new("TextBox", keyFrame)
    input.Size, input.Position, input.PlaceholderText = UDim2.new(0.8, 0, 0.2, 0), UDim2.new(0.1, 0, 0.3, 0), "Enter Key..."

    local enter = Instance.new("TextButton", keyFrame)
    enter.Size, enter.Position, enter.Text, enter.BackgroundColor3 = UDim2.new(0.4, 0, 0.2, 0), UDim2.new(0.3, 0, 0.6, 0), "Enter", Color3.fromRGB(0, 150, 0)

    enter.MouseButton1Click:Connect(function()
        if input.Text == PermKey then
            MyData.Rank = "Permanent"
            Save()
            LogToSheet("PERM_KEY")
            keyGui:Destroy()
            LoadHub()
        elseif ValidFreeKeys[input.Text] then
            MyData.Rank = "Free"
            MyData.ExpireTime = os.time() + 86400
            Save()
            LogToSheet(input.Text) -- This writes to your sheet!
            keyGui:Destroy()
            LoadHub()
        else
            input.Text = ""
            input.PlaceholderText = "Invalid!"
        end
    end)
end

StartKeySystem()
