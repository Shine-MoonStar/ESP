local ESP = {}

function ESP.AddFolder(
    name: string
)
    local existing = workspace:FindFirstChild(name)
    if existing then return existing end

    local ESPFolder = Instance.new("Folder")
    ESPFolder.Parent = workspace
    ESPFolder.Name = name
    return ESPFolder
end

function ESP.AddESP(
    folderName: string,
    text: string,
    adornee: BasePart | Model,
    color: Color3,
    enablehighlight: boolean?
)
    local folder = workspace:FindFirstChild(folderName)
    if not folder then
        return
    end

    local ESPBillboardGui = Instance.new("BillboardGui")
    ESPBillboardGui.Name = adornee.Name .. "_Gui"
    ESPBillboardGui.Parent = folder
    ESPBillboardGui.Adornee = adornee
    ESPBillboardGui.Size = UDim2.new(0, 80, 0, 80)
    ESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
    ESPBillboardGui.AlwaysOnTop = true

    local ESPTextLabel = Instance.new("TextLabel")
    ESPTextLabel.Parent = ESPBillboardGui
    ESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
    ESPTextLabel.BackgroundTransparency = 1
    ESPTextLabel.Text = text
    ESPTextLabel.TextColor3 = color
    ESPTextLabel.TextStrokeTransparency = 0.5
    ESPTextLabel.TextScaled = true
    
    if enablehighlight then
        local highlight = Instance.new("Highlight")
        highlight.Name = adornee.Name .. "_Highlight"
        highlight.Parent = folder
        highlight.Adornee = adornee
        highlight.FillColor = color
        highlight.OutlineColor = Color3.new(1, 1, 1)
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end

function ESP.Clear(
    folderName: string
)
    local folder = workspace:FindFirstChild(folderName)
    if folder then
        folder:ClearAllChildren()
    end
end

return ESP
