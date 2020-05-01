local frame = CreateFrame("Frame")
local mapShown = false
local bagsShown = false
local characterFrameShown = false
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:SetScript("OnEvent", function (self, event)
	RequestTimePlayed()
	if WorldMapFrame:IsShown() then 
		mapShown = true 
		WorldMapFrame:Hide()
	end
	if CharacterFrame:IsShown() then 
		characterFrameShown = true
		CharacterFrame:Hide()
	end
	if ElvUI_ContainerFrame:IsShown() then 
		bagsShown = true 
		ElvUI_ContainerFrame:Hide()
	end
	C_Timer.After((UnitLevel("player") - 1) * (2.0 / 60.0), function()
		SaveView(4) -- Saves current camera position
		C_CVar.SetCVar("cameraViewBlendStyle", 2) -- Allow the camera to move instantly
		SetView(5) -- Switches to default camera position
		frame:SetScript("OnUpdate", function(self, elapsed) -- Waits for next frame
			Screenshot()
			frame:SetScript("OnUpdate", function(self, elapsed)
				SetView(4) -- Restores previous camera position
				C_CVar.SetCVar("cameraViewBlendStyle", 1) -- Restores camera behavior
				if mapShown then WorldMapFrame:Show() end
				if bagsShown then ElvUI_ContainerFrame:Show() end
				if characterFrameShown then CharacterFrame:Show() end
				frame:SetScript("OnUpdate", nil)
			end)
		end)
	end)
end)

SLASH_DING1 = "/ding"
SlashCmdList["DING"] = function(msg)
	RequestTimePlayed()
	if WorldMapFrame:IsShown() then 
		mapShown = true 
		WorldMapFrame:Hide()
	end
	if CharacterFrame:IsShown() then 
		characterFrameShown = true
		CharacterFrame:Hide()
	end
	if ElvUI_ContainerFrame:IsShown() then 
		bagsShown = true 
		ElvUI_ContainerFrame:Hide()
	end
	C_Timer.After((UnitLevel("player") - 1) * (2.0 / 60.0), function()
		SaveView(4) -- Saves current camera position
		C_CVar.SetCVar("cameraViewBlendStyle", 2) -- Allow the camera to move instantly
		SetView(5) -- Switches to default camera position
		frame:SetScript("OnUpdate", function(self, elapsed) -- Waits for next frame
			Screenshot()
			frame:SetScript("OnUpdate", function(self, elapsed)
				SetView(4) -- Restores previous camera position
				C_CVar.SetCVar("cameraViewBlendStyle", 1) -- Restores camera behavior
				if mapShown then WorldMapFrame:Show() end
				if bagsShown then ElvUI_ContainerFrame:Show() end
				if characterFrameShown then CharacterFrame:Show() end
				frame:SetScript("OnUpdate", nil)
			end)
		end)
	end)
end
