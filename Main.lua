local clonedfunc = clonefunction(loadstring) --don't judge my shit code i never planned on making public

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

local NewOrion = {Flags = Rayfield.Flags}

local function keycodetostring(kc)
    local splits = string.split(tostring(kc), ".")
    return splits[#splits]
end

function NewOrion:MakeWindow(t)
    local window = Rayfield:CreateWindow({ --put ur window config here, im kinda lazy so like this is what i used before
        Name = "AnomVanguard",
        Icon = 0,
        LoadingTitle = "AnomVanguard",
        LoadingSubtitle = "by Vanguard frfr",
        Theme = "Default",

        DisableRayfieldPrompts = true,
        DisableBuildWarnings = true,

        ConfigurationSaving = {
            Enabled = true,
            FolderName = "AnomV",
            FileName = "Anomv"
        },

        Discord = {
            Enabled = false,
            Invite = "noinvitelink",
            RememberJoins = true
        },

        KeySystem = false,
        KeySettings = {
            Title = "Untitled",
            Subtitle = "Key System",
            Note = "No method of obtaining the key is provided",
            FileName = "Key",
            SaveKey = true,
            GrabKeyFromSite = false,
            Key = {"Hello"}
        }
    })
    local FakeWindow = {}
    function FakeWindow:MakeTab(t2)
        local tab = window:CreateTab(t2.Name, t2.Icon)
        local faketab = {}
        function faketab:AddSection(t3)
            local section = tab:CreateSection(t3.Name)
            local fakesection = {}
            return fakesection
        end
        function faketab:AddButton(t3)
            tab:CreateButton({
                Name = t3.Name,
                Callback = t3.Callback
            })
        end
        function faketab:AddToggle(t3)
            local toggle = tab:CreateToggle({
                Name = t3.Name,
                Flag = t3.Flag,
                CurrentValue = t3.Default,
                Callback = t3.Callback
            })
            local faketoggle = {}
            function faketoggle:Set(b)
                toggle:Set(b)
            end
            return faketoggle
        end
        function faketab:AddColorpicker(t3)
            local colorpicker = Rayfield:CreateColorPicker({
                Name = t3.Name,
                Color = t3.Default,
                Flag = t3.Flag,
                Callback = t3.Callback
            })
            local fakecolorpicker = {}
            function fakecolorpicker:Set(v)
                colorpicker:Set(v)
            end
            return fakecolorpicker
        end
        function faketab:AddSlider(t3)
            local slider = tab:CreateSlider({
                Name = t3.Name,
                Range = {t3.Min, t3.Max},
                Increment = t3.Increment,
                Suffix = t3.ValueName,
                CurrentValue = t3.Default,
                Flag = t3.Flag,
                Callback = t3.Callback
            })
            local fakeslider = {}
            function fakeslider:Set(v)
                slider:Set(v)
            end
            return fakeslider
        end
        function faketab:AddLabel(Name)
            local label = tab:CreateLabel(Name)
            local fakelabel = {}
            function fakelabel:Set(v)
                label:Set(v)
            end
            return fakelabel
        end
        function faketab:AddParagraph(n, c)
            local paragraph = tab:CreateParagraph({Name = n, Content = c})
            local fakeparagraph = {}
            function fakeparagraph:Set(nn, cn)
                paragraph:Set({nn, cn})
            end
            return fakeparagraph
        end
        function faketab:AddTextbox(t3)
            local adaptinput = tab:CreateInput({
                Name = t3.Name,
                CurrentValue = t3.Default,
                PlaceholderText = t3.Default,
                RemoveTextAfterFocusLost = t3.TextDisappear,
                Flag = t3.Flag,
                Callback = t3.Callback
            })
            local fakeadaptinput = {}
            function fakeadaptinput:Set(v)
                adaptinput:Set(v)
            end
            return fakeadaptinput
        end
        function faketab:AddBind(t3)
            local bind = tab:CreateKeybind({
                Name = t3.Name,
                CurrentKeybind = keycodetostring(t3.Default),
                HoldToInteract = t3.Hold,
                Flag = t3.Flag,
                Callback = t3.Callback
            })
            local fakebind = {}
            function fakebind:Set(v)
                bind:Set(keycodetostring(v))
            end
            return fakebind
        end
        function faketab:AddDropdown(t3)
            local dropdown = tab:CreateDropdown({
                Name = t3.Name,
                Options = t3.Options,
                CurrentOption = {t3.Default},
                MultipleOptions = false,
                Flag = t3.Flag,
                Callback = t3.Callback
            })
            local fakedropdown = {}
            function fakedropdown:Refresh(t4)
                dropdown:Refresh(t4)
            end
            function fakedropdown:Set(v)
                dropdown:Set(v)
            end
            return fakedropdown
        end
        return faketab
    end
    return FakeWindow
end

function NewOrion:MakeNotification(t)
    Rayfield:Notify({
        Name = t.Name,
        Content = t.Content,
        Duration = t.Time
    })
end

function NewOrion:Init()
    Rayfield:LoadConfiguration()
end

local FakeOrion = function()
    return NewOrion
end

local function loadstring(s, ...)
    if s == game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source") then
        return FakeOrion
    end
    return clonedfunc(s, ...)
end

getgenv().loadstring = loadstring
