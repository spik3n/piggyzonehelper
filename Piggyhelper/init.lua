
------------------------------------------------------------
----------[[** Piggyzone Helper **]]------------------------
----------[[** written by Spiken **]]-----------------------
----[[** https://github.com/spik3n/piggyzonehelper **]]-----
------------------------------------------------------------
local mq = require('mq')
local imgui = require 'ImGui'

local zoneNames = {}
local selectedZone = nil
local searchText = "" 

local isParsed = false

local function parseIniFile()
    print("Parsing INI file...")

    if isParsed then
        return
    end

    local filePath = mq.configDir .. "\\MQ2PiggyZone.ini"
    local file = io.open(filePath, "r")
    if not file then
        print("Failed to open file: " .. filePath)
        return
    end

    local inZoneConnections = false
    for line in file:lines() do
        if line:match("^%[ZoneConnections%]$") then
            inZoneConnections = true
        elseif line:match("^%[.*%]$") and inZoneConnections then
            inZoneConnections = false
        elseif inZoneConnections then
            local zone, name = line:match('^(%d+)=(%a+) "([^"]+)"')
            if zone and name then
                table.insert(zoneNames, { zone = zone, name = name })
            else
                print("Failed to parse zone and name from line:", line)
            end
        end
    end

    file:close()
    isParsed = true
end

local function executeCommand(zoneName, commandType)
    local command
    if commandType == "Solo" then
        command = string.format("/zone %s", zoneName)
    elseif commandType == "Group" then
        command = string.format("/dgae /zone %s", zoneName)
    else
        print("Unknown command type:", commandType)
        return
    end
    mq.cmd(command)
    print("Selected zone name:", zoneName)
end

local function displayZoneNames()
    for _, zoneData in ipairs(zoneNames) do
        if searchText == "" or zoneData.name:lower():find(searchText:lower(), 1, true) then
            if imgui.Button(zoneData.name) then
                selectedZone = zoneData
                imgui.OpenPopup("Select Mode")
            end
        end
    end

    if imgui.BeginPopupModal("Select Mode", true) then
        imgui.Text("Select mode for " .. (selectedZone and selectedZone.name or ""))
        if imgui.Button("Solo") then
            executeCommand(selectedZone.name, "Solo")
            imgui.CloseCurrentPopup()
        end
        imgui.SameLine()
        if imgui.Button("Group") then
            executeCommand(selectedZone.name, "Group")
            imgui.CloseCurrentPopup()
        end
        imgui.EndPopup()
    end
end

local function zoneSelectorGui(open)
    local main_viewport = imgui.GetMainViewport()
    imgui.SetNextWindowPos(main_viewport.WorkPos.x + 650, main_viewport.WorkPos.y + 20, ImGuiCond.FirstUseEver)
    imgui.SetNextWindowSize(600, 300, ImGuiCond.FirstUseEver)

    open, show = imgui.Begin("Zone Selector", open)
    if not show then
        imgui.End()
        return open
    end

    searchText = imgui.InputText("Search", searchText, 100)
    displayZoneNames()

    imgui.End()
    return open
end

if not isParsed then
    parseIniFile()
end

local openGUI = true
ImGui.Register('GUIZoneSelector', function()
    openGUI = zoneSelectorGui(openGUI)
end)

while openGUI do
    mq.delay(1000)
end
