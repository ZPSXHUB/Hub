function Tween2(P1)
    local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance >= 1 then
    Speed = 300
    end
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear), {
      CFrame = P1
    }):Play()
    if _G.CancelTween2 then
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear), {
      CFrame = P1
    }):Cancel()
    end
    _G.Clip2 = true
    wait(Distance/Speed)
    _G.Clip2 = false
end

function Function3()
    repeat
        wait()
    until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        AllNPCS = getnilinstances()
        for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            table.insert(AllNPCS, v)
        end
        for r, v in pairs(AllNPCS) do
            if v.Name == "Advanced Fruit Dealer" then
                Tween2(v.HumanoidRootPart.CFrame)
            end
        end
    end
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Blox Fruits Script",
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightControl
})
local Tabs = {
    Main = Window:AddTab({ Title = "Mystic Islands", Icon = "" }),
}

spawn(function()
    while task.wait() do
        pcall(function()
            if TweenMystic or TweenGear or TweenMystic1 then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if TweenMystic or TweenGear or TweenMystic1 then
                for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)
Tabs.Main:AddButton({
    Title = "First Sea 1",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})



Tabs.Main:AddButton({
    Title = "Second Sea 2",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})



Tabs.Main:AddButton({
    Title = "Third Sea 3",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})
Tabs.Main:AddButton({
    Title = "TP Mirage",
    Description = "",
    Callback = function()
        Tween2(workspace._WorldOrigin.Locations["Mirage Island"].CFrame * CFrame.new(0,500,0))
    end
})

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Tween Mystic", Default = false })

Toggle:OnChanged(function(Value)
    TweenMystic = Value
end)
local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Tween Mystic", Default = false })

Toggle:OnChanged(function(Value)
    TweenMystic1 = Value
end)
local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Tween Gear", Default = false })

Toggle:OnChanged(function(Value)
    TweenGear = Value
end)
spawn(function()
    while wait() do
        if TweenGear then
            local MysticIsland = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
            if MysticIsland then
                for _, part in pairs(MysticIsland:GetChildren()) do 
                    if part:IsA("MeshPart") and part.Material == Enum.Material.Neon then  
                        Tween2(part.CFrame)
                    end
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if TweenMystic then
            Function3()
        end
    end
end)
function Function2()
    local MysticIsland = game.workspace.Map:FindFirstChild("MysticIsland")
    if not MysticIsland then return nil end

    for _, part in pairs(MysticIsland:GetDescendants()) do
        if part:IsA("MeshPart") and part.MeshId == "rbxassetid://6745037796" then
            return part
        end
    end
end

function Function1()
    local HighestPoint = Function2()
    if HighestPoint then
        Tween2(HighestPoint.CFrame * CFrame.new(0, 211.88, 0))
    end
end

spawn(function()
    while wait() do
        if TweenMystic1 then
            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                local HighestPointRealCFrame = Function2().CFrame
                if HighestPointRealCFrame and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - HighestPointRealCFrame.Position).Magnitude > 10 then
                    Tween2(HighestPointRealCFrame * CFrame.new(0, 211.88, 0))
                end
            else

            end
        end
    end
end)
local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Auto Gat Can [Beta]", Default = false })

Toggle:OnChanged(function(Value)
    AutoGatCan = Value
    LockFullMoon = false
end)

function Noti(a,b,c)
    Fluent:Notify({
        Title = a,
        Content = b,
        SubContent = "Mystic Island Notication",
        Duration = c
    })
end
function GetItem(title)
    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v.Name == title then
            return v
        end
    end
end
function TweenTempleLegit()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
    AllNPCS = getnilinstances()
    for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        table.insert(AllNPCS, v)
    end
    for r, v in pairs(AllNPCS) do
        if v.Name == "Mysterious Force" then
            TempleMysteriousNPC1 = v
        end
        if v.Name == "Mysterious Force3" then
            TempleMysteriousNPC2 = v
        end
    end
    Tween2(TempleMysteriousNPC2.HumanoidRootPart.CFrame)
    wait(0.5)
    if
        (TempleMysteriousNPC2.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
            15
     then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
    end
    if
        (TempleMysteriousNPC1.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
            15
     then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
    end
end 
spawn(function()
 while wait() do
   if LockFullMoon then
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
   end
 end
end)
function getBlueGear()
    if game.workspace.Map:FindFirstChild("MysticIsland") then
        for r, v in pairs(game.workspace.Map.MysticIsland:GetChildren()) do
            if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then
                return v
            end
        end
    end
end
spawn(function()
    while wait() do
       if AutoGatCan then
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
                Noti('Notication',"Đã Gạt Cần Hoặc Đã Gạt Cần Thành Công",3)
                wait(3)
            elseif not GetItem("Mirror Fractal") then
                Noti('Notication',"Không Tìm Thấy Mảnh Gương",3)
                wait(3)
            elseif not GetItem("Valkyrie Helm") then
                Noti('Notication',"Không Tìm Thấy Mũ",3)
                wait(3)
            else
                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 1 then
                    Noti("Script Status", "Begin", 10)
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
                elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 2 then
                    Noti("Script Status", "Conitnue Time 1", 10)
                    TweenTempleLegit()
                elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 3 then
                    Noti("Script Status", "Continue Time 2", 10)
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
                elseif game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    local HighestPointRealCFrame = Function2().CFrame
                    if HighestPointRealCFrame and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - HighestPointRealCFrame.Position).Magnitude > 10 then
                        Tween2(HighestPointRealCFrame * CFrame.new(0, 211.88, 0))
                    else
                        BlueGear = getBlueGear()
                        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
                        LockFullMoon = false
                        elseif BlueGear and not BlueGear.CanCollide and BlueGear.Transparency ~= 1 then
                            repeat
                                wait()
                                TweentoBlueGear()
                            until not getBlueGear() or getBlueGear().Transparency == 1
                            LockFullMoon = false
                            Noti('Notication',"Đã Gạt Cần",3)
                        else
                            LockFullMoon = true
                            game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                            task.wait()
                            game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                            task.wait(1.5)
                        end
                    end
                else
                    Noti('Notication',"Không Thể Tìm Thấy Đảo Bí Ẩn",3)
                    wait(3)
                end
            end
       end
    end
end)
