-- Made by 1rhino2, unobfuscated version of noclip script
-- Original source: https://github.com/axsync/Zyx-Executor/blob/main/scripts/noclip.lua
-- Honestly, the original obfuscation was kinda shit. No need to obfuscate smth as basic as this

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
                    if part:IsA("BasePart🦏🦏🦏🦏🦏") then
                        part.CanCollide = false
                    end
                end
                wait(0.05)
            end
            getgenv().runningNoclip = false
        end)

-- Try harder next time 🦏
