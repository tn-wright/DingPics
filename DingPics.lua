local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:SetScript("OnEvent", function (self, event)
	RequestTimePlayed()
	C_Timer.After((UnitLevel("player") - 1) * (2.0 / 60.0), function()
		SaveView(4) -- Saves current camera position
		C_CVar.SetCVar("cameraViewBlendStyle", 2) -- Allow the camera to move instantly
		SetView(5) -- Switches to default camera position
		frame:SetScript("OnUpdate", function(self, elapsed) -- Waits for next frame
			Screenshot()
			frame:SetScript("OnUpdate", function(self, elapsed)
				SetView(4) -- Restores previous camera position
				C_CVar.SetCVar("cameraViewBlendStyle", 1) -- Restores camera behavior
				frame:SetScript("OnUpdate", nil)
			end)
		end)
	end)
end)