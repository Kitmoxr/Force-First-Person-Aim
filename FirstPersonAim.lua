-- ############################################################################ --
-- # ----------------------   Made by JVM Team - Kitmoxr -------------------- # --
-- ############################################################################ --


-----------------------------------------------------------------------
------------------  	Force First Person Aim 		-------------------
-----------------------------------------------------------------------

local shot = false
local C1 = false
local C2 = false
local count = 0

Citizen.CreateThread(function()
	while true do
		SetBlackout(false)
		Citizen.Wait(1)
		if IsPlayerFreeAiming(PlayerId()) then
		    if GetFollowPedCamViewMode() == 4 and C1 == false then
			    C1 = false
			else
			    SetFollowPedCamViewMode(4)
			    C1 = true
			end
		else
		    if C1 == true then
		        SetFollowPedCamViewMode(1)
				C1 = false
			end
		end
	end
end )



Citizen.CreateThread(function()
	while true do
		SetBlackout(false)
		Citizen.Wait( 1 )
		
		if IsPedShooting(GetPlayerPed(-1)) and shot == false and GetFollowPedCamViewMode() ~= 4 then
			C2 = true
			shot = true
			SetFollowPedCamViewMode(4)
		end
		
		if IsPedShooting(GetPlayerPed(-1)) and shot == true and GetFollowPedCamViewMode() == 4 then
			count = 0
		end
		
		if not IsPedShooting(GetPlayerPed(-1)) and shot == true then
		    count = count + 1
		end

        if not IsPedShooting(GetPlayerPed(-1)) and shot == true then
			if not IsPedShooting(GetPlayerPed(-1)) and shot == true and count > 20 then
		        if C2 == true then
				    C2 = false
					shot = false
					SetFollowPedCamViewMode(1)
				end
			end
		end	    
	end
end )
