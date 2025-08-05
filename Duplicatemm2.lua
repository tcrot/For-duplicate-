local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local tradeEvent = ReplicatedStorage:WaitForChild("TradeEvent")

local function sendItemToTrade(itemName)
    tradeEvent:FireServer("AddItem", itemName)
end

local function acceptTrade()
    tradeEvent:FireServer("Accept")
end

local function dupItem(itemName)
    sendItemToTrade(itemName)
    wait(0.1)
    acceptTrade()
    wait(0.1)
    tradeEvent:FireServer("Cancel")
    wait(0.1)
    sendItemToTrade(itemName)
    acceptTrade()
end

dupItem("Knife")
