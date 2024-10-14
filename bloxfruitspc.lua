function Tween2(a)
    local b = (a.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if b >= 1 then
        Speed = 300
    end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(b / Speed, Enum.EasingStyle.Linear),
        {CFrame = a}
    ):Play()
    if _G.CancelTween2 then
        game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(b / Speed, Enum.EasingStyle.Linear),
            {CFrame = a}
        ):Cancel()
    end
    _G.Clip2 = true
    wait(b / Speed)
    _G.Clip2 = false
end
function Function3()
    repeat
        wait()
    until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        AllNPCS = getnilinstances()
        for c, d in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            table.insert(AllNPCS, d)
        end
        for c, d in pairs(AllNPCS) do
            if d.Name == "Advanced Fruit Dealer" then
                Tween2(d.HumanoidRootPart.CFrame)
            end
        end
    end
end
local e = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local f =
    e:CreateWindow(
    {
        Title = "Blox Fruits Script",
        SubTitle = "",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Darker",
        MinimizeKey = Enum.KeyCode.RightControl
    }
)
local g = {Main = f:AddTab({Title = "Mystic Islands", Icon = ""})}
spawn(
    function()
        while task.wait() do
            pcall(
                function()
                    if TweenMystic or TweenGear or TweenMystic1 or AutoGatCan or LevelFarm or Farm then
                        if
                            not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild(
                                "BodyClip"
                            )
                         then
                            local h = Instance.new("BodyVelocity")
                            h.Name = "BodyClip"
                            h.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                            h.MaxForce = Vector3.new(100000, 100000, 100000)
                            h.Velocity = Vector3.new(0, 0, 0)
                        end
                    else
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy(

                        )
                    end
                end
            )
        end
    end
)
spawn(
    function()
        pcall(
            function()
                game:GetService("RunService").Stepped:Connect(
                    function()
                        if TweenMystic or TweenGear or TweenMystic1 or AutoGatCan or LevelFarm or Farm then
                            for i, d in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                                if d:IsA("BasePart") then
                                    d.CanCollide = false
                                end
                            end
                        end
                    end
                )
            end
        )
    end
)
g.Main:AddButton(
    {Title = "First Sea 1", Description = "", Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
        end}
)
g.Main:AddButton(
    {Title = "Second Sea 2", Description = "", Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        end}
)
g.Main:AddButton(
    {Title = "Third Sea 3", Description = "", Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
        end}
)
g.Main:AddButton(
    {Title = "TP Mirage", Description = "", Callback = function()
            Tween2(workspace._WorldOrigin.Locations["Mirage Island"].CFrame * CFrame.new(0, 500, 0))
        end}
)
local j = g.Main:AddToggle("MyToggle", {Title = "Tween Mystic", Default = false})
j:OnChanged(
    function(k)
        TweenMystic = k
    end
)
local j = g.Main:AddToggle("MyToggle", {Title = "Tween Mystic", Default = false})
j:OnChanged(
    function(k)
        TweenMystic1 = k
    end
)
local j = g.Main:AddToggle("MyToggle", {Title = "Tween Gear", Default = false})
j:OnChanged(
    function(k)
        TweenGear = k
    end
)
spawn(
    function()
        while wait() do
            if TweenGear then
                local l = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                if l then
                    for m, n in pairs(l:GetChildren()) do
                        if n:IsA("MeshPart") and n.Material == Enum.Material.Neon then
                            Tween2(n.CFrame)
                        end
                    end
                end
            end
        end
    end
)
spawn(
    function()
        while wait() do
            if TweenMystic then
                Function3()
            end
        end
    end
)
function Function2()
    local l = game.workspace.Map:FindFirstChild("MysticIsland")
    if not l then
        return nil
    end
    for m, n in pairs(l:GetDescendants()) do
        if n:IsA("MeshPart") and n.MeshId == "rbxassetid://6745037796" then
            return n
        end
    end
end
function Function1()
    local o = Function2()
    if o then
        Tween2(o.CFrame * CFrame.new(0, 211.88, 0))
    end
end
spawn(
    function()
        while wait() do
            if TweenMystic1 then
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    local p = Function2().CFrame
                    if p and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - p.Position).Magnitude > 10 then
                        Tween2(p * CFrame.new(0, 211.88, 0))
                    end
                else
                end
            end
        end
    end
)
local j = g.Main:AddToggle("MyToggle", {Title = "Auto Gat Can [Beta]", Default = false})
j:OnChanged(
    function(k)
        AutoGatCan = k
        LockFullMoon = false
    end
)
local j = g.Main:AddToggle("MyToggle", {Title = "Lock Moon", Default = false})
j:OnChanged(
    function(k)
        LockFullMoon1 = k
    end
)
spawn(
    function()
        while wait() do
            if LockFullMoon1 then
                workspace.CurrentCamera.CFrame =
                    CFrame.new(
                    workspace.CurrentCamera.CFrame.Position,
                    game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position
                )
            end
        end
    end
)
function Noti(q, r, t)
    e:Notify({Title = q, Content = r, SubContent = "Mystic Island Notication", Duration = t})
end
function GetItem(u)
    for i, d in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if d.Name == u then
            return d
        end
    end
end
function TweenTempleLegit()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
        "requestEntrance",
        Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586)
    )
    if getnilinstances then
        AllNPCS = getnilinstances()
        for c, d in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            table.insert(AllNPCS, d)
        end
        for c, d in pairs(AllNPCS) do
            if d.Name == "Mysterious Force" then
                TempleMysteriousNPC1 = d
            end
            if d.Name == "Mysterious Force3" then
                TempleMysteriousNPC2 = d
            end
        end
    else
        AllNPCS = {}
        for c, d in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            table.insert(AllNPCS, d)
        end
        for c, d in pairs(AllNPCS) do
            if d.Name == "Mysterious Force" then
                TempleMysteriousNPC1 = d
            end
            if d.Name == "Mysterious Force3" then
                TempleMysteriousNPC2 = d
            end
        end
    end
    if not TempleMysteriousNPC2:FindFirstChild("HumanoidRootPart") then
        Tween2(CFrame.new(28558, 14897, 88))
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
        TempleMysteriousNPC1:FindFirstChild("HumanoidRootPart") and
            (TempleMysteriousNPC1.HumanoidRootPart.Position -
                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 15
     then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
    end
end
spawn(
    function()
        while wait() do
            if LockFullMoon then
                workspace.CurrentCamera.CFrame =
                    CFrame.new(
                    workspace.CurrentCamera.CFrame.Position,
                    game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position
                )
            end
        end
    end
)
function getBlueGear()
    if game.workspace.Map:FindFirstChild("MysticIsland") then
        for c, d in pairs(game.workspace.Map.MysticIsland:GetChildren()) do
            if d:IsA("MeshPart") and d.MeshId == "rbxassetid://10153114969" then
                return d
            end
        end
    end
end
spawn(
    function()
        while wait() do
            if AutoGatCan then
                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
                    Noti("Notication", "Đã Gạt Cần Hoặc Đã Gạt Cần Thành Công", 3)
                    wait(3)
                elseif not GetItem("Mirror Fractal") then
                    Noti("Notication", "Không Tìm Thấy Mảnh Gương", 3)
                    wait(3)
                elseif not GetItem("Valkyrie Helm") then
                    Noti("Notication", "Không Tìm Thấy Mũ", 3)
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
                        local p = Function2().CFrame
                        if
                            p and
                                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - p.Position).Magnitude >
                                    10
                         then
                            Tween2(p * CFrame.new(0, 211.88, 0))
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
                                Noti("Notication", "Đã Gạt Cần", 3)
                            else
                                LockFullMoon = true
                                game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                                task.wait()
                                game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                                task.wait(1.5)
                            end
                        end
                    else
                        Noti("Notication", "Không Thể Tìm Thấy Đảo Bí Ẩn", 3)
                        wait(3)
                    end
                end
            end
        end
    end
)
local g = {Main = f:AddTab({Title = "Farm", Icon = ""})}
local v =
    g.Main:AddDropdown("Dropdown", {Title = "Select Weapon", Values = {"Melee", "Sword"}, Multi = false, Default = 1})
v:OnChanged(
    function(k)
        gafga = k
    end
)
local j = g.Main:AddToggle("MyToggle", {Title = "Mob Aura", Default = false})
function StopTween()
    Tween2(game.Players.LocalPlayer.Character.Head.CFrame)
end
j:OnChanged(
    function(k)
        LevelFarm = k
        Farm = k
        StopTween()
    end
)
function Click()
    local w = game:GetService("VirtualUser")
    w:CaptureController()
    w:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end
function EnableBuso()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        NoClip = true
        local x = {[1] = "Buso"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(x))
        NoClip = false
    end
    NoClip = false
end
function GetWeapon(y)
    s = ""
    for c, d in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if d:IsA("Tool") and d.ToolTip == y then
            s = d.Name
        end
    end
    for c, d in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if d:IsA("Tool") and d.ToolTip == y then
            s = d.Name
        end
    end
    return s
end
function EquipWeapon(z)
    if gafga == "" or gafga == nil then
        gafga = "Melee"
    end
    z = GetWeapon(gafga)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(z) then
        NoClip = true
        local A = game.Players.LocalPlayer.Backpack:FindFirstChild(z)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(A)
        NoClip = false
    end
end
spawn(
    function()
        while wait() do
            if LevelFarm then
                for i, d in pairs(game.Workspace.Enemies:GetChildren()) do
                    if
                        d:FindFirstChild("Humanoid") and d.Humanoid.Health ~= 0 and d:FindFirstChild("HumanoidRootPart") and
                            (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - d.HumanoidRootPart.Position).magnitude <
                                1500
                     then
                        repeat
                            wait()
                            if LevelFarm then
                                Tween2(d.HumanoidRootPart.CFrame * CFrame.new(10, 10, 10))
                                d.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                PosLevelFarm = d.HumanoidRootPart.CFrame
                                for B, C in pairs(game.Workspace.Enemies:GetChildren()) do
                                    if
                                        C:FindFirstChild("Humanoid") and C:FindFirstChild("HumanoidRootPart") and
                                            (C.HumanoidRootPart.Position - d.HumanoidRootPart.Position).magnitude < 170
                                     then
                                        C.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        C.HumanoidRootPart.CanCollide = false
                                        C.HumanoidRootPart.CFrame = d.HumanoidRootPart.CFrame
                                    end
                                end
                                EquipWeapon()
                                EnableBuso()
                                Click()
                            end
                        until not LevelFarm or not d:FindFirstChild("Humanoid") or
                            not d:FindFirstChild("HumanoidRootPart") or
                            d.Humanoid.Health == 0
                    end
                end
            end
        end
    end
)
local j = g.Main:AddToggle("MyToggle", {Title = "Farm Bone", Default = false})
j:OnChanged(
    function(k)
        BoneFarm = k
        Farm = k
        StopTween()
    end
)
spawn(
    function()
        while wait() do
            if BoneFarm then
                if
                    game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or
                        game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or
                        game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or
                        game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy")
                 then
                    for i, d in pairs(game.Workspace.Enemies:GetChildren()) do
                        if
                            d:FindFirstChild("Humanoid") and d.Humanoid.Health ~= 0 and
                                d:FindFirstChild("HumanoidRootPart") and
                                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                    d.HumanoidRootPart.Position).magnitude < 1500
                         then
                            if
                                d.Name == "Reborn Skeleton" or d.Name == "Living Zombie" or d.Name == "Demonic Sou" or
                                    d.Name == "Posessed Mummy"
                             then
                                repeat
                                    wait()
                                    if BoneFarm then
                                        Tween2(d.HumanoidRootPart.CFrame * CFrame.new(10, 10, 10))
                                        d.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        PosLevelFarm = d.HumanoidRootPart.CFrame
                                        for B, C in pairs(game.Workspace.Enemies:GetChildren()) do
                                            if
                                                C:FindFirstChild("Humanoid") and C:FindFirstChild("HumanoidRootPart") and
                                                    (C.HumanoidRootPart.Position - d.HumanoidRootPart.Position).magnitude <
                                                        170
                                             then
                                                C.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                C.HumanoidRootPart.CanCollide = false
                                                C.HumanoidRootPart.CFrame = d.HumanoidRootPart.CFrame
                                            end
                                        end
                                        EquipWeapon()
                                        EnableBuso()
                                        Click()
                                    end
                                until not BoneFarm or not d:FindFirstChild("Humanoid") or
                                    not d:FindFirstChild("HumanoidRootPart") or
                                    d.Humanoid.Health == 0
                            end
                        end
                    end
                else
                    Tween2(CFrame.new(-9359.453125, 141.32679748535156, 5446.81982421875))
                end
            end
        end
    end
)
function HopServer()
    local D = game.PlaceId
    local E = {}
    local F = ""
    local G = os.date("!*t").hour
    local H = false
    function TPReturner()
        local I
        if F == "" then
            I =
                game.HttpService:JSONDecode(
                game:HttpGet("https://games.roblox.com/v1/games/" .. D .. "/servers/Public?sortOrder=Asc&limit=100")
            )
        else
            I =
                game.HttpService:JSONDecode(
                game:HttpGet(
                    "https://games.roblox.com/v1/games/" .. D .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. F
                )
            )
        end
        local J = ""
        if I.nextPageCursor and I.nextPageCursor ~= "null" and I.nextPageCursor ~= nil then
            F = I.nextPageCursor
        end
        local K = 0
        for i, d in pairs(I.data) do
            local L = true
            J = tostring(d.id)
            if tonumber(d.maxPlayers) > tonumber(d.playing) then
                for m, M in pairs(E) do
                    if K ~= 0 then
                        if J == tostring(M) then
                            L = false
                        end
                    else
                        if tonumber(G) ~= tonumber(M) then
                            local N =
                                pcall(
                                function()
                                    E = {}
                                    table.insert(E, G)
                                end
                            )
                        end
                    end
                    K = K + 1
                end
                if L == true then
                    table.insert(E, J)
                    wait()
                    pcall(
                        function()
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(D, J, game.Players.LocalPlayer)
                        end
                    )
                    wait(4)
                end
            end
        end
    end
    function Teleport()
        while wait() do
            pcall(
                function()
                    TPReturner()
                    if F ~= "" then
                        TPReturner()
                    end
                end
            )
        end
    end
    Teleport()
    wait(1)
end
local j = g.Main:AddToggle("MyToggle", {Title = "Auto Boss Sea 2", Default = false})
j:OnChanged(
    function(k)
        BossFarm = k
        Farm = k
        StopTween()
    end
)
spawn(
    function()
        while wait() do
            if BossFarm then
                local O = {"Awakened Ice Admiral", "Diamond", "Don Swan", "Jeremy", "Tide Keeper"}
                local P = false
                for m, Q in ipairs(O) do
                    local R = game:GetService("ReplicatedStorage"):FindFirstChild(Q)
                    local S = game.workspace.Enemies:FindFirstChild(Q)
                    if S then
                        local d = S
                        P = true
                        repeat
                            wait()
                            Tween2(d.HumanoidRootPart.CFrame * CFrame.new(10, 10, 10))
                            d.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            EquipWeapon()
                            EnableBuso()
                            Click()
                        until not BossFarm or d.Humanoid.Health == 0 or not d:FindFirstChild("HumanoidRootPart")
                        break
                    elseif R then
                        Tween2(R.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                        P = true
                        break
                    end
                end
                if not P then
                end
            end
        end
    end
)
local g = {Main = f:AddTab({Title = "Race", Icon = ""})}
function GetFlower()
    if
        not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower1") and game.Workspace:FindFirstChild("Flower1") and
            game.Workspace:FindFirstChild("Flower1").Transparency ~= 1
     then
        local T = game.Workspace:FindFirstChild("Flower1")
        if T then
            Tween2(T.CFrame)
        end
    elseif
        not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower2") and game.Workspace:FindFirstChild("Flower2") and
            game.Workspace:FindFirstChild("Flower2").Transparency ~= 1
     then
        local T = game.Workspace:FindFirstChild("Flower2")
        if T then
            Tween2(T.CFrame)
        end
    end
end
g.Main:AddButton(
    {Title = "Get Flower", Description = "Khi Bấm Sẽ Bay tới hoa 1 hoặc 2", Callback = function()
            GetFlower()
        end}
)
