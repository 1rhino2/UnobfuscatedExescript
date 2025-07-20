-- Made by 1rhino2, unobfuscated version of noclip script
-- Original source: https://github.com/axsync/Zyx-Executor/blob/main/scripts/noclip.lua

local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Track if noclip is running and if script has been executed before
getgenv().runningNoclip = getgenv().runningNoclip or false
getgenv().hasExecuted = getgenv().hasExecuted or false

local noclipEnabled = false

-- Toggle noclip state on/off
function toggleNoclip()
    noclipEnabled = not noclipEnabled
    StarterGui:SetCore("SendNotification", {
        Title = "Noclip",
        Text = noclipEnabled and "Enabled" or "Disabled",
        Duration = 3
    })

    -- If enabling and not already running, disable collisions on character parts
    if noclipEnabled and not getgenv().runningNoclip then
        getgenv().runningNoclip = true
        spawn(function()
            while noclipEnabled do
                for _, part in ipairs(character:GetChildren()) do
                    if part:IsA("BasePart") then  -- Fixed the part class name here
                        part.CanCollide = false
                    end
                end
                wait(0.05)  -- Adjust as needed for performance
            end
            getgenv().runningNoclip = false
        end)
    end
end

-- Listen for the keypress to toggle noclip
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.N then
        toggleNoclip()
    end
end)

-- Automatically handle when the player spawns or respawns
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    toggleNoclip()  -- Ensure noclip logic is re-applied to the new character
end)

-- End of the script
