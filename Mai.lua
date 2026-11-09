-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- https://lua.expert

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local v1 = ReplicatedStorage:WaitForChild("JANET_STATUS", 30)

if not v1 then
    warn("[JANET UI] JANET_STATUS never appeared. Is JANET_BRAIN running?")
    script.Parent:Destroy()

    return
end

local Parent = script.Parent
local PANEL = Parent:WaitForChild("PANEL")
local t1 = {
    glazing = Color3.fromRGB(13, 16, 19),
    well = Color3.fromRGB(20, 26, 31),
    wellHot = Color3.fromRGB(27, 34, 41),
    spandrel = Color3.fromRGB(30, 36, 42),
    mullion = Color3.fromRGB(185, 192, 196),
    amber = Color3.fromRGB(233, 162, 63),
    warm = Color3.fromRGB(228, 231, 233),
    dim = Color3.fromRGB(110, 120, 128),
    eyebrow = Color3.fromRGB(121, 131, 139),
    unlit = Color3.fromRGB(27, 34, 40),
    stroke = Color3.fromRGB(46, 56, 66),
    burgundy = Color3.fromRGB(122, 26, 36),
    burgHot = Color3.fromRGB(142, 32, 43),
    burgText = Color3.fromRGB(243, 221, 223)
}
local TweenService = game:GetService("TweenService")

local function tracked(p1) -- line: 59
    return (p1:gsub("(.)", "%1 "):gsub("%s+$", ""))
end

local function hoverable(p2, p3, p4) -- line: 63
    -- upvalues: TweenService (copy)
    p2.AutoButtonColor = false
    p2.MouseEnter:Connect(function() -- line: 65
        -- upvalues: p2 (copy), p4 (copy), TweenService (copy)
        TweenService:Create(p2, TweenInfo.new(0.12), {
            BackgroundColor3 = p4
        }):Play()
    end)
    p2.MouseLeave:Connect(function() -- line: 68
        -- upvalues: p2 (copy), p3 (copy), TweenService (copy)
        TweenService:Create(p2, TweenInfo.new(0.18), {
            BackgroundColor3 = p3
        }):Play()
    end)
end

local t2 = {
    janet = 8,
    logo = 32,
    rule1 = 94,
    resident = 102,
    target = 116,
    drop = 146,
    rule2 = 152,
    salvo = 160,
    counter = 174,
    meter = 210,
    readout = 232,
    rule3 = 250,
    firectl = 258,
    chip1 = 272,
    chip2 = 298,
    chip3 = 324,
    chip4 = 350,
    rule4 = 376,
    actions = 384
}

t2.rule5 = t2.actions + 30 + 8
t2.ticket = t2.rule5 + 8
t2.route = t2.ticket + 12

local v3 = t2.route + 18 + 8

PANEL.Size = UDim2.new(0, 240, 0, v3)
PANEL.Position = UDim2.new(1, -260, 1, -(v3 + 20))
PANEL.BackgroundColor3 = t1.glazing

local UIStroke = PANEL:FindFirstChildWhichIsA("UIStroke")

if UIStroke then
    UIStroke.Color = t1.stroke
    UIStroke.Transparency = 0
end

local PLUS

for i = 20, 220, 20 do
    PLUS = Instance.new("Frame")
    PLUS.Name = "MULLION_" .. i
    PLUS.Size = UDim2.new(0, 1, 1, 0)
    PLUS.Position = UDim2.new(0, i, 0, 0)
    PLUS.BackgroundColor3 = t1.mullion
    PLUS.BackgroundTransparency = 0.88
    PLUS.BorderSizePixel = 0
    PLUS.ZIndex = 0
    PLUS.Parent = PANEL
end

local function spandrel(p5) -- line: 133
    -- upvalues: PANEL (copy), t1 (copy)
    local Frame = Instance.new("Frame")

    Frame.Name = "SPANDREL_" .. p5
    Frame.Size = UDim2.new(1, -20, 0, 1)
    Frame.Position = UDim2.new(0, 10, 0, p5)
    Frame.BackgroundColor3 = t1.spandrel
    Frame.BorderSizePixel = 0
    Frame.Parent = PANEL
end

for _, child in ipairs(PANEL:GetChildren()) do
    if child:IsA("TextLabel") and (child.Text == "JANET" or child.Text == "TARGET" or child.Text == "MISSILES") then
        child.Visible = false
    end
end

local TextButton = Instance.new("TextButton")

TextButton.Name = "JANET_TAB"
TextButton.Size = UDim2.new(0, 26, 0, 26)
TextButton.Position = UDim2.new(1, -260, 1, -(v3 + 20 + 4 + 26))
TextButton.BackgroundColor3 = t1.glazing
TextButton.BorderSizePixel = 0
TextButton.Text = "J"
TextButton.TextColor3 = t1.amber
TextButton.TextSize = 14
TextButton.Font = Enum.Font.GothamBold
TextButton.Parent = Parent
Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 3)

local UIStroke2 = Instance.new("UIStroke", TextButton)

UIStroke2.Color = t1.stroke
UIStroke2.Thickness = 1

local v4 = true

local function setPanelVisible(p6) -- line: 171
    -- upvalues: PANEL (copy), v4 (ref)
    v4 = p6
    PANEL.Visible = p6
end

TextButton.MouseButton1Click:Connect(function() -- line: 176
    -- upvalues: PANEL (copy), v4 (ref)
    local v5 = not v4

    v4 = v5
    PANEL.Visible = v5
end)
UserInputService.InputBegan:Connect(function(p7, p8) -- line: 180
    -- upvalues: PANEL (copy), v4 (ref)
    if p8 or p7.KeyCode ~= Enum.KeyCode.RightBracket then
        return
    end

    local v6 = not v4

    v4 = v6
    PANEL.Visible = v6
end)

local TARGET_BTN = PANEL:WaitForChild("TARGET_BTN")
local DROPDOWN = PANEL:WaitForChild("DROPDOWN")
local COUNT = PANEL:WaitForChild("COUNT")
local MINUS = PANEL:WaitForChild("MINUS")

PLUS = PANEL:WaitForChild("PLUS")

local LAUNCH = PANEL:WaitForChild("LAUNCH")
local JANET_DEPLOY = ReplicatedStorage:WaitForChild("JANET_DEPLOY")
local JANET_PLAYERLIST = ReplicatedStorage:WaitForChild("JANET_PLAYERLIST")
local JANET_ABORT = ReplicatedStorage:WaitForChild("JANET_ABORT")
local JANET_RELEASE = ReplicatedStorage:WaitForChild("JANET_RELEASE")
local v7 = ReplicatedStorage:WaitForChild("JANET_ITINERARY", 10)
local Frame = Instance.new("Frame")

Frame.Name = "HDR_RULE"
Frame.Size = UDim2.new(0, 2, 0, 12)
Frame.Position = UDim2.new(0, 10, 0, t2.janet + 3)
Frame.BackgroundColor3 = t1.amber
Frame.BorderSizePixel = 0
Frame.Parent = PANEL
Frame = Instance.new("TextLabel")
Frame.Name = "WORDMARK"
Frame.Size = UDim2.new(0, 120, 0, 18)
Frame.Position = UDim2.new(0, 20, 0, t2.janet)
Frame.BackgroundTransparency = 1
Frame.TextColor3 = t1.warm
Frame.TextSize = 13
Frame.Font = Enum.Font.GothamBold
Frame.TextXAlignment = Enum.TextXAlignment.Left
Frame.Text = "J.A.N.E.T"
Frame.Parent = PANEL
Frame = Instance.new("ImageLabel")
Frame.Name = "SCI_MARK"
Frame.Image = "rbxassetid://116174342695253"
Frame.Size = UDim2.new(1, -20, 0, 55)
Frame.Position = UDim2.new(0, 10, 0, t2.logo)
Frame.BackgroundTransparency = 1
Frame.ImageTransparency = 0.06
Frame.ScaleType = Enum.ScaleType.Fit
Frame.Parent = PANEL
spandrel(t2.rule1)
spandrel(t2.rule2)
spandrel(t2.rule3)
spandrel(t2.rule4)

local function reCorner(p9, p10) -- line: 247
    local UICorner = p9:FindFirstChildWhichIsA("UICorner")

    if UICorner then
        UICorner.CornerRadius = UDim.new(0, p10)
    end
end

TARGET_BTN.Size = UDim2.new(1, -20, 0, 28)
TARGET_BTN.Position = UDim2.new(0, 10, 0, t2.target)
TARGET_BTN.BackgroundColor3 = t1.well
TARGET_BTN.TextColor3 = t1.warm
TARGET_BTN.TextSize = 12
TARGET_BTN.Font = Enum.Font.GothamMedium
TARGET_BTN.TextXAlignment = Enum.TextXAlignment.Left
Frame = TARGET_BTN:FindFirstChildWhichIsA("UICorner")

if Frame then
    Frame.CornerRadius = UDim.new(0, 2)
end

hoverable(TARGET_BTN, t1.well, t1.wellHot)
Instance.new("UIPadding", TARGET_BTN).PaddingLeft = UDim.new(0, 11)

local Frame2 = Instance.new("Frame")

Frame2.Name = "TARGET_EDGE"
Frame2.Size = UDim2.new(0, 2, 0, 28)
Frame2.Position = UDim2.new(0, 10, 0, t2.target)
Frame2.BackgroundColor3 = t1.amber
Frame2.BorderSizePixel = 0
Frame2.ZIndex = 3
Frame2.Parent = PANEL

local TextBox = Instance.new("TextBox")

TextBox.Name = "UNIT_BOX"
TextBox.Size = TARGET_BTN.Size
TextBox.Position = TARGET_BTN.Position
TextBox.BackgroundColor3 = t1.well
TextBox.BorderSizePixel = 0
TextBox.TextColor3 = t1.warm
TextBox.PlaceholderColor3 = t1.dim
TextBox.PlaceholderText = "E.G. 1302  104-B  136-GR"
TextBox.Text = ""
TextBox.TextSize = 14
TextBox.Font = Enum.Font.Code
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.ClearTextOnFocus = false
TextBox.Visible = false
TextBox.Parent = PANEL
Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 2)
Instance.new("UIPadding", TextBox).PaddingLeft = UDim.new(0, 11)

local function unitEntered() -- line: 299
    -- upvalues: TextBox (copy)
    return TextBox.Text:upper():match("^%s*(.-)%s*$")
end

DROPDOWN.Position = UDim2.new(0, 10, 0, t2.drop)
DROPDOWN.Size = UDim2.new(1, -20, 0, t2.chip4 + 22 - t2.drop)
DROPDOWN.BackgroundColor3 = t1.well
DROPDOWN.ScrollBarThickness = 3
DROPDOWN.ScrollBarImageColor3 = t1.dim

local UICorner = DROPDOWN:FindFirstChildWhichIsA("UICorner")

if UICorner then
    UICorner.CornerRadius = UDim.new(0, 2)
end

MINUS.Size = UDim2.new(0, 28, 0, 28)
MINUS.Position = UDim2.new(0, 10, 0, t2.counter)
MINUS.BackgroundColor3 = t1.well
MINUS.TextColor3 = t1.amber
MINUS.TextSize = 16
MINUS.Font = Enum.Font.GothamBold
UICorner = MINUS:FindFirstChildWhichIsA("UICorner")

if UICorner then
    UICorner.CornerRadius = UDim.new(0, 2)
end

hoverable(MINUS, t1.well, t1.wellHot)
COUNT.Size = UDim2.new(0, 152, 0, 28)
COUNT.Position = UDim2.new(0, 44, 0, t2.counter)
COUNT.BackgroundColor3 = t1.well
COUNT.TextColor3 = t1.warm
COUNT.TextSize = 16
COUNT.Font = Enum.Font.Code
UICorner = COUNT:FindFirstChildWhichIsA("UICorner")

if UICorner then
    UICorner.CornerRadius = UDim.new(0, 2)
end

PLUS.Size = UDim2.new(0, 28, 0, 28)
PLUS.Position = UDim2.new(0, 202, 0, t2.counter)
PLUS.BackgroundColor3 = t1.well
PLUS.TextColor3 = t1.amber
PLUS.TextSize = 16
PLUS.Font = Enum.Font.GothamBold
UICorner = PLUS:FindFirstChildWhichIsA("UICorner")

if UICorner then
    UICorner.CornerRadius = UDim.new(0, 2)
end

hoverable(PLUS, t1.well, t1.wellHot)

local function eyebrow(p11, p12, p13) -- line: 342
    -- upvalues: PANEL (copy), t1 (copy)
    local TextLabel = Instance.new("TextLabel")

    TextLabel.Name = p11
    TextLabel.Size = UDim2.new(1, -20, 0, 10)
    TextLabel.Position = UDim2.new(0, 10, 0, p12)
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = t1.eyebrow
    TextLabel.TextSize = 9
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Text = p13:gsub("(.)", "%1 "):gsub("%s+$", "")
    TextLabel.Parent = PANEL

    return TextLabel
end

local function makeChip(p14, p15, p16, p17) -- line: 358
    -- upvalues: PANEL (copy), t1 (copy), TweenService (copy), hoverable (copy)
    local TextButton = Instance.new("TextButton")

    TextButton.Name = p14
    TextButton.Size = UDim2.new(1, -20, 0, 22)
    TextButton.Position = UDim2.new(0, 10, 0, p15)
    TextButton.BackgroundColor3 = t1.well
    TextButton.BorderSizePixel = 0
    TextButton.Text = ""
    TextButton.Parent = PANEL
    Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 2)
    hoverable(TextButton, t1.well, t1.wellHot)

    local TextLabel = Instance.new("TextLabel")

    TextLabel.Name = "K"
    TextLabel.Size = UDim2.new(1, -20, 1, 0)
    TextLabel.Position = UDim2.new(0, 10, 0, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = t1.eyebrow
    TextLabel.TextSize = 8
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Text = p16:gsub("(.)", "%1 "):gsub("%s+$", "")
    TextLabel.Parent = TextButton

    local TextLabel2 = Instance.new("TextLabel")

    TextLabel2.Name = "V"
    TextLabel2.Size = UDim2.new(1, -20, 1, 0)
    TextLabel2.Position = UDim2.new(0, 10, 0, 0)
    TextLabel2.BackgroundTransparency = 1
    TextLabel2.TextSize = 10
    TextLabel2.Font = Enum.Font.Code
    TextLabel2.TextXAlignment = Enum.TextXAlignment.Right
    TextLabel2.Parent = TextButton

    local n1 = 1

    TextLabel2.Text = p17[n1]
    TextLabel2.TextColor3 = n1 == 1 and Color3.fromRGB(154, 164, 172) or t1.amber
    TextButton.MouseButton1Click:Connect(function() -- line: 400
        -- upvalues: p17 (copy), TextLabel2 (copy), n1 (ref), t1 (copy)
        n1 = n1 % #p17 + 1
        TextLabel2.Text = p17[n1]
        TextLabel2.TextColor3 = n1 == 1 and Color3.fromRGB(154, 164, 172) or t1.amber
    end)

    return {
        get = function() -- get | line: 407
            -- upvalues: p17 (copy), n1 (ref)
            return p17[n1]
        end,
        set = function(p18) -- set | line: 408
            -- upvalues: p17 (copy), TextLabel2 (copy), n1 (ref), t1 (copy)
            for v11, v12 in ipairs(p17) do
                if v12 == p18 then
                    n1 = v11
                    TextLabel2.Text = p17[n1]
                    TextLabel2.TextColor3 = n1 == 1 and Color3.fromRGB(154, 164, 172) or t1.amber

                    return true
                end
            end

            return false
        end,
        flash = function() -- flash | line: 414
            -- upvalues: TextButton (copy), t1 (copy), TweenService (copy)
            local BackgroundColor3 = TextButton.BackgroundColor3

            TextButton.BackgroundColor3 = t1.wellHot
            TweenService:Create(TextButton, TweenInfo.new(0.5), {
                BackgroundColor3 = BackgroundColor3
            }):Play()
        end
    }
end

local RESIDENT = eyebrow("LBL_RESIDENT", t2.resident, "RESIDENT")
local SALVO = eyebrow("LBL_SALVO", t2.salvo, "SALVO")

eyebrow("LBL_FIRECTL", t2.firectl, "FIRE CONTROL")

local v14 = true
local TextButton2 = Instance.new("TextButton")

TextButton2.Name = "ETA_TAB"
TextButton2.Size = UDim2.new(0, 48, 0, 14)
TextButton2.Position = UDim2.new(0, 182, 0, t2.resident - 3)
TextButton2.BackgroundColor3 = t1.well
TextButton2.BorderSizePixel = 0
TextButton2.TextSize = 8
TextButton2.Font = Enum.Font.GothamBold
TextButton2.AutoButtonColor = false
TextButton2.Parent = PANEL
Instance.new("UICorner", TextButton2).CornerRadius = UDim.new(0, 2)
hoverable(TextButton2, t1.well, t1.wellHot)

local function renderEta() -- line: 442
    -- upvalues: t1 (copy), v14 (ref), TextButton2 (copy)
    TextButton2.Text = v14 and "ETA ON" or "ETA OFF"
    TextButton2.TextColor3 = v14 and t1.eyebrow or t1.amber
end

TextButton2.Text = v14 and "ETA ON" or "ETA OFF"
TextButton2.TextColor3 = v14 and t1.eyebrow or t1.amber
TextButton2.MouseButton1Click:Connect(function() -- line: 447
    -- upvalues: t1 (copy), v14 (ref), TextButton2 (copy)
    v14 = not v14
    TextButton2.Text = v14 and "ETA ON" or "ETA OFF"
    TextButton2.TextColor3 = v14 and t1.eyebrow or t1.amber
end)

local v15 = makeChip("PROFILE_BTN", t2.chip1, "PROFILE", {
    "DIRECT",
    "POPUP",
    "CRUISE",
    "LOITER",
    "FORMATION",
    "SHAFT",
    "ELEVATOR",
    "CONCIERGE",
    "CARPOOL",
    "STAKEOUT",
    "ANNOUNCED"
})
local v16 = makeChip("WARHEAD_BTN", t2.chip2, "WARHEAD", {
    "LETHAL",
    "RAGDOLL",
    "SABOTAGE",
    "EMP",
    "CONFETTI",
    "RECALL",
    "DECOMMISSION",
    "ESCORT",
    "SUBPOENA",
    "PARKING",
    "VALUATION"
})
local v17 = makeChip("PATTERN_BTN", t2.chip3, "SALVO", { "SPREAD", "FOCUS", "WAVE", "SIMULTANEOUS", "ALPHABETICAL", "ROTA", "QUEUE" })
local v18 = makeChip("AUTO_BTN", t2.chip4, "AUTO", { "MANUAL", "NEAREST", "ALL", "HIGHEST", "RANDOM", "OVERDUE", "LOTTERY" })
local t4 = {
    {
        code = "WO1",
        name = "PEST CONTROL",
        profile = "DIRECT",
        warhead = "RAGDOLL",
        pattern = "SPREAD",
        auto = "MANUAL"
    },
    {
        code = "WO2",
        name = "COURTESY CALL",
        profile = "ELEVATOR",
        warhead = "CONFETTI",
        pattern = "SPREAD",
        auto = "MANUAL"
    },
    {
        code = "WO3",
        name = "NOISE COMPLAINT",
        profile = "POPUP",
        warhead = "LETHAL",
        pattern = "SIMULTANEOUS",
        auto = "MANUAL"
    }
}
local t5 = {}
local Frame3

for v19, v20 in ipairs(t4) do
    Frame3 = Instance.new("TextButton")
    Frame3.Name = "JOB_" .. v20.code
    Frame3.Size = UDim2.new(0, 30, 0, 14)
    Frame3.Position = UDim2.new(0, 230 - (#t4 - v19 + 1) * 35 + 5, 0, t2.firectl - 3)
    Frame3.BackgroundColor3 = t1.well
    Frame3.BorderSizePixel = 0
    Frame3.Text = v20.code
    Frame3.TextColor3 = t1.eyebrow
    Frame3.TextSize = 8
    Frame3.Font = Enum.Font.GothamBold
    Frame3.AutoButtonColor = false
    Frame3.Parent = PANEL
    Instance.new("UICorner", Frame3).CornerRadius = UDim.new(0, 2)
    hoverable(Frame3, t1.well, t1.wellHot)
    t5[v19] = Frame3
    Frame3.MouseButton1Click:Connect(function() -- line: 501
        -- upvalues: t1 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), t5 (copy), v20 (copy), v19 (copy)
        v15.set(v20.profile)
        v16.set(v20.warhead)
        v17.set(v20.pattern)
        v18.set(v20.auto)
        v15.flash()
        v16.flash()
        v17.flash()
        v18.flash()

        for v21, v22 in ipairs(t5) do
            local amber

            if v21 == v19 then
                amber = t1.amber

                if not amber then
                    amber = t1.eyebrow
                end
            else
                amber = t1.eyebrow
            end

            v22.TextColor3 = amber
        end
    end)
end

local t6 = {}

for i = 1, 36 do
    local v23 = (i - 1) % 18

    Frame3 = (i - 1) / 18

    local v24 = math.floor(Frame3)

    Frame3 = Instance.new("Frame")
    Frame3.Name = "WIN_" .. i
    Frame3.Size = UDim2.new(0, 10, 0, 6)
    Frame3.Position = UDim2.new(0, 13 + v23 * 12, 0, t2.meter + v24 * 11)
    Frame3.BackgroundColor3 = t1.unlit
    Frame3.BorderSizePixel = 0
    Frame3.Parent = PANEL
    Instance.new("UICorner", Frame3).CornerRadius = UDim.new(0, 1)
    t6[i] = Frame3
end

local function setMeter(p19, p20) -- line: 536
    -- upvalues: t1 (copy), t6 (copy)
    local v25 = #t6
    local v26 = if (p20 or 0) > 0 then math.clamp(math.floor(p19 / p20 * v25 + 0.5), 0, v25) else 0

    for v29, v30 in ipairs(t6) do
        v30.BackgroundColor3 = v29 <= v26 and t1.amber or t1.unlit
    end
end

local function readout(p21, p22, p23) -- line: 547
    -- upvalues: PANEL (copy), t1 (copy)
    local TextLabel = Instance.new("TextLabel")

    TextLabel.Name = p21
    TextLabel.Size = UDim2.new(1, -20, 0, 10)
    TextLabel.Position = UDim2.new(0, 10, 0, p22)
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = t1.dim
    TextLabel.TextSize = 9
    TextLabel.Font = Enum.Font.Code
    TextLabel.TextXAlignment = p23 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left
    TextLabel.Text = ""
    TextLabel.Parent = PANEL

    return TextLabel
end

local v31 = readout("RACK_LABEL", t2.readout, false)
local v32 = readout("AIR_LABEL", t2.readout, true)
local v33 = ("LAUNCH"):gsub("(.)", "%1 "):gsub("%s+$", "")
local v34 = ("RELEASE"):gsub("(.)", "%1 "):gsub("%s+$", "")
local v35 = ("SERVE"):gsub("(.)", "%1 "):gsub("%s+$", "")
local t7 = {}
local v36 = false
local v37 = false
local t8 = {
    on = false,
    admin = true,
    now = nil,
    at = 0,
    list = nil,
    pick = nil,
    page = 1,
    greyed = false,
    idle = ("START"):gsub("(.)", "%1 "):gsub("%s+$", "")
}

LAUNCH.Size = UDim2.new(0, 140, 0, 30)
LAUNCH.Position = UDim2.new(0, 10, 0, t2.actions)
LAUNCH.BackgroundColor3 = t1.burgundy
LAUNCH.TextColor3 = t1.burgText
LAUNCH.TextSize = 12
LAUNCH.Font = Enum.Font.GothamBold
LAUNCH.Text = v33

local UICorner2 = LAUNCH:FindFirstChildWhichIsA("UICorner")

if UICorner2 then
    UICorner2.CornerRadius = UDim.new(0, 2)
end

hoverable(LAUNCH, t1.burgundy, t1.burgHot)

local TextButton3 = Instance.new("TextButton")

TextButton3.Name = "ABORT"
TextButton3.Size = UDim2.new(0, 70, 0, 30)
TextButton3.Position = UDim2.new(0, 160, 0, t2.actions)
TextButton3.BackgroundColor3 = t1.well
TextButton3.BackgroundTransparency = 1
TextButton3.BorderSizePixel = 0
TextButton3.TextColor3 = t1.dim
TextButton3.TextSize = 10
TextButton3.Font = Enum.Font.GothamBold
TextButton3.Text = ("ABORT"):gsub("(.)", "%1 "):gsub("%s+$", "")
TextButton3.AutoButtonColor = false
TextButton3.Parent = PANEL
Instance.new("UICorner", TextButton3).CornerRadius = UDim.new(0, 2)

local UIStroke3 = Instance.new("UIStroke", TextButton3)

UIStroke3.Color = t1.stroke
UIStroke3.Thickness = 1

local v38 = ("ABORT"):gsub("(.)", "%1 "):gsub("%s+$", "")
local elapsed
local n2 = 0

TextButton3.MouseButton1Down:Connect(function() -- line: 624
    -- upvalues: JANET_ABORT (copy), TextButton3 (copy), v38 (copy), elapsed (ref), n2 (ref)
    n2 += 1

    local v39 = n2

    elapsed = os.clock()
    task.spawn(function() -- line: 628
        -- upvalues: v39 (copy), JANET_ABORT (copy), TextButton3 (copy), v38 (copy), elapsed (ref), n2 (ref)
        while true do
            if n2 == v39 and elapsed then
                local v40 = os.clock() - elapsed

                if not (v40 >= 2) then
                    TextButton3.Text = string.format("ALL IN %d", (math.ceil(2 - v40)))
                    task.wait(0.1)
                    continue
                end

                elapsed = nil
                JANET_ABORT:FireServer("all")
                TextButton3.Text = "ALL"
                task.wait(1.2)

                if n2 == v39 then
                    TextButton3.Text = v38
                end

                return
            end

            break
        end
    end)
end)

local v42 = false
local v43 = false

local function endPress(p24) -- line: 653
    -- upvalues: JANET_ABORT (copy), TextButton3 (copy), v38 (copy), elapsed (ref), n2 (ref), v42 (ref), v43 (ref)
    if not elapsed then
        return
    end

    elapsed = nil
    n2 += 1
    TextButton3.Text = v38

    if not p24 then
        return
    end

    JANET_ABORT:FireServer("mine")
    TextButton3.Text = if v42 then "SENT" elseif v43 then "NOT YOURS" else "NOTHING"

    local v45 = n2

    task.delay(1.1, function() -- line: 664
        -- upvalues: v45 (copy), TextButton3 (copy), v38 (copy), elapsed (ref), n2 (ref)
        if n2 == v45 and not elapsed then
            TextButton3.Text = v38
        end
    end)
end

TextButton3.MouseButton1Up:Connect(function() -- line: 669
    -- upvalues: endPress (copy)
    endPress(true)
end)
TextButton3.MouseLeave:Connect(function() -- line: 672
    -- upvalues: TextButton3 (copy), v38 (copy), elapsed (ref), n2 (ref)
    if not elapsed then
        return
    end

    elapsed = nil
    n2 += 1
    TextButton3.Text = v38
end)
spandrel(t2.rule5)

local TextLabel = Instance.new("TextLabel")

TextLabel.Name = "TICKET"
TextLabel.Size = UDim2.new(1, -20, 0, 11)
TextLabel.Position = UDim2.new(0, 10, 0, t2.ticket)
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = t1.eyebrow
TextLabel.TextSize = 9
TextLabel.Font = Enum.Font.Code
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.Text = "NO WORK ORDER RAISED"
TextLabel.Parent = PANEL

local t9 = {
    hot = t1.burgHot,
    amber = t1.amber,
    eyebrow = t1.eyebrow,
    dim = t1.dim
}
local TextButton4 = Instance.new("TextButton")

TextButton4.Name = "STRIP_ACTION"
TextButton4.Size = UDim2.new(0, 44, 0, 13)
TextButton4.Position = UDim2.new(0, 186, 0, t2.ticket - 1)
TextButton4.BackgroundColor3 = t1.well
TextButton4.BorderSizePixel = 0
TextButton4.TextColor3 = t1.amber
TextButton4.TextSize = 8
TextButton4.Font = Enum.Font.GothamBold
TextButton4.Visible = false
TextButton4.Parent = PANEL
Instance.new("UICorner", TextButton4).CornerRadius = UDim.new(0, 2)
hoverable(TextButton4, t1.well, t1.wellHot)

local v46, v47, cr
local v48 = false

local function setStripMode(p25) -- line: 721
    -- upvalues: t1 (copy), TextLabel (copy), TextButton4 (copy), v46 (ref), v48 (ref)
    v46 = p25
    TextButton4.Visible = p25 ~= nil
    TextLabel.Size = UDim2.new(1, p25 and -68 or -20, 0, 11)

    if p25 == "CROSS" then
        TextButton4.Text = v48 and "ARMED" or "CROSS"
        TextButton4.TextColor3 = v48 and t1.burgText or t1.amber
        TextButton4.BackgroundColor3 = v48 and t1.burgundy or t1.well
    elseif p25 == "SEND" then
        TextButton4.Text = "SEND"
        TextButton4.TextColor3 = t1.amber
        TextButton4.BackgroundColor3 = t1.well
    end

    if p25 ~= "CROSS" then
        v48 = false
    end
end

local TextButton5 = Instance.new("TextButton")

TextButton5.Name = "ITINERARY"
TextButton5.Size = UDim2.new(1, -20, 0, 18)
TextButton5.Position = UDim2.new(0, 10, 0, t2.route)
TextButton5.BackgroundTransparency = 1
TextButton5.BorderSizePixel = 0
TextButton5.AutoButtonColor = false
TextButton5.TextColor3 = t1.dim
TextButton5.TextSize = 8
TextButton5.Font = Enum.Font.Code
TextButton5.TextXAlignment = Enum.TextXAlignment.Left
TextButton5.TextYAlignment = Enum.TextYAlignment.Top
TextButton5.TextWrapped = true
TextButton5.Text = ""
TextButton5.Parent = PANEL

local function setItinerary(p26, p27) -- line: 758
    -- upvalues: t1 (copy), TextButton5 (copy)
    TextButton5.Text = p26 or ""
    TextButton5.TextColor3 = p27 and t1.dim or t1.burgHot
end

local n3 = 0

local function refreshItinerary() -- line: 764
    -- upvalues: t1 (copy), v7 (copy), t7 (copy), v37 (ref), t8 (copy), TextButton5 (copy), n3 (ref)
    if v37 or t8.on then
        return
    end

    n3 += 1

    local v50 = n3

    if not v7 then
        TextButton5.Text = ""
        TextButton5.TextColor3 = t1.dim or t1.burgHot

        return
    end

    local t10 = {}

    for v51 in pairs(t7) do
        table.insert(t10, v51)
    end

    if #t10 == 0 then
        TextButton5.Text = ""
        TextButton5.TextColor3 = t1.dim or t1.burgHot
    elseif #t10 > 1 then
        TextButton5.Text = "ONE RESIDENT PER ITINERARY"
        TextButton5.TextColor3 = t1.burgHot
    else
        TextButton5.Text = "SOLVING..."
        TextButton5.TextColor3 = t1.dim or t1.burgHot
        task.spawn(function() -- line: 780
            -- upvalues: v50 (copy), t10 (copy), t1 (copy), v7 (copy), TextButton5 (copy), n3 (ref)
            local function v52() -- line: 781
                -- upvalues: t10 (copy), v7 (copy)
                return v7:InvokeServer(t10[1])
            end

            local ok, result = pcall(v52)

            if v50 ~= n3 then
                return
            end

            if not ok or type(result) ~= "table" then
                TextButton5.Text = "ITINERARY UNAVAILABLE"
                TextButton5.TextColor3 = t1.burgHot

                return
            end

            local v53 = result.text or ""
            local v54 = result.ok == true

            TextButton5.Text = v53 or ""
            TextButton5.TextColor3 = v54 and t1.dim or t1.burgHot
        end)
    end
end

TextButton5.MouseButton1Click:Connect(refreshItinerary)

local n4 = 0

local function restingLabel() -- line: 800
    -- upvalues: v33 (copy), v35 (copy), v37 (ref), t8 (copy)
    if t8.on then
        return t8.idle
    end

    return v37 and v35 or v33
end

local function paintLaunch() -- line: 806
    -- upvalues: LAUNCH (copy), v33 (copy), v34 (copy), v35 (copy), v36 (ref), v37 (ref), t8 (copy), n4 (ref)
    if not v36 then
        local v55

        if n4 > 0 then
            v55 = v34

            if not v34 then
                v55 = if t8.on then t8.idle else v37 and v35 or v33
            end
        else
            v55 = if t8.on then t8.idle else v37 and v35 or v33
        end

        LAUNCH.Text = v55
    end

    t8.dim()
end

local function paintEdge() -- line: 815
    -- upvalues: Frame2 (copy), TextBox (copy), t7 (copy), v37 (ref), t8 (copy)
    if v37 then
        Frame2.BackgroundTransparency = TextBox.Text:upper():match("^%s*(.-)%s*$") == "" and 1 or 0
    elseif t8.on then
        Frame2.BackgroundTransparency = (not TextBox.Visible or TextBox.Text:upper():match("^%s*(.-)%s*$") == "") and 1 or 0
    else
        Frame2.BackgroundTransparency = next(t7) == nil and 0.72 or 0
    end
end

task.spawn(function() -- line: 825
    -- upvalues: v1 (copy), t1 (copy), LAUNCH (copy), setMeter (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), t7 (copy), v36 (ref), v37 (ref), t8 (copy), TextButton3 (copy), UIStroke3 (copy), v42 (ref), v43 (ref), TextLabel (copy), t9 (copy), TextButton4 (copy), v46 (ref), v47 (ref), cr (ref), v48 (ref), TextButton5 (copy), n4 (ref), paintEdge (copy)
    while true do
        local function result() -- line: 827
            -- upvalues: v1 (copy)
            return v1:InvokeServer()
        end

        local ok

        ok, result = pcall(result)

        if ok and type(result) == "table" and result.capacity then
            n4 = result.loitering or 0

            local v57 = result.racked or 0
            local v58 = result.capacity or 0

            setMeter(v57, v58)
            v31.Text = string.format("%d / %d RACKED", v57, v58)
            v58 = result.inFlight or 0
            v32.Text = if result.delivery then "DELIVERY EN ROUTE" else string.format("%d IN AIR", v58)

            local workOrder = result.act
            local v60 = type(workOrder) == "table"
            local act = if v60 then result.act else nil
            local v61 = if not v60 or not act then nil else act

            t8.now = v61
            t8.at = os.clock()
            t8.admin = true
            v57 = result.mineRunning == true or (result.mineInFlight or 0) > 0 or (result.queued or 0) > 0 or t8.now ~= nil

            local v62 = v58 > 0 or result.delivery == true or result.launching == true or (result.queueDepth or 0) > 0

            v42 = v57
            v43 = v62

            local amber = if v57 then t1.amber else nil

            TextButton3.TextColor3 = if not v57 or not amber then t1.dim else amber

            local format

            if v57 or v62 then
                format = t1.amber or t1.stroke
                UIStroke3.Color = format
                format = if v57 then 0.35 elseif v62 then 0.78 else 0
                UIStroke3.Transparency = format
                paintEdge()
                v61 = v36

                if not v61 then
                    workOrder = n4

                    local v63

                    if workOrder > 0 then
                        v63 = v34

                        if not v34 then
                            v63 = if t8.on then t8.idle else v37 and v35 or v33
                        end
                    else
                        v63 = if t8.on then t8.idle else v37 and v35 or v33
                    end

                    LAUNCH.Text = v63
                end

                t8.dim()
                format = result.strike
                v61 = type(format)

                if v61 == "table" then
                    v61 = result.strike.active

                    if v61 then
                        v62 = result.strike or nil
                        workOrder = result.apology
                        format = type(workOrder)

                        if format == "table" then
                            format = result.apology.name

                            if format then
                                v47 = result.apology or nil
                                v61 = v47

                                if v61 then
                                    v61 = v47
                                    v61 = v61.cr
                                    format = cr

                                    if v61 == format then
                                        v47 = nil
                                    end
                                end

                                if v62 then
                                    v46 = "CROSS"
                                    TextButton4.Visible = true
                                    TextLabel.Size = UDim2.new(1, -68, 0, 11)
                                    TextButton4.Text = v48 and "ARMED" or "CROSS"
                                    workOrder = v48

                                    local burgText = if workOrder then t1.burgText else nil

                                    format = if not workOrder or not burgText then t1.amber else burgText
                                    TextButton4.TextColor3 = format
                                    workOrder = v48

                                    local burgundy = if workOrder then t1.burgundy else nil

                                    format = if not workOrder or not burgundy then t1.well else burgundy
                                    TextButton4.BackgroundColor3 = format
                                else
                                    v61 = v47

                                    if v61 then
                                        v46 = "SEND"
                                        TextButton4.Visible = true
                                        TextLabel.Size = UDim2.new(1, -68, 0, 11)
                                        TextButton4.Text = "SEND"
                                        TextButton4.TextColor3 = t1.amber
                                        TextButton4.BackgroundColor3 = t1.well
                                    else
                                        v46 = nil
                                        TextButton4.Visible = false
                                        TextLabel.Size = UDim2.new(1, -20, 0, 11)
                                    end

                                    v48 = false
                                end

                                v61 = result.sla

                                local slaUrgent = if v61 then result.slaUrgent else nil

                                if not v61 or not slaUrgent then
                                    if v62 then
                                        format = v62.left

                                        local v65 = tonumber(format) or 0

                                        format = string.format
                                        TextLabel.Text = format("STAFF ON STRIKE  ·  %d:%02d", math.floor(v65 / 60), v65 % 60)
                                        TextLabel.TextColor3 = t1.burgHot
                                    elseif (result.queued or 0) > 0 then
                                        TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                                        TextLabel.TextColor3 = t1.amber
                                    else
                                        v61 = v47

                                        if v61 then
                                            local v67 = v47

                                            v67 = v67.unit
                                            TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v67)
                                            TextLabel.TextColor3 = t1.amber
                                        elseif (result.defective or 0) > 0 then
                                            TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                            TextLabel.TextColor3 = t1.amber
                                        elseif result.sla then
                                            TextLabel.Text = result.sla

                                            local v68 = t9[result.slaTone]

                                            v68 = v68 or t1.eyebrow
                                            TextLabel.TextColor3 = v68
                                        elseif result.workOrder then
                                            workOrder = result.workOrder
                                            TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                            TextLabel.TextColor3 = t1.eyebrow
                                        end
                                    end
                                else
                                    TextLabel.Text = result.sla
                                    format = t9[result.slaTone]
                                    format = format or t1.eyebrow
                                    TextLabel.TextColor3 = format
                                end

                                v61 = next(t7)

                                local TextButton, dim

                                if v61 == nil then
                                    v61 = v37

                                    if not v61 then
                                        v61 = t8.on

                                        if not v61 then
                                            v61 = result.slaLedger or ""
                                            TextButton5.Text = v61 or ""
                                            TextButton = TextButton5
                                            dim = t1.dim or t1.burgHot
                                            TextButton.TextColor3 = dim
                                        end
                                    end
                                end
                            else
                                v47 = nil
                                v61 = v47

                                if v61 then
                                    v61 = v47
                                    v61 = v61.cr
                                    format = cr

                                    if v61 == format then
                                        v47 = nil
                                    end
                                end

                                if v62 then
                                    v46 = "CROSS"
                                    TextButton4.Visible = true
                                    TextLabel.Size = UDim2.new(1, -68, 0, 11)
                                    TextButton4.Text = v48 and "ARMED" or "CROSS"
                                    workOrder = v48
                                    format = if workOrder then t1.burgText or t1.amber else t1.amber
                                    TextButton4.TextColor3 = format
                                    workOrder = v48
                                    format = if workOrder then t1.burgundy or t1.well else t1.well
                                    TextButton4.BackgroundColor3 = format
                                else
                                    v61 = v47

                                    if v61 then
                                        v46 = "SEND"
                                        TextButton4.Visible = true
                                        TextLabel.Size = UDim2.new(1, -68, 0, 11)
                                        TextButton4.Text = "SEND"
                                        TextButton4.TextColor3 = t1.amber
                                        TextButton4.BackgroundColor3 = t1.well
                                    else
                                        v46 = nil
                                        TextButton4.Visible = false
                                        TextLabel.Size = UDim2.new(1, -20, 0, 11)
                                    end

                                    v48 = false
                                end

                                v61 = result.sla

                                if v61 then
                                    if result.slaUrgent then
                                        TextLabel.Text = result.sla
                                        format = t9[result.slaTone]
                                        format = format or t1.eyebrow
                                        TextLabel.TextColor3 = format
                                    elseif v62 then
                                        format = v62.left

                                        local v71 = tonumber(format) or 0

                                        format = string.format
                                        TextLabel.Text = format("STAFF ON STRIKE  ·  %d:%02d", math.floor(v71 / 60), v71 % 60)
                                        TextLabel.TextColor3 = t1.burgHot
                                    else
                                        v61 = result.queued or 0

                                        if v61 > 0 then
                                            TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                                            TextLabel.TextColor3 = t1.amber
                                        else
                                            v61 = v47

                                            if v61 then
                                                local v73 = v47

                                                v73 = v73.unit
                                                TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v73)
                                                TextLabel.TextColor3 = t1.amber
                                            elseif (result.defective or 0) > 0 then
                                                TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                                TextLabel.TextColor3 = t1.amber
                                            elseif result.sla then
                                                TextLabel.Text = result.sla

                                                local v74 = t9[result.slaTone]

                                                v74 = v74 or t1.eyebrow
                                                TextLabel.TextColor3 = v74
                                            elseif result.workOrder then
                                                workOrder = result.workOrder
                                                TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                                TextLabel.TextColor3 = t1.eyebrow
                                            end
                                        end
                                    end
                                elseif v62 then
                                    format = v62.left

                                    local v76 = tonumber(format) or 0

                                    format = string.format
                                    TextLabel.Text = format("STAFF ON STRIKE  ·  %d:%02d", math.floor(v76 / 60), v76 % 60)
                                    TextLabel.TextColor3 = t1.burgHot
                                else
                                    v61 = result.queued or 0

                                    if v61 > 0 then
                                        TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                                        TextLabel.TextColor3 = t1.amber
                                    else
                                        v61 = v47

                                        if v61 then
                                            local v78 = v47

                                            v78 = v78.unit
                                            TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v78)
                                            TextLabel.TextColor3 = t1.amber
                                        elseif (result.defective or 0) > 0 then
                                            TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                            TextLabel.TextColor3 = t1.amber
                                        elseif result.sla then
                                            TextLabel.Text = result.sla

                                            local v79 = t9[result.slaTone]

                                            v79 = v79 or t1.eyebrow
                                            TextLabel.TextColor3 = v79
                                        elseif result.workOrder then
                                            workOrder = result.workOrder
                                            TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                            TextLabel.TextColor3 = t1.eyebrow
                                        end
                                    end
                                end

                                v61 = next(t7)

                                if v61 == nil then
                                    v61 = v37

                                    if not v61 then
                                        v61 = t8.on

                                        if not v61 then
                                            v61 = result.slaLedger or ""
                                            TextButton5.Text = v61 or ""
                                            TextButton5.TextColor3 = t1.dim or t1.burgHot
                                        end
                                    end
                                end
                            end
                        else
                            v47 = nil
                            v61 = v47

                            if v61 then
                                v61 = v47
                                v61 = v61.cr
                                format = cr

                                if v61 == format then
                                    v47 = nil
                                end
                            end

                            if v62 then
                                v46 = "CROSS"
                                TextButton4.Visible = true
                                TextLabel.Size = UDim2.new(1, -68, 0, 11)
                                TextButton4.Text = v48 and "ARMED" or "CROSS"
                                workOrder = v48
                                format = if workOrder then t1.burgText or t1.amber else t1.amber
                                TextButton4.TextColor3 = format
                                workOrder = v48
                                format = if workOrder then t1.burgundy or t1.well else t1.well
                                TextButton4.BackgroundColor3 = format
                            else
                                v61 = v47

                                if v61 then
                                    v46 = "SEND"
                                    TextButton4.Visible = true
                                    TextLabel.Size = UDim2.new(1, -68, 0, 11)
                                    TextButton4.Text = "SEND"
                                    TextButton4.TextColor3 = t1.amber
                                    TextButton4.BackgroundColor3 = t1.well
                                else
                                    v46 = nil
                                    TextButton4.Visible = false
                                    TextLabel.Size = UDim2.new(1, -20, 0, 11)
                                end

                                v48 = false
                            end

                            v61 = result.sla

                            if v61 then
                                if result.slaUrgent then
                                    TextLabel.Text = result.sla
                                    format = t9[result.slaTone]
                                    format = format or t1.eyebrow
                                    TextLabel.TextColor3 = format
                                elseif v62 then
                                    format = v62.left

                                    local v82 = tonumber(format) or 0

                                    format = string.format
                                    TextLabel.Text = format("STAFF ON STRIKE  ·  %d:%02d", math.floor(v82 / 60), v82 % 60)
                                    TextLabel.TextColor3 = t1.burgHot
                                else
                                    v61 = result.queued or 0

                                    if v61 > 0 then
                                        TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                                        TextLabel.TextColor3 = t1.amber
                                    else
                                        v61 = v47

                                        if v61 then
                                            local v84 = v47

                                            v84 = v84.unit
                                            TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v84)
                                            TextLabel.TextColor3 = t1.amber
                                        elseif (result.defective or 0) > 0 then
                                            TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                            TextLabel.TextColor3 = t1.amber
                                        elseif result.sla then
                                            TextLabel.Text = result.sla

                                            local v85 = t9[result.slaTone]

                                            v85 = v85 or t1.eyebrow
                                            TextLabel.TextColor3 = v85
                                        elseif result.workOrder then
                                            workOrder = result.workOrder
                                            TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                            TextLabel.TextColor3 = t1.eyebrow
                                        end
                                    end
                                end
                            elseif v62 then
                                format = v62.left

                                local v87 = tonumber(format) or 0

                                format = string.format
                                TextLabel.Text = format("STAFF ON STRIKE  ·  %d:%02d", math.floor(v87 / 60), v87 % 60)
                                TextLabel.TextColor3 = t1.burgHot
                            else
                                v61 = result.queued or 0

                                if v61 > 0 then
                                    TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                                    TextLabel.TextColor3 = t1.amber
                                else
                                    v61 = v47

                                    if v61 then
                                        local v89 = v47

                                        v89 = v89.unit
                                        TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v89)
                                        TextLabel.TextColor3 = t1.amber
                                    elseif (result.defective or 0) > 0 then
                                        TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                        TextLabel.TextColor3 = t1.amber
                                    elseif result.sla then
                                        TextLabel.Text = result.sla

                                        local v90 = t9[result.slaTone]

                                        v90 = v90 or t1.eyebrow
                                        TextLabel.TextColor3 = v90
                                    elseif result.workOrder then
                                        workOrder = result.workOrder
                                        TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                        TextLabel.TextColor3 = t1.eyebrow
                                    end
                                end
                            end

                            v61 = next(t7)

                            if v61 == nil then
                                v61 = v37

                                if not v61 then
                                    v61 = t8.on

                                    if not v61 then
                                        v61 = result.slaLedger or ""
                                        TextButton5.Text = v61 or ""
                                        TextButton5.TextColor3 = t1.dim or t1.burgHot
                                    end
                                end
                            end
                        end
                    else
                        workOrder = result.apology
                        v47 = type(workOrder) == "table" and result.apology.name and result.apology or nil
                        v61 = v47

                        if v61 then
                            v61 = v47
                            v61 = v61.cr
                            format = cr

                            if v61 == format then
                                v47 = nil
                            end
                        end

                        v61 = v47

                        if v61 then
                            v46 = "SEND"
                            TextButton4.Visible = true
                            TextLabel.Size = UDim2.new(1, -68, 0, 11)
                            TextButton4.Text = "SEND"
                            TextButton4.TextColor3 = t1.amber
                            TextButton4.BackgroundColor3 = t1.well
                        else
                            v46 = nil
                            TextButton4.Visible = false
                            TextLabel.Size = UDim2.new(1, -20, 0, 11)
                        end

                        v48 = false
                        v61 = result.sla

                        if v61 then
                            if result.slaUrgent then
                                TextLabel.Text = result.sla
                                format = t9[result.slaTone]
                                format = format or t1.eyebrow
                                TextLabel.TextColor3 = format
                            else
                                v61 = result.queued or 0

                                if v61 > 0 then
                                    TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                                    TextLabel.TextColor3 = t1.amber
                                else
                                    v61 = v47

                                    if v61 then
                                        local v92 = v47

                                        v92 = v92.unit
                                        TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v92)
                                        TextLabel.TextColor3 = t1.amber
                                    elseif (result.defective or 0) > 0 then
                                        TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                        TextLabel.TextColor3 = t1.amber
                                    elseif result.sla then
                                        TextLabel.Text = result.sla

                                        local v93 = t9[result.slaTone]

                                        v93 = v93 or t1.eyebrow
                                        TextLabel.TextColor3 = v93
                                    elseif result.workOrder then
                                        workOrder = result.workOrder
                                        TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                        TextLabel.TextColor3 = t1.eyebrow
                                    end
                                end
                            end
                        else
                            v61 = result.queued or 0

                            if v61 > 0 then
                                TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                                TextLabel.TextColor3 = t1.amber
                            else
                                v61 = v47

                                if v61 then
                                    local v95 = v47

                                    v95 = v95.unit
                                    TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v95)
                                    TextLabel.TextColor3 = t1.amber
                                elseif (result.defective or 0) > 0 then
                                    TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                    TextLabel.TextColor3 = t1.amber
                                elseif result.sla then
                                    TextLabel.Text = result.sla

                                    local v96 = t9[result.slaTone]

                                    v96 = v96 or t1.eyebrow
                                    TextLabel.TextColor3 = v96
                                elseif result.workOrder then
                                    workOrder = result.workOrder
                                    TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                    TextLabel.TextColor3 = t1.eyebrow
                                end
                            end
                        end

                        v61 = next(t7)

                        if v61 == nil then
                            v61 = v37

                            if not v61 then
                                v61 = t8.on

                                if not v61 then
                                    v61 = result.slaLedger or ""
                                    TextButton5.Text = v61 or ""
                                    TextButton5.TextColor3 = t1.dim or t1.burgHot
                                end
                            end
                        end
                    end
                else
                    workOrder = result.apology
                    v47 = type(workOrder) == "table" and result.apology.name and result.apology or nil
                    v61 = v47

                    if v61 then
                        v61 = v47
                        v61 = v61.cr
                        format = cr

                        if v61 == format then
                            v47 = nil
                        end
                    end

                    v61 = v47

                    if v61 then
                        v46 = "SEND"
                        TextButton4.Visible = true
                        TextLabel.Size = UDim2.new(1, -68, 0, 11)
                        TextButton4.Text = "SEND"
                        TextButton4.TextColor3 = t1.amber
                        TextButton4.BackgroundColor3 = t1.well
                    else
                        v46 = nil
                        TextButton4.Visible = false
                        TextLabel.Size = UDim2.new(1, -20, 0, 11)
                    end

                    v48 = false
                    v61 = result.sla

                    if v61 then
                        if result.slaUrgent then
                            TextLabel.Text = result.sla
                            format = t9[result.slaTone]
                            format = format or t1.eyebrow
                            TextLabel.TextColor3 = format
                        else
                            v61 = result.queued or 0

                            if v61 > 0 then
                                TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                                TextLabel.TextColor3 = t1.amber
                            else
                                v61 = v47

                                if v61 then
                                    local v98 = v47

                                    v98 = v98.unit
                                    TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v98)
                                    TextLabel.TextColor3 = t1.amber
                                elseif (result.defective or 0) > 0 then
                                    TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                    TextLabel.TextColor3 = t1.amber
                                elseif result.sla then
                                    TextLabel.Text = result.sla

                                    local v99 = t9[result.slaTone]

                                    v99 = v99 or t1.eyebrow
                                    TextLabel.TextColor3 = v99
                                elseif result.workOrder then
                                    workOrder = result.workOrder
                                    TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                    TextLabel.TextColor3 = t1.eyebrow
                                end
                            end
                        end
                    else
                        v61 = result.queued or 0

                        if v61 > 0 then
                            TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                            TextLabel.TextColor3 = t1.amber
                        else
                            v61 = v47

                            if v61 then
                                local v101 = v47

                                v101 = v101.unit
                                TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v101)
                                TextLabel.TextColor3 = t1.amber
                            elseif (result.defective or 0) > 0 then
                                TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                TextLabel.TextColor3 = t1.amber
                            elseif result.sla then
                                TextLabel.Text = result.sla

                                local v102 = t9[result.slaTone]

                                v102 = v102 or t1.eyebrow
                                TextLabel.TextColor3 = v102
                            elseif result.workOrder then
                                workOrder = result.workOrder
                                TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                TextLabel.TextColor3 = t1.eyebrow
                            end
                        end
                    end

                    v61 = next(t7)

                    if v61 == nil then
                        v61 = v37

                        if not v61 then
                            v61 = t8.on

                            if not v61 then
                                v61 = result.slaLedger or ""
                                TextButton5.Text = v61 or ""
                                TextButton5.TextColor3 = t1.dim or t1.burgHot
                            end
                        end
                    end
                end
            else
                UIStroke3.Color = t1.stroke
                format = if v57 then 0.35 elseif v62 then 0.78 else 0
                UIStroke3.Transparency = format
                paintEdge()
                v61 = v36

                if not v61 then
                    workOrder = n4

                    local v104

                    if workOrder > 0 then
                        v104 = v34

                        if not v34 then
                            v104 = if t8.on then t8.idle else v37 and v35 or v33
                        end
                    else
                        v104 = if t8.on then t8.idle else v37 and v35 or v33
                    end

                    LAUNCH.Text = v104
                end

                t8.dim()
                format = result.strike
                v61 = type(format)

                if v61 == "table" then
                    v61 = result.strike.active

                    if v61 then
                        v62 = result.strike or nil
                        workOrder = result.apology
                        v47 = type(workOrder) == "table" and result.apology.name and result.apology or nil
                        v61 = v47

                        if v61 then
                            v61 = v47
                            v61 = v61.cr
                            format = cr

                            if v61 == format then
                                v47 = nil
                            end
                        end

                        if v62 then
                            v46 = "CROSS"
                            TextButton4.Visible = true
                            TextLabel.Size = UDim2.new(1, -68, 0, 11)
                            TextButton4.Text = v48 and "ARMED" or "CROSS"
                            workOrder = v48
                            format = if workOrder then t1.burgText or t1.amber else t1.amber
                            TextButton4.TextColor3 = format
                            workOrder = v48
                            format = if workOrder then t1.burgundy or t1.well else t1.well
                            TextButton4.BackgroundColor3 = format
                        else
                            v61 = v47

                            if v61 then
                                v46 = "SEND"
                                TextButton4.Visible = true
                                TextLabel.Size = UDim2.new(1, -68, 0, 11)
                                TextButton4.Text = "SEND"
                                TextButton4.TextColor3 = t1.amber
                                TextButton4.BackgroundColor3 = t1.well
                            else
                                v46 = nil
                                TextButton4.Visible = false
                                TextLabel.Size = UDim2.new(1, -20, 0, 11)
                            end

                            v48 = false
                        end

                        v61 = result.sla

                        if v61 then
                            if result.slaUrgent then
                                TextLabel.Text = result.sla
                                format = t9[result.slaTone]
                                format = format or t1.eyebrow
                                TextLabel.TextColor3 = format
                            elseif v62 then
                                format = v62.left

                                local v106 = tonumber(format) or 0

                                format = string.format
                                TextLabel.Text = format("STAFF ON STRIKE  ·  %d:%02d", math.floor(v106 / 60), v106 % 60)
                                TextLabel.TextColor3 = t1.burgHot
                            else
                                v61 = result.queued or 0

                                if v61 > 0 then
                                    TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                                    TextLabel.TextColor3 = t1.amber
                                else
                                    v61 = v47

                                    if v61 then
                                        local v108 = v47

                                        v108 = v108.unit
                                        TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v108)
                                        TextLabel.TextColor3 = t1.amber
                                    elseif (result.defective or 0) > 0 then
                                        TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                        TextLabel.TextColor3 = t1.amber
                                    elseif result.sla then
                                        TextLabel.Text = result.sla

                                        local v109 = t9[result.slaTone]

                                        v109 = v109 or t1.eyebrow
                                        TextLabel.TextColor3 = v109
                                    elseif result.workOrder then
                                        workOrder = result.workOrder
                                        TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                        TextLabel.TextColor3 = t1.eyebrow
                                    end
                                end
                            end
                        elseif v62 then
                            format = v62.left

                            local v111 = tonumber(format) or 0

                            format = string.format
                            TextLabel.Text = format("STAFF ON STRIKE  ·  %d:%02d", math.floor(v111 / 60), v111 % 60)
                            TextLabel.TextColor3 = t1.burgHot
                        else
                            v61 = result.queued or 0

                            if v61 > 0 then
                                TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                                TextLabel.TextColor3 = t1.amber
                            else
                                v61 = v47

                                if v61 then
                                    local v113 = v47

                                    v113 = v113.unit
                                    TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v113)
                                    TextLabel.TextColor3 = t1.amber
                                elseif (result.defective or 0) > 0 then
                                    TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                    TextLabel.TextColor3 = t1.amber
                                elseif result.sla then
                                    TextLabel.Text = result.sla

                                    local v114 = t9[result.slaTone]

                                    v114 = v114 or t1.eyebrow
                                    TextLabel.TextColor3 = v114
                                elseif result.workOrder then
                                    workOrder = result.workOrder
                                    TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                    TextLabel.TextColor3 = t1.eyebrow
                                end
                            end
                        end
                    else
                        workOrder = result.apology
                        v47 = type(workOrder) == "table" and result.apology.name and result.apology or nil
                        v61 = v47

                        if v61 then
                            v61 = v47
                            v61 = v61.cr
                            format = cr

                            if v61 == format then
                                v47 = nil
                            end
                        end

                        v61 = v47

                        if v61 then
                            v46 = "SEND"
                            TextButton4.Visible = true
                            TextLabel.Size = UDim2.new(1, -68, 0, 11)
                            TextButton4.Text = "SEND"
                            TextButton4.TextColor3 = t1.amber
                            TextButton4.BackgroundColor3 = t1.well
                        else
                            v46 = nil
                            TextButton4.Visible = false
                            TextLabel.Size = UDim2.new(1, -20, 0, 11)
                        end

                        v48 = false
                        v61 = result.sla

                        if v61 then
                            if result.slaUrgent then
                                TextLabel.Text = result.sla
                                format = t9[result.slaTone]
                                format = format or t1.eyebrow
                                TextLabel.TextColor3 = format
                            else
                                v61 = result.queued or 0

                                if v61 > 0 then
                                    TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                                    TextLabel.TextColor3 = t1.amber
                                else
                                    v61 = v47

                                    if v61 then
                                        local v116 = v47

                                        v116 = v116.unit
                                        TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v116)
                                        TextLabel.TextColor3 = t1.amber
                                    elseif (result.defective or 0) > 0 then
                                        TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                        TextLabel.TextColor3 = t1.amber
                                    elseif result.sla then
                                        TextLabel.Text = result.sla

                                        local v117 = t9[result.slaTone]

                                        v117 = v117 or t1.eyebrow
                                        TextLabel.TextColor3 = v117
                                    elseif result.workOrder then
                                        workOrder = result.workOrder
                                        TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                        TextLabel.TextColor3 = t1.eyebrow
                                    end
                                end
                            end
                        else
                            v61 = result.queued or 0

                            if v61 > 0 then
                                TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                                TextLabel.TextColor3 = t1.amber
                            else
                                v61 = v47

                                if v61 then
                                    local v119 = v47

                                    v119 = v119.unit
                                    TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v119)
                                    TextLabel.TextColor3 = t1.amber
                                elseif (result.defective or 0) > 0 then
                                    TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                    TextLabel.TextColor3 = t1.amber
                                elseif result.sla then
                                    TextLabel.Text = result.sla

                                    local v120 = t9[result.slaTone]

                                    v120 = v120 or t1.eyebrow
                                    TextLabel.TextColor3 = v120
                                elseif result.workOrder then
                                    workOrder = result.workOrder
                                    TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                    TextLabel.TextColor3 = t1.eyebrow
                                end
                            end
                        end
                    end
                else
                    workOrder = result.apology
                    v47 = type(workOrder) == "table" and result.apology.name and result.apology or nil
                    v61 = v47

                    if v61 then
                        v61 = v47
                        v61 = v61.cr
                        format = cr

                        if v61 == format then
                            v47 = nil
                        end
                    end

                    v61 = v47

                    if v61 then
                        v46 = "SEND"
                        TextButton4.Visible = true
                        TextLabel.Size = UDim2.new(1, -68, 0, 11)
                        TextButton4.Text = "SEND"
                        TextButton4.TextColor3 = t1.amber
                        TextButton4.BackgroundColor3 = t1.well
                    else
                        v46 = nil
                        TextButton4.Visible = false
                        TextLabel.Size = UDim2.new(1, -20, 0, 11)
                    end

                    v48 = false
                    v61 = result.sla

                    if v61 then
                        if result.slaUrgent then
                            TextLabel.Text = result.sla
                            format = t9[result.slaTone]
                            format = format or t1.eyebrow
                            TextLabel.TextColor3 = format
                        else
                            v61 = result.queued or 0

                            if v61 > 0 then
                                TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                                TextLabel.TextColor3 = t1.amber
                            else
                                v61 = v47

                                if v61 then
                                    local v122 = v47

                                    v122 = v122.unit
                                    TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v122)
                                    TextLabel.TextColor3 = t1.amber
                                elseif (result.defective or 0) > 0 then
                                    TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                    TextLabel.TextColor3 = t1.amber
                                elseif result.sla then
                                    TextLabel.Text = result.sla

                                    local v123 = t9[result.slaTone]

                                    v123 = v123 or t1.eyebrow
                                    TextLabel.TextColor3 = v123
                                elseif result.workOrder then
                                    workOrder = result.workOrder
                                    TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                    TextLabel.TextColor3 = t1.eyebrow
                                end
                            end
                        end
                    else
                        v61 = result.queued or 0

                        if v61 > 0 then
                            TextLabel.Text = string.format("YOUR JOB IS QUEUED  ·  %d WAITING", result.queueDepth or result.queued)
                            TextLabel.TextColor3 = t1.amber
                        else
                            v61 = v47

                            if v61 then
                                local v125 = v47

                                v125 = v125.unit
                                TextLabel.Text = "APOLOGY DUE  ·  UNIT " .. tostring(v125)
                                TextLabel.TextColor3 = t1.amber
                            elseif (result.defective or 0) > 0 then
                                TextLabel.Text = string.format("%d DEFECTIVE, UNREPORTED", result.defective)
                                TextLabel.TextColor3 = t1.amber
                            elseif result.sla then
                                TextLabel.Text = result.sla

                                local v126 = t9[result.slaTone]

                                v126 = v126 or t1.eyebrow
                                TextLabel.TextColor3 = v126
                            elseif result.workOrder then
                                workOrder = result.workOrder
                                TextLabel.Text = workOrder .. "   " .. tostring(result.trade or "")
                                TextLabel.TextColor3 = t1.eyebrow
                            end
                        end
                    end
                end

                v61 = next(t7)

                if v61 == nil then
                    v61 = v37

                    if not v61 then
                        v61 = t8.on

                        if not v61 then
                            v61 = result.slaLedger or ""
                            TextButton5.Text = v61 or ""
                            TextButton5.TextColor3 = t1.dim or t1.burgHot
                        end
                    end
                end
            end

            t8.sync()
            task.wait(2)
            continue
        end

        if ok then
            t8.admin = false
            t8.sync()
        end

        task.wait(2)
    end
end)
TextButton4.MouseButton1Click:Connect(function() -- line: 919
    -- upvalues: t1 (copy), JANET_DEPLOY (copy), TextLabel (copy), TextButton4 (copy), v46 (ref), v47 (ref), cr (ref), v48 (ref)
    if v46 == "CROSS" then
        v48 = not v48
        v46 = "CROSS"
        TextButton4.Visible = true
        TextLabel.Size = UDim2.new(1, -68, 0, 11)
        TextButton4.Text = v48 and "ARMED" or "CROSS"
        TextButton4.TextColor3 = v48 and t1.burgText or t1.amber
        TextButton4.BackgroundColor3 = v48 and t1.burgundy or t1.well
    elseif v46 == "SEND" and v47 then
        local v128 = v47

        cr = v128.cr
        JANET_DEPLOY:FireServer({
            v128.name
        }, 1, {
            apology = true
        })
        TextButton4.Text = "SENT"
        TextLabel.Text = "APOLOGY SENT  ·  UNIT " .. tostring(v128.unit)
        TextLabel.TextColor3 = t1.eyebrow
        task.delay(2.5, function() -- line: 930
            -- upvalues: TextLabel (copy), TextButton4 (copy), v46 (ref), v48 (ref)
            if v46 ~= "SEND" then
                return
            end

            v46 = nil
            TextButton4.Visible = false
            TextLabel.Size = UDim2.new(1, -20, 0, 11)
            v48 = false
        end)
    end
end)

local v129 = false
local TextButton6 = Instance.new("TextButton")

TextButton6.Name = "COMMEND_TAB"
TextButton6.Size = UDim2.new(0, 52, 0, 14)
TextButton6.Position = UDim2.new(0, 126, 0, t2.resident - 3)
TextButton6.BackgroundColor3 = t1.well
TextButton6.BorderSizePixel = 0
TextButton6.Text = "COMMEND"
TextButton6.TextColor3 = t1.eyebrow
TextButton6.TextSize = 8
TextButton6.Font = Enum.Font.GothamBold
TextButton6.AutoButtonColor = false
TextButton6.Parent = PANEL
Instance.new("UICorner", TextButton6).CornerRadius = UDim.new(0, 2)
hoverable(TextButton6, t1.well, t1.wellHot)
TextButton6.MouseButton1Click:Connect(function() -- line: 956
    -- upvalues: t1 (copy), JANET_DEPLOY (copy), t7 (copy), v129 (ref), TextButton6 (copy)
    if not v129 then
        v129 = true

        local t11 = {}

        for v130 in pairs(t7) do
            table.insert(t11, v130)
        end

        if #t11 == 1 then
            JANET_DEPLOY:FireServer({
                t11[1]
            }, 1, {
                commend = true
            })
            TextButton6.Text = "FILED"
            TextButton6.TextColor3 = t1.amber
        else
            TextButton6.Text = #t11 == 0 and "PICK ONE" or "ONE ONLY"
            TextButton6.TextColor3 = t1.burgHot
        end

        task.wait(1.5)
        TextButton6.Text = "COMMEND"
        TextButton6.TextColor3 = t1.eyebrow
        v129 = false
    end
end)

local n5 = 1
local amber, wellHot = t1.amber, t1.wellHot

local function updateTargetBtnText() -- line: 980
    -- upvalues: t1 (copy), TARGET_BTN (copy), t7 (copy), refreshItinerary (copy), paintEdge (copy)
    local t12 = {}

    for v132 in pairs(t7) do
        table.insert(t12, v132)
    end

    table.sort(t12)

    if #t12 == 0 then
        TARGET_BTN.Text = "No target selected"
        TARGET_BTN.TextColor3 = t1.dim
    else
        if #t12 == 1 then
            TARGET_BTN.Text = t12[1]
        else
            TARGET_BTN.Text = #t12 .. " selected"
        end

        TARGET_BTN.TextColor3 = t1.warm
    end

    paintEdge()
    refreshItinerary()
end

local function refreshDropdown() -- line: 1000
    -- upvalues: t1 (copy), DROPDOWN (copy), JANET_PLAYERLIST (copy), t7 (copy), amber (copy), wellHot (copy), updateTargetBtnText (copy)
    for _, child in ipairs(DROPDOWN:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    local v133 = JANET_PLAYERLIST:InvokeServer()

    print("[JANET UI] Got " .. #v133 .. " names: " .. table.concat(v133, ", "))

    local t13 = {}

    for _, v134 in ipairs(v133) do
        t13[v134] = true
    end

    local v135 = false

    for v136 in pairs(t7) do
        if not t13[v136] then
            v135 = true
            t7[v136] = nil
        end
    end

    if v135 then
        updateTargetBtnText()
    end

    for v137, v138 in ipairs(v133) do
        local TextButton = Instance.new("TextButton")

        TextButton.Name = "ENTRY_" .. v137
        TextButton.LayoutOrder = v137
        TextButton.Size = UDim2.new(1, -4, 0, 28)
        TextButton.BackgroundColor3 = t7[v138] and amber or wellHot
        TextButton.BorderSizePixel = 0
        TextButton.AutoButtonColor = true
        TextButton.ZIndex = 20
        TextButton.Text = v138
        TextButton.TextColor3 = t7[v138] and t1.glazing or t1.warm
        TextButton.TextSize = 12
        TextButton.Font = Enum.Font.GothamMedium
        TextButton.TextXAlignment = Enum.TextXAlignment.Center
        TextButton.TextYAlignment = Enum.TextYAlignment.Center
        TextButton.TextTruncate = Enum.TextTruncate.AtEnd
        TextButton.Parent = DROPDOWN
        Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 2)
        TextButton.MouseButton1Click:Connect(function() -- line: 1036
            -- upvalues: TextButton (copy), v138 (copy), t1 (copy), t7 (copy), amber (copy), wellHot (copy), updateTargetBtnText (copy)
            if t7[v138] then
                t7[v138] = nil
            else
                t7[v138] = true
            end

            TextButton.BackgroundColor3 = t7[v138] and amber or wellHot
            TextButton.TextColor3 = t7[v138] and t1.glazing or t1.warm
            updateTargetBtnText()
        end)
    end

    DROPDOWN.CanvasSize = UDim2.new(0, 0, 0, #v133 * 30)
end

updateTargetBtnText()
Players.PlayerRemoving:Connect(function(p28) -- line: 1052
    -- upvalues: DROPDOWN (copy), t7 (copy), updateTargetBtnText (copy), refreshDropdown (copy)
    if t7[p28.Name] then
        t7[p28.Name] = nil
        updateTargetBtnText()

        if DROPDOWN.Visible then
            refreshDropdown()
        end
    end
end)
TARGET_BTN.MouseButton1Click:Connect(function() -- line: 1059
    -- upvalues: DROPDOWN (copy), refreshDropdown (copy)
    DROPDOWN.Visible = not DROPDOWN.Visible

    if DROPDOWN.Visible then
        refreshDropdown()
    end
end)

local t14 = {
    {
        key = "EV30",
        label = "30-DAY NOTICE"
    },
    {
        key = "EV10",
        label = "10-DAY NOTICE"
    },
    {
        key = "EVDP",
        label = "DEMAND FOR POSSESSION"
    }
}
local n6 = 1
local TextSize = COUNT.TextSize
local TextButton7 = Instance.new("TextButton")

TextButton7.Name = "SERVE_TAB"
TextButton7.Size = UDim2.new(0, 48, 0, 14)
TextButton7.Position = UDim2.new(0, 182, 0, t2.salvo - 3)
TextButton7.BackgroundColor3 = t1.well
TextButton7.BorderSizePixel = 0
TextButton7.TextSize = 8
TextButton7.Font = Enum.Font.GothamBold
TextButton7.AutoButtonColor = false
TextButton7.Parent = PANEL
Instance.new("UICorner", TextButton7).CornerRadius = UDim.new(0, 2)
hoverable(TextButton7, t1.well, t1.wellHot)

local function renderServe() -- line: 1091
    -- upvalues: t1 (copy), v37 (ref), TextButton7 (copy)
    TextButton7.Text = v37 and "SERVE ON" or "SERVE"
    TextButton7.TextColor3 = v37 and t1.amber or t1.eyebrow
end

TextButton7.Text = v37 and "SERVE ON" or "SERVE"
TextButton7.TextColor3 = v37 and t1.amber or t1.eyebrow

local amber2 = t2.rule3 + 1
local Frame4 = Instance.new("Frame")

Frame4.Name = "SERVE_VEIL"
Frame4.Size = UDim2.new(1, -20, 0, t2.rule4 - amber2)
Frame4.Position = UDim2.new(0, 10, 0, amber2)
Frame4.BackgroundColor3 = t1.glazing
Frame4.BackgroundTransparency = 0.2
Frame4.BorderSizePixel = 0
Frame4.Active = true
Frame4.ZIndex = 30
Frame4.Visible = false
Frame4.Parent = PANEL

local Frame5 = Instance.new("Frame")

Frame5.Name = "UNIT_CARD"
Frame5.Size = UDim2.new(1, 0, 0, t2.chip4 + 22 - t2.chip1)
Frame5.Position = UDim2.new(0, 0, 0, t2.chip1 - amber2)
Frame5.BackgroundColor3 = t1.well
Frame5.BorderSizePixel = 0
Frame5.ZIndex = 31
Frame5.Parent = Frame4
Instance.new("UICorner", Frame5).CornerRadius = UDim.new(0, 2)

local Frame6 = Instance.new("Frame")

Frame6.Name = "CARD_EDGE"
Frame6.Size = UDim2.new(0, 2, 1, 0)
Frame6.BorderSizePixel = 0
Frame6.ZIndex = 32
Frame6.Parent = Frame5

local function cardLine(p29, p30, p31, p32, p33, p34) -- line: 1133
    -- upvalues: Frame5 (copy)
    local TextLabel = Instance.new("TextLabel")

    TextLabel.Name = p29
    TextLabel.Size = UDim2.new(1, -22, 0, p31)
    TextLabel.Position = UDim2.new(0, 12, 0, p30)
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = p34
    TextLabel.TextSize = p32
    TextLabel.Font = p33
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
    TextLabel.ZIndex = 32
    TextLabel.Text = ""
    TextLabel.Parent = Frame5

    return TextLabel
end

local v141 = cardLine("CARD_UNIT", 12, 18, 14, Enum.Font.GothamBold, t1.warm)
local v142 = cardLine("CARD_PLACE", 32, 12, 9, Enum.Font.Code, t1.dim)
local v143 = cardLine("CARD_STATE", 62, 24, 11, Enum.Font.Code, t1.dim)

v143.TextWrapped = true
v143.TextYAlignment = Enum.TextYAlignment.Top

local function setCard(p35, p36, p37, p38) -- line: 1157
    -- upvalues: t1 (copy), Frame6 (copy), v141 (copy), v142 (copy), v143 (copy)
    v141.Text = p35
    v141.TextColor3 = p37 ~= "" and t1.warm or t1.dim
    v142.Text = p36
    v143.Text = p37
    v143.TextColor3 = p38
    Frame6.BackgroundColor3 = p38
end

local t15

local function checkUnit(p39) -- line: 1173
    -- upvalues: t1 (copy), v7 (copy), TextBox (copy), v37 (ref), TextButton5 (copy), n3 (ref), Frame6 (copy), v141 (copy), v142 (copy), v143 (copy), t15 (ref)
    if not v37 then
        return
    end

    n3 += 1

    local v144 = n3
    local v145 = TextBox.Text:upper():match("^%s*(.-)%s*$")

    TextButton5.Text = ""
    TextButton5.TextColor3 = t1.dim or t1.burgHot

    if v145 == "" then
        local dim = t1.dim

        v141.Text = "ENTER A UNIT NUMBER"
        v141.TextColor3 = t1.dim
        v142.Text = ""
        v143.Text = ""
        v143.TextColor3 = dim
        Frame6.BackgroundColor3 = dim
    else
        local v146 = "UNIT " .. v145
        local v147 = if v7 then "CHECKING..." else "NOT CHECKED"
        local eyebrow = t1.eyebrow

        v141.Text = v146
        v141.TextColor3 = v147 ~= "" and t1.warm or t1.dim
        v142.Text = ""
        v143.Text = v147
        v143.TextColor3 = eyebrow
        Frame6.BackgroundColor3 = eyebrow

        if v7 then
            task.delay(p39, function() -- line: 1186
                -- upvalues: v144 (copy), v145 (copy), v146 (copy), t1 (copy), v7 (copy), TextButton5 (copy), n3 (ref), Frame6 (copy), v141 (copy), v142 (copy), v143 (copy), t15 (ref)
                if v144 ~= n3 then
                    return
                end

                local function v148() -- line: 1188
                    -- upvalues: v145 (copy), v7 (copy)
                    return v7:InvokeServer("unit:" .. v145)
                end

                local ok, result = pcall(v148)

                if v144 == n3 then
                    if not ok or type(result) ~= "table" then
                        t15 = nil

                        local eyebrow = t1.eyebrow

                        v141.Text = v146
                        v141.TextColor3 = t1.warm or t1.dim
                        v142.Text = ""
                        v143.Text = "NOT CHECKED"
                        v143.TextColor3 = eyebrow
                        Frame6.BackgroundColor3 = eyebrow
                    elseif result.ok == true then
                        t15 = nil
                        TextButton5.Text = result.text or "" or ""
                        TextButton5.TextColor3 = t1.dim or t1.burgHot

                        local v150 = result.unitText or v146
                        local v151 = result.placeText or ""
                        local amber = t1.amber

                        v141.Text = v150
                        v141.TextColor3 = t1.warm or t1.dim
                        v142.Text = v151
                        v143.Text = "READY"
                        v143.TextColor3 = amber
                        Frame6.BackgroundColor3 = amber
                    else
                        t15 = {
                            unit = v145,
                            reason = result.text or "REFUSED"
                        }

                        local reason = t15.reason
                        local burgHot = t1.burgHot

                        v141.Text = v146
                        v141.TextColor3 = reason ~= "" and t1.warm or t1.dim
                        v142.Text = ""
                        v143.Text = reason
                        v143.TextColor3 = burgHot
                        Frame6.BackgroundColor3 = burgHot
                    end
                end
            end)
        end
    end
end

TextBox:GetPropertyChangedSignal("Text"):Connect(function() -- line: 1204
    -- upvalues: TextBox (copy), paintEdge (copy), checkUnit (copy)
    local Text = TextBox.Text
    local v152 = Text:upper():sub(1, 12)

    if v152 == Text then
        paintEdge()
        checkUnit(0.7)
    else
        TextBox.Text = v152
    end
end)
TextBox.FocusLost:Connect(function() -- line: 1216
    -- upvalues: checkUnit (copy)
    checkUnit(0)
end)
TextButton5.MouseButton1Click:Connect(function() -- line: 1217
    -- upvalues: checkUnit (copy)
    checkUnit(0)
end)

local function stepForm(p40) -- line: 1219
    -- upvalues: COUNT (copy), t14 (copy), n6 (ref)
    n6 = (n6 - 1 + p40) % #t14 + 1
    COUNT.Text = t14[n6].label
end

local function setServe(p41) -- line: 1224
    -- upvalues: t1 (copy), TARGET_BTN (copy), DROPDOWN (copy), COUNT (copy), LAUNCH (copy), TextBox (copy), RESIDENT (copy), SALVO (copy), TextButton2 (copy), t5 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (ref), v37 (ref), t8 (copy), refreshItinerary (copy), n4 (ref), paintEdge (copy), TextButton6 (copy), n5 (ref), t14 (copy), n6 (ref), TextSize (copy), TextButton7 (copy), Frame4 (copy), checkUnit (copy)
    v37 = p41

    if p41 and t8.on then
        t8.set(false)
    end

    TextButton7.Text = v37 and "SERVE ON" or "SERVE"
    TextButton7.TextColor3 = v37 and t1.amber or t1.eyebrow
    RESIDENT.Text = (p41 and "UNIT NO." or "RESIDENT"):gsub("(.)", "%1 "):gsub("%s+$", "")
    TARGET_BTN.Visible = not p41
    TextBox.Visible = p41
    TextButton2.Visible = not p41
    TextButton6.Visible = not p41

    if p41 then
        DROPDOWN.Visible = false
    end

    SALVO.Text = (p41 and "FORM" or "SALVO"):gsub("(.)", "%1 "):gsub("%s+$", "")
    COUNT.TextSize = if p41 then 12 else TextSize

    local label = if p41 then t14[n6].label else nil

    COUNT.Text = if not p41 or not label then tostring(n5) else label
    Frame4.Visible = p41

    for _, v155 in ipairs(t5) do
        v155.Visible = not p41
    end

    paintEdge()

    if not v36 then
        local v156

        if n4 > 0 then
            v156 = v34

            if not v34 then
                v156 = if t8.on then t8.idle else v37 and v35 or v33
            end
        else
            v156 = if t8.on then t8.idle else v37 and v35 or v33
        end

        LAUNCH.Text = v156
    end

    t8.dim()

    if p41 then
        checkUnit(0)
    else
        refreshItinerary()
    end
end

TextButton7.MouseButton1Click:Connect(function() -- line: 1248
    -- upvalues: v37 (ref), setServe (copy)
    setServe(not v37)
end)

local v157 = t2.chip1 - 2
local PlaceholderText = TextBox.PlaceholderText
local LBL_FIRECTL = PANEL:FindFirstChild("LBL_FIRECTL")

local function line(p42, p43, p44, p45, p46, p47, p48, p49, p50) -- line: 1265
    local TextLabel = Instance.new("TextLabel")

    TextLabel.Name = p43
    TextLabel.Size = UDim2.new(1, p46, 0, p47)
    TextLabel.Position = UDim2.new(0, p44, 0, p45)
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = p50
    TextLabel.TextSize = p48
    TextLabel.Font = p49
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
    TextLabel.ZIndex = p42.ZIndex + 1
    TextLabel.Text = ""
    TextLabel.Parent = p42

    return TextLabel
end

local TextButton8 = Instance.new("TextButton")

TextButton8.Name = "ACTS_TAB"
TextButton8.Size = UDim2.new(0, 44, 0, 14)
TextButton8.Position = UDim2.new(0, 134, 0, t2.salvo - 3)
TextButton8.BackgroundColor3 = t1.well
TextButton8.BorderSizePixel = 0
TextButton8.TextSize = 8
TextButton8.Font = Enum.Font.GothamBold
TextButton8.AutoButtonColor = false
TextButton8.Parent = PANEL
Instance.new("UICorner", TextButton8).CornerRadius = UDim.new(0, 2)
hoverable(TextButton8, t1.well, t1.wellHot)

local function renderTab() -- line: 1295
    -- upvalues: t1 (copy), t8 (copy), TextButton8 (copy)
    TextButton8.Text = t8.on and "ACTS ON" or "ACTS"
    TextButton8.TextColor3 = t8.on and t1.amber or t1.eyebrow
end

TextButton8.Text = t8.on and "ACTS ON" or "ACTS"
TextButton8.TextColor3 = t8.on and t1.amber or t1.eyebrow

local TextLabel2 = Instance.new("TextLabel")

TextLabel2.Name = "ACT_NOTE"
TextLabel2.Size = TARGET_BTN.Size
TextLabel2.Position = TARGET_BTN.Position
TextLabel2.BackgroundColor3 = t1.well
TextLabel2.BorderSizePixel = 0
TextLabel2.TextColor3 = t1.dim
TextLabel2.TextSize = 12
TextLabel2.Font = Enum.Font.GothamMedium
TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
TextLabel2.Visible = false
TextLabel2.Parent = PANEL
Instance.new("UICorner", TextLabel2).CornerRadius = UDim.new(0, 2)
Instance.new("UIPadding", TextLabel2).PaddingLeft = UDim.new(0, 11)

local Frame7 = Instance.new("Frame")

Frame7.Name = "ACTS_VEIL"
Frame7.Size = UDim2.new(1, -20, 0, t2.rule4 - v157)
Frame7.Position = UDim2.new(0, 10, 0, v157)
Frame7.BackgroundColor3 = t1.glazing
Frame7.BorderSizePixel = 0
Frame7.Active = true
Frame7.ZIndex = 30
Frame7.Visible = false
Frame7.Parent = PANEL

local t16 = {}
local v158

for i = 1, 4 do
    local TextButton = Instance.new("TextButton")

    TextButton.Name = "ACT_ROW_" .. i
    TextButton.Size = UDim2.new(1, 0, 0, 24)
    TextButton.Position = UDim2.new(0, 0, 0, 2 + (i - 1) * 26)
    TextButton.BackgroundColor3 = t1.well
    TextButton.BorderSizePixel = 0
    TextButton.Text = ""
    TextButton.ZIndex = 31
    TextButton.Visible = false
    TextButton.Parent = Frame7
    Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 2)
    hoverable(TextButton, t1.well, t1.wellHot)

    local Frame = Instance.new("Frame")

    Frame.Name = "EDGE"
    Frame.Size = UDim2.new(0, 2, 1, 0)
    Frame.BackgroundColor3 = t1.amber
    Frame.BackgroundTransparency = 1
    Frame.BorderSizePixel = 0
    Frame.ZIndex = 32
    Frame.Parent = TextButton
    t16[i] = {
        btn = TextButton,
        edge = Frame,
        title = line(TextButton, "TITLE", 10, 2, -70, 12, 10, Enum.Font.GothamBold, t1.warm),
        blurb = line(TextButton, "BLURB", 10, 13, -18, 10, 8, Enum.Font.Code, t1.dim),
        mins = line(TextButton, "MINS", 164, 3, -172, 10, 8, Enum.Font.Code, t1.eyebrow)
    }
    t16[i].mins.TextXAlignment = Enum.TextXAlignment.Right
    v158 = TextButton.MouseButton1Click
    v158:Connect(function() -- line: 1366
        -- upvalues: t8 (copy), i (copy)
        t8.choose((t8.page - 1) * 4 + i)
    end)
end

local Frame8 = Instance.new("Frame")

Frame8.Name = "ACT_NOW"
Frame8.Size = UDim2.new(1, 0, 1, 0)
Frame8.BackgroundColor3 = t1.well
Frame8.BorderSizePixel = 0
Frame8.Active = true
Frame8.ZIndex = 33
Frame8.Visible = false
Frame8.Parent = Frame7
Instance.new("UICorner", Frame8).CornerRadius = UDim.new(0, 2)

local Frame9 = Instance.new("Frame")

Frame9.Name = "NOW_EDGE"
Frame9.Size = UDim2.new(0, 2, 1, 0)
Frame9.BorderSizePixel = 0
Frame9.ZIndex = 34
Frame9.Parent = Frame8
line(Frame8, "NOW_HEAD", 12, 12, -22, 10, 8, Enum.Font.GothamBold, t1.eyebrow).Text = ("ON THE STAGE"):gsub("(.)", "%1 "):gsub("%s+$", "")

local v159 = line(Frame8, "NOW_TITLE", 12, 28, -22, 16, 12, Enum.Font.GothamBold, t1.warm)
local v160 = line(Frame8, "NOW_LEFT", 12, 50, -22, 20, 16, Enum.Font.Code, t1.amber)

line(Frame8, "NOW_HINT", 12, 84, -22, 10, 9, Enum.Font.Code, t1.dim).Text = "ABORT STANDS IT DOWN"

local function pageButton(p51, p52, p53, p54) -- line: 1399
    -- upvalues: PANEL (copy), t1 (copy), hoverable (copy), t2 (copy)
    local TextButton = Instance.new("TextButton")

    TextButton.Name = p51
    TextButton.Size = UDim2.new(0, p54, 0, 14)
    TextButton.Position = UDim2.new(0, p53, 0, t2.firectl - 3)
    TextButton.BackgroundColor3 = t1.well
    TextButton.BorderSizePixel = 0
    TextButton.Text = p52
    TextButton.TextColor3 = t1.eyebrow
    TextButton.TextSize = 8
    TextButton.Font = Enum.Font.GothamBold
    TextButton.AutoButtonColor = false
    TextButton.Visible = false
    TextButton.Parent = PANEL
    Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 2)
    hoverable(TextButton, t1.well, t1.wellHot)

    return TextButton
end

local v161 = pageButton("ACT_PREV", "<", 164, 16)

v158 = pageButton("ACT_NEXT", ">", 214, 16)

local TextLabel3 = Instance.new("TextLabel")

TextLabel3.Name = "ACT_PAGE"
TextLabel3.Size = UDim2.new(0, 28, 0, 14)
TextLabel3.Position = UDim2.new(0, 184, 0, t2.firectl - 3)
TextLabel3.BackgroundTransparency = 1
TextLabel3.TextColor3 = t1.eyebrow
TextLabel3.TextSize = 8
TextLabel3.Font = Enum.Font.Code
TextLabel3.Visible = false
TextLabel3.Parent = PANEL

local t17 = {
    v161,
    TextLabel3,
    v158
}

function t8.entry() -- line: 1431
    -- upvalues: t8 (copy)
    for _, v162 in ipairs(t8.list or {}) do
        if v162.key == t8.pick then
            return v162
        end
    end
end

function t8.unit() -- line: 1438
    -- upvalues: TextBox (copy), t8 (copy)
    local v163 = t8.entry()
    local v164, v165

    if v163 and v163.arg == "unit" then
        local v166 = TextBox.Text:upper():match("^%s*(.-)%s*$")

        if v166 then
            v164 = v166
            v165 = true
        else
            v165 = false
        end
    else
        v165 = false
    end

    if not v165 then
        v164 = ""
    end

    return v164
end

local function say(p55) -- line: 1444
    -- upvalues: t1 (copy), t8 (copy), TextButton5 (copy)
    if t8.list then
        if p55 then
            TextButton5.Text = p55.blurb or ""
        else
            TextButton5.Text = #t8.list > 0 and "PICK AN ACT, THEN PRESS START" or "NO ACTS ARE REGISTERED" or ""
        end

        TextButton5.TextColor3 = t1.dim or t1.burgHot
    else
        local v168 = if t8.failed then "NO ACT LIST FROM THE BRAIN" else ""
        local v169 = not t8.failed

        TextButton5.Text = v168 or ""
        TextButton5.TextColor3 = v169 and t1.dim or t1.burgHot
    end
end

function t8.check(p56) -- line: 1457
    -- upvalues: t1 (copy), v7 (copy), t8 (copy), TextButton5 (copy), n3 (ref)
    if t8.on then
        n3 += 1

        local v170 = n3
        local v171 = t8.entry()
        local v172 = t8.unit()

        t8.refusal = nil
        t8.checked = nil

        if v172 == "" then
            if t8.list then
                if v171 then
                    TextButton5.Text = v171.blurb or ""
                else
                    TextButton5.Text = #t8.list > 0 and "PICK AN ACT, THEN PRESS START" or "NO ACTS ARE REGISTERED" or ""
                end

                TextButton5.TextColor3 = t1.dim or t1.burgHot
            else
                local v174 = if t8.failed then "NO ACT LIST FROM THE BRAIN" else ""
                local v175 = not t8.failed

                TextButton5.Text = v174 or ""
                TextButton5.TextColor3 = v175 and t1.dim or t1.burgHot
            end
        else
            local v176 = "UNIT " .. v172

            if v7 then
                TextButton5.Text = v176 .. "  ·  CHECKING..." or ""
                TextButton5.TextColor3 = t1.dim or t1.burgHot
                task.delay(p56, function() -- line: 1475
                    -- upvalues: v170 (copy), v172 (copy), v176 (copy), t1 (copy), v7 (copy), t8 (copy), TextButton5 (copy), n3 (ref)
                    if v170 ~= n3 then
                        return
                    end

                    local function v178() -- line: 1477
                        -- upvalues: v172 (copy), v7 (copy)
                        return v7:InvokeServer("unit:" .. v172)
                    end

                    local ok, result = pcall(v178)

                    if v170 == n3 then
                        if not ok or type(result) ~= "table" then
                            t8.refusal = {
                                reason = "NOT CHECKED",
                                unit = v172
                            }
                            TextButton5.Text = v176 .. "  ·  NOT CHECKED" or ""
                            TextButton5.TextColor3 = t1.burgHot
                        elseif result.ok == true then
                            t8.checked = v172
                            TextButton5.Text = (result.unitText or v176) .. "  ·  " .. (result.placeText or "READY") or ""
                            TextButton5.TextColor3 = t1.dim or t1.burgHot
                            TextButton5.TextColor3 = t1.amber
                        else
                            t8.refusal = {
                                unit = v172,
                                reason = result.text or "REFUSED"
                            }
                            TextButton5.Text = v176 .. "  ·  " .. t8.refusal.reason or ""
                            TextButton5.TextColor3 = t1.burgHot
                        end
                    end
                end)
            else
                t8.refusal = {
                    reason = "NOT CHECKED",
                    unit = v172
                }
                TextButton5.Text = v176 .. "  ·  NOT CHECKED" or ""
                TextButton5.TextColor3 = t1.burgHot
            end
        end
    end
end

local function pages() -- line: 1493
    -- upvalues: t8 (copy)
    return (math.max(1, (math.ceil(#(t8.list or {}) / 4))))
end

local function paintList() -- line: 1497
    -- upvalues: t1 (copy), t8 (copy), t16 (copy), TextLabel3 (copy)
    local v185 = t8.list or {}

    t8.page = math.clamp(t8.page, 1, (math.max(1, (math.ceil(#(t8.list or {}) / 4)))))

    for v189, v190 in ipairs(t16) do
        local v191 = v185[(t8.page - 1) * 4 + v189]

        v190.btn.Visible = v191 ~= nil

        if v191 then
            local v192 = v191.key == t8.pick

            v190.edge.BackgroundTransparency = v192 and 0 or 1
            v190.title.Text = v191.title
            v190.title.TextColor3 = v192 and t1.amber or t1.warm
            v190.blurb.Text = v191.blurb
            v190.mins.Text = v191.mins
        end
    end

    TextLabel3.Text = t8.page .. "/" .. math.max(1, (math.ceil(#(t8.list or {}) / 4)))
end

local function paintPick() -- line: 1517
    -- upvalues: t1 (copy), COUNT (copy), TextBox (copy), t8 (copy), paintEdge (copy), TextLabel2 (copy), paintList (copy)
    local v195 = t8.entry()
    local v196 = v195 ~= nil and v195.arg == "unit"

    TextBox.Visible = v196
    TextLabel2.Visible = not v196

    local title

    if v195 then
        TextLabel2.Text = "NO UNIT NEEDED"
        title = v195.title or "NONE"
    else
        if t8.list then
            TextLabel2.Text = #t8.list > 0 and "PICK AN ACT" or "NONE REGISTERED"
        else
            TextLabel2.Text = t8.failed and "NOT AVAILABLE" or "LOADING..."
        end

        title = "NONE"
    end

    COUNT.Text = title
    COUNT.TextColor3 = v195 and t1.warm or t1.dim
    paintEdge()
    paintList()
    t8.check(0)
end

function t8.choose(p57) -- line: 1536
    -- upvalues: t8 (copy), paintPick (copy)
    local v198 = (t8.list or {})[p57]

    if not v198 then
        return
    end

    t8.pick = v198.key
    t8.page = math.ceil(p57 / 4)
    paintPick()
end

function t8.step(p58) -- line: 1545
    -- upvalues: t8 (copy)
    local v200 = #(t8.list or {})

    if v200 == 0 then
        return
    end

    local n7 = 0

    for v201, v202 in ipairs(t8.list) do
        if v202.key == t8.pick then
            n7 = v201
        end
    end

    if n7 ~= 0 then
        t8.choose((n7 - 1 + p58) % v200 + 1)

        return
    end

    local choose = t8.choose

    if p58 > 0 then
        v200 = 1
    end

    choose(v200)
end

local function turn(p59) -- line: 1559
    -- upvalues: t8 (copy), paintList (copy)
    t8.page = (t8.page - 1 + p59) % math.max(1, (math.ceil(#(t8.list or {}) / 4))) + 1
    paintList()
end

v161.MouseButton1Click:Connect(function() -- line: 1563
    -- upvalues: t8 (copy), paintList (copy)
    t8.page = (t8.page - 1 + -1) % math.max(1, (math.ceil(#(t8.list or {}) / 4))) + 1
    paintList()
end)
v158.MouseButton1Click:Connect(function() -- line: 1564
    -- upvalues: t8 (copy), paintList (copy)
    t8.page = (t8.page - 1 + 1) % math.max(1, (math.ceil(#(t8.list or {}) / 4))) + 1
    paintList()
end)

local n8 = 0

local function fetch() -- line: 1569
    -- upvalues: v7 (copy), t8 (copy), paintPick (copy), n8 (ref)
    n8 += 1

    local v212 = n8

    t8.failed = false

    if v7 then
        task.spawn(function() -- line: 1577
            -- upvalues: v212 (copy), v7 (copy), t8 (copy), paintPick (copy), n8 (ref)
            local function v213() -- line: 1578
                -- upvalues: v7 (copy)
                return v7:InvokeServer("acts")
            end

            local ok, result = pcall(v213)

            if v212 == n8 and t8.on then
                if not not (ok and type(result) == "table" and result.ok == true and type(result.acts) == "table") then
                    local t18 = {}

                    for _, v215 in ipairs(result.acts) do
                        if type(v215) == "table" and type(v215.key) == "string" then
                            table.insert(t18, {
                                key = v215.key,
                                title = tostring(v215.title or v215.key),
                                blurb = tostring(v215.blurb or ""),
                                arg = v215.arg,
                                mins = if tonumber(v215.secs) then math.max(1, (math.floor(v215.secs / 60 + 0.5))) .. " MIN" or "" else ""
                            })
                        end
                    end

                    t8.list = t18
                else
                    t8.failed = true
                end

                paintPick()
            end
        end)
    else
        t8.failed = true
    end
end

function t8.paintNow() -- line: 1602
    -- upvalues: t1 (copy), t8 (copy), Frame8 (copy), Frame9 (copy), v159 (copy), v160 (copy), t17 (copy)
    local now = t8.now
    local v220 = t8.on and now ~= nil

    Frame8.Visible = v220

    for _, v221 in ipairs(t17) do
        v221.Visible = t8.on and not v220
    end

    if not v220 then
        return
    end

    local v224 = math.max(0, (math.floor((tonumber(now.left) or 0) - (os.clock() - t8.at))))
    local v225 = now.ending == true

    v159.Text = tostring(now.title)
    Frame9.BackgroundColor3 = v225 and t1.burgHot or t1.amber
    v160.TextColor3 = v225 and t1.burgHot or t1.amber

    if v225 then
        v160.Text = "WINDING UP"
    elseif v224 > 0 then
        v160.Text = string.format("%d:%02d  LEFT", math.floor(v224 / 60), v224 % 60)
    else
        v160.Text = "FINISHING"
    end
end

local function tick() -- line: 1622
    -- upvalues: t8 (copy)
    if not t8.ticking then
        t8.ticking = true
        task.spawn(function() -- line: 1625
            -- upvalues: t8 (copy)
            while t8.on and t8.now do
                t8.paintNow()
                task.wait(0.5)
            end

            t8.ticking = false
        end)
    end
end

function t8.dim() -- line: 1636
    -- upvalues: LAUNCH (copy), t8 (copy), n4 (ref)
    local on = t8.on and n4 == 0 and (t8.now ~= nil or not t8.admin)

    if on == t8.greyed then
        return
    end

    t8.greyed = on
    LAUNCH.BackgroundTransparency = on and 0.7 or 0
    LAUNCH.TextTransparency = on and 0.5 or 0
end

function t8.sync() -- line: 1644
    -- upvalues: t8 (copy)
    t8.dim()

    if t8.on then
        t8.paintNow()

        if t8.now then
            if t8.ticking then
                return
            end

            t8.ticking = true
            task.spawn(function() -- line: 1625
                -- upvalues: t8 (copy)
                while t8.on and t8.now do
                    t8.paintNow()
                    task.wait(0.5)
                end

                t8.ticking = false
            end)
        end
    end
end

function t8.blocked() -- line: 1652
    -- upvalues: t8 (copy)
    if not t8.admin then
        return "NOT ADMIN"
    end

    if t8.now then
        return "ACT IS ON"
    end

    if not t8.entry() then
        return "NO ACT"
    end

    local v227 = t8.unit()

    if v227 == "" or t8.checked == v227 then
        return nil
    end

    if t8.refusal and t8.refusal.unit == v227 then
        return t8.refusal.reason:sub(1, 16)
    end

    t8.check(0)

    return "CHECKING"
end

function t8.set(p60) -- line: 1663
    -- upvalues: t1 (copy), TARGET_BTN (copy), DROPDOWN (copy), COUNT (copy), LAUNCH (copy), v7 (copy), TextBox (copy), RESIDENT (copy), SALVO (copy), TextButton2 (copy), t5 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (ref), v37 (ref), t8 (copy), n3 (ref), refreshItinerary (copy), n4 (ref), paintEdge (copy), TextButton6 (copy), n5 (ref), TextSize (copy), setServe (copy), PlaceholderText (copy), LBL_FIRECTL (copy), TextButton8 (copy), TextLabel2 (copy), Frame7 (copy), paintPick (copy), n8 (ref)
    if p60 and v37 then
        setServe(false)
    end

    t8.on = p60
    TextButton8.Text = t8.on and "ACTS ON" or "ACTS"
    TextButton8.TextColor3 = t8.on and t1.amber or t1.eyebrow
    RESIDENT.Text = (p60 and "UNIT NO." or "RESIDENT"):gsub("(.)", "%1 "):gsub("%s+$", "")
    TARGET_BTN.Visible = not p60
    TextButton2.Visible = not p60
    TextButton6.Visible = not p60
    TextBox.PlaceholderText = if p60 then "BLANK: ACT CHOOSES ONE" else PlaceholderText

    if p60 then
        DROPDOWN.Visible = false
    else
        TextBox.Visible = false
        TextLabel2.Visible = false
    end

    SALVO.Text = (p60 and "ACT" or "SALVO"):gsub("(.)", "%1 "):gsub("%s+$", "")

    if p60 then
        COUNT.TextSize = 11
        COUNT.TextTruncate = Enum.TextTruncate.AtEnd
    else
        COUNT.TextSize = TextSize
        COUNT.TextTruncate = Enum.TextTruncate.None
        COUNT.TextColor3 = t1.warm
        COUNT.Text = tostring(n5)
    end

    LBL_FIRECTL.Text = (p60 and "ACTS" or "FIRE CONTROL"):gsub("(.)", "%1 "):gsub("%s+$", "")
    Frame7.Visible = p60

    for _, v230 in ipairs(t5) do
        v230.Visible = not p60
    end

    t8.paintNow()
    paintEdge()

    if not v36 then
        local v231

        if n4 > 0 then
            v231 = v34

            if not v34 then
                v231 = if t8.on then t8.idle else v37 and v35 or v33
            end
        else
            v231 = if t8.on then t8.idle else v37 and v35 or v33
        end

        LAUNCH.Text = v231
    end

    t8.dim()

    if not p60 then
        n3 += 1
        refreshItinerary()

        return
    end

    if not t8.list or #t8.list == 0 then
        n8 += 1

        local v232 = n8

        t8.failed = false

        if v7 then
            task.spawn(function() -- line: 1577
                -- upvalues: v232 (copy), v7 (copy), t8 (copy), paintPick (copy), n8 (ref)
                local function v233() -- line: 1578
                    -- upvalues: v7 (copy)
                    return v7:InvokeServer("acts")
                end

                local ok, result = pcall(v233)

                if v232 == n8 and t8.on then
                    if not not (ok and type(result) == "table" and result.ok == true and type(result.acts) == "table") then
                        local t20 = {}

                        for _, v235 in ipairs(result.acts) do
                            if type(v235) == "table" and type(v235.key) == "string" then
                                table.insert(t20, {
                                    key = v235.key,
                                    title = tostring(v235.title or v235.key),
                                    blurb = tostring(v235.blurb or ""),
                                    arg = v235.arg,
                                    mins = if tonumber(v235.secs) then math.max(1, (math.floor(v235.secs / 60 + 0.5))) .. " MIN" or "" else ""
                                })
                            end
                        end

                        t8.list = t20
                    else
                        t8.failed = true
                    end

                    paintPick()
                end
            end)
        else
            t8.failed = true
        end
    end

    paintPick()
end

TextButton8.MouseButton1Click:Connect(function() -- line: 1707
    -- upvalues: t8 (copy)
    t8.set(not t8.on)
end)
TextBox:GetPropertyChangedSignal("Text"):Connect(function() -- line: 1712
    -- upvalues: t8 (copy)
    if t8.on then
        t8.check(0.7)
    end
end)
TextBox.FocusLost:Connect(function() -- line: 1715
    -- upvalues: t8 (copy)
    if t8.on then
        t8.check(0)
    end
end)
TextButton5.MouseButton1Click:Connect(function() -- line: 1718
    -- upvalues: t8 (copy)
    if t8.on then
        t8.check(0)
    end
end)
MINUS.MouseButton1Click:Connect(function() -- line: 1723
    -- upvalues: COUNT (copy), v37 (ref), t8 (copy), n5 (ref), t14 (copy), n6 (ref)
    if v37 then
        n6 = (n6 - 1 + -1) % #t14 + 1
        COUNT.Text = t14[n6].label
    elseif t8.on then
        t8.step(-1)
    else
        n5 = math.max(1, n5 - 1)
        COUNT.Text = tostring(n5)
    end
end)
PLUS.MouseButton1Click:Connect(function() -- line: 1730
    -- upvalues: COUNT (copy), v37 (ref), t8 (copy), n5 (ref), t14 (copy), n6 (ref)
    if v37 then
        n6 = (n6 - 1 + 1) % #t14 + 1
        COUNT.Text = t14[n6].label
    elseif t8.on then
        t8.step(1)
    else
        n5 = math.min(36, n5 + 1)
        COUNT.Text = tostring(n5)
    end
end)
LAUNCH.MouseButton1Click:Connect(function() -- line: 1737
    -- upvalues: t1 (copy), LAUNCH (copy), JANET_DEPLOY (copy), JANET_RELEASE (copy), TextBox (copy), v14 (ref), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v33 (copy), v35 (copy), t7 (copy), v36 (ref), v37 (ref), t8 (copy), TextLabel (copy), TextButton4 (copy), v46 (ref), v48 (ref), n4 (ref), n5 (ref), t14 (copy), n6 (ref), t15 (ref)
    if v36 then
        return
    end

    if n4 > 0 then
        JANET_RELEASE:FireServer()
        v36 = true
        LAUNCH.Text = ("RELEASED"):gsub("(.)", "%1 "):gsub("%s+$", "")
        task.wait(1.5)

        local v244 = if t8.on then t8.idle else v37 and v35 or v33

        LAUNCH.Text = v244
        v36 = false
    elseif t8.on then
        local v246 = t8.blocked()

        if v246 then
            LAUNCH.Text = v246
            task.wait(1.2)

            local v247 = if t8.on then t8.idle else v37 and v35 or v33

            LAUNCH.Text = v247
        else
            v36 = true
            LAUNCH.Text = "STARTING"

            local v249 = t8.unit()

            JANET_DEPLOY:FireServer({}, 1, {
                act = t8.entry().key,
                actArg = if v249 == "" or not v249 then nil else v249
            })
            task.wait(3)

            local v250 = if t8.on then t8.idle else v37 and v35 or v33

            LAUNCH.Text = v250
            v36 = false
        end
    elseif v37 then
        local v252 = TextBox.Text:upper():match("^%s*(.-)%s*$")
        local v253 = t15 and t15.unit == v252
        local v254 = false
        local v255 = false
        local v256 = false
        local v257 = false

        if v252 == "" then
            v257 = true
        else
            v254 = true
        end

        if v254 then
            if v253 then
                v257 = true
            else
                v255 = true
            end
        end

        v254 = false

        local t24

        if v255 then
            v36 = true
            LAUNCH.Text = "SERVING"
            t24 = {
                serve = {
                    unit = v252,
                    form = t14[n6].key
                }
            }

            if v48 then
                v254 = true
            else
                v257 = false
            end
        end

        v255 = false

        if v254 then
            t24.crossPicket = true
            LAUNCH.Text = "CROSSING"
            v48 = false

            if v46 == "CROSS" then
                v255 = true
            else
                v257 = false
            end
        end

        v254 = false

        local TextButton

        if v255 then
            v46 = "CROSS"
            TextButton4.Visible = true
            TextLabel.Size = UDim2.new(1, -68, 0, 11)
            TextButton = TextButton4

            if v48 then
                v256 = true
            else
                v254 = true
            end
        end

        v255 = false

        local v258

        if v254 then
            v258 = "CROSS"
            v255 = true
        end

        v254 = false

        if v256 then
            v258 = "ARMED"
            v255 = true
        end

        v256 = false

        local TextButton2

        if v255 then
            TextButton.Text = v258
            TextButton2 = TextButton4

            if v48 then
                v256 = true
            else
                v254 = true
            end
        end

        v255 = false

        local v259

        if v256 then
            local burgText = t1.burgText

            if burgText then
                v259 = burgText
                v255 = true
            else
                v254 = true
            end
        end

        v256 = false

        if v254 then
            v259 = t1.amber
            v255 = true
        end

        v254 = false

        local TextButton3

        if v255 then
            TextButton2.TextColor3 = v259
            TextButton3 = TextButton4

            if v48 then
                v254 = true
            else
                v256 = true
            end
        end

        v255 = false

        local v260

        if v254 then
            local burgundy = t1.burgundy

            if burgundy then
                v260 = burgundy
                v255 = true
            else
                v256 = true
            end
        end

        if v256 then
            v260 = t1.well
            v255 = true
        end

        if v255 then
            v257 = false
            TextButton3.BackgroundColor3 = v260
        end

        if not v257 then
            JANET_DEPLOY:FireServer({}, 1, t24)
            task.wait(3)

            local v261 = if t8.on then t8.idle else v37 and v35 or v33

            LAUNCH.Text = v261
            v36 = false
        else
            LAUNCH.Text = v253 and t15.reason:sub(1, 16) or "NO UNIT"
            task.wait(1.2)

            local v264 = if t8.on then t8.idle else v37 and v35 or v33

            LAUNCH.Text = v264
        end
    else
        local t25 = {}

        for v266 in pairs(t7) do
            table.insert(t25, v266)
        end

        local v267 = v18.get()

        if #t25 == 0 and v267 == "MANUAL" then
            LAUNCH.Text = "NO TARGET"
            task.wait(1.2)
            LAUNCH.Text = if t8.on then t8.idle else v37 and v35 or v33
        else
            v36 = true
            LAUNCH.Text = "FIRING " .. n5

            local t26 = {
                profile = v15.get(),
                warhead = v16.get(),
                pattern = v17.get(),
                autoTarget = v267
            }

            if not v14 then
                t26.eta = false
            end

            local TextButton, v269

            if v48 then
                t26.crossPicket = true
                LAUNCH.Text = "CROSSING"
                v48 = false

                if v46 == "CROSS" then
                    v46 = "CROSS"
                    TextButton4.Visible = true
                    TextLabel.Size = UDim2.new(1, -68, 0, 11)
                    TextButton = TextButton4
                    v269 = if v48 then "ARMED" else "CROSS"
                    TextButton.Text = v269
                    TextButton4.TextColor3 = v48 and t1.burgText or t1.amber
                    TextButton4.BackgroundColor3 = v48 and t1.burgundy or t1.well
                end
            end

            JANET_DEPLOY:FireServer(t25, n5, t26)
            task.wait(3)

            local v271 = if t8.on then t8.idle else v37 and v35 or v33

            LAUNCH.Text = v271
            v36 = false
        end
    end
end)
