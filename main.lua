
if _G.Cont == true then
	_G.Farm = not _G.Farm
else
if _G.Cont == true then
warn("Cannot start yet")
	return false
else
_G.Cont = true
warn("Thank you for using this script!")
_G.Farm = true
end
	
end
_G.Cont = true
_G.AutoBuy = true
_G.AutoClearOnShutdown = {
true, --AutoClears Baught Data
false, --AutoClears Total Cash Data
false, --AutoClears Harvest Amount Data
}

if _G.total == nil then
_G.baught = {}
_G.harvested = 0
_G.total = 0
end

if not _G.Farm then
_G.Cont = false
_G.Farm = false
warn(string.rep("\n",2))
warn("Saving Data... [Don't Start Again Yet!]")
if _G.AutoClearOnShutdown[1] then
table.clear(_G.baught)
for _ = 0, 10 do
wait()
warn(math.random(0,1))
end
end
if _G.AutoClearOnShutdown[2] then
_G.total = 0
for _ = 0, 10 do
wait()
warn(math.random(0,1))
end
end
if _G.AutoClearOnShutdown[2] then
_G.harvested = 0
for _ = 0, 10 do
wait()
warn(math.random(0,1))
end
end
wait(5)
warn("Saved! [Don't Start Again Yet!]")
wait(5)
warn("[Start Again]")
_G.Cont = true
else
warn("Starting JxSlash's Farm Script")
end












local tmlp = tick()
while wait(5) and _G.Farm == trdue do
local plot = nil
local startCF = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
for _, ww in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
	if ww.OwnerPointer.Value == game:GetService("Players").LocalPlayer then
		plot = ww		
	end
end
warn(string.rep("\n",90))
print("JxSlash Fantasy Tycoon Auto Farm")
print("JxSlash Fantasy Tycoon Auto Farm")
print("JxSlash Fantasy Tycoon Auto Farm")

warn("Events[History]:Get	  [[")
for _, ba in pairs(_G.baught) do
	warn("				Baught  :  ".. ba)
end
warn("				TotalEarned  :  ".. _G.total)
warn("				TotalHarvested  :  ".. _G.harvested)
warn("				TotalTime  :  ".. tick() - tmlp)
warn("]]")

warn("Events[GetCash]:Fired  [[")
_G.total += plot.Data.UncollectedMoney.Value
warn("				Collected  :  ".. plot.Data.UncollectedMoney.Value)
warn("				CashBefore :  ".. game.Players.LocalPlayer.leaderstats.Money.Value)
warn("				CashAfter  :  ".. game.Players.LocalPlayer.leaderstats.Money.Value + plot.Data.UncollectedMoney.Value)


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = plot.Entities["Money Collector"].Trigger.CFrame
wait(0)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = startCF
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)

for _, tom in pairs(plot.Entities:GetChildren()) do
if tom.Configuration:FindFirstChild("CurrentStage") then
if tom.Configuration.CurrentStage.Value == tom.Configuration.NumGrowthStages.Value then
game:GetService("Players").LocalPlayer.Character:MoveTo(tom.PrimaryPart.Position)
wait()
warn("				Harvested  :  ".. tom.Name)
_G.harvested += 1
_G.total += tom.Configuration.RewardAmount.Value
fireproximityprompt(tom.ProximityPrompt,1)
end
end

end
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = plot.Entities["Money Collector"].Trigger.CFrame
wait(0)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = startCF
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)

warn("]]")

if _G.AutoBuy then
warn("Events[AutoBuy]:Fired  [[")
for _, buy in pairs(plot.Buttons:GetChildren()) do
	if buy.Configuration.Cost.Value <= game.Players.LocalPlayer.leaderstats.Money.Value and buy.Configuration:FindFirstChild("DevProductID") == nil then
		warn("				Baught  :  ".. buy.Name)
		table.insert(_G.baught,"				".. buy.Name)
		local startCF = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = buy.Trigger.CFrame
		wait(0)
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = startCF
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
		game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)

	end
end
warn("]]")
warn("Events[CantAutoBuy]:Fired  [[")
for _, buy in pairs(plot.Buttons:GetChildren()) do
	if buy.Configuration.Cost.Value > game.Players.LocalPlayer.leaderstats.Money.Value and buy.Configuration:FindFirstChild("DevProductID") == nil then
		warn("				".. buy.Name.. "  :  ".. buy.Configuration.Cost.Value.. "  :  ".. math.floor((game.Players.LocalPlayer.leaderstats.Money.Value/buy.Configuration.Cost.Value)*1000)/10 .. "%")
	end
end
warn("]]")
end
end
