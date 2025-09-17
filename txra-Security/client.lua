AddEventHandler("onClientResourceStart", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    CreateThread(function()
        local pedModel = `mp_m_freemode_01`
        RequestModel(pedModel)
        while not HasModelLoaded(pedModel) do 
            Wait(0) 
        end

        local ped = CreatePed(4, pedModel, -599.14, -1611.62, 27.08, 42.41, false, true)

        SetEntityInvincible(ped, true) 
        SetPedCanRagdoll(ped, false)
        SetPedDiesWhenInjured(ped, false)

        -- Outfit
        SetPedComponentVariation(ped, 0, 2, 0, 0)   -- Face/Head
        SetPedComponentVariation(ped, 1, 0, 0, 0)   -- Mask
        SetPedComponentVariation(ped, 2, 2, 0, 0)   -- Hair
        SetPedComponentVariation(ped, 3, 1, 0, 0)   -- Arms/Hands
        SetPedComponentVariation(ped, 4, 1, 0, 0)   -- Pants
        SetPedComponentVariation(ped, 5, 0, 0, 0)   -- Bag/Parachute
        SetPedComponentVariation(ped, 6, 1, 0, 0)   -- Shoes
        SetPedComponentVariation(ped, 7, 0, 0, 0)   -- Accessories
        SetPedComponentVariation(ped, 8, 15, 0, 0)  -- Undershirt
        SetPedComponentVariation(ped, 9, 0, 0, 0)   -- Body Armor
        SetPedComponentVariation(ped, 10, 0, 0, 0)  -- Decals
        SetPedComponentVariation(ped, 11, 5, 0, 0)  -- Jacket/Torso

        -- Weapon
        GiveWeaponToPed(ped, GetHashKey("WEAPON_SMG"), 250, false, true)
        SetCurrentPedWeapon(ped, GetHashKey("WEAPON_SMG"), true)

        -- Patrol loop
        CreateThread(function()
            while true do
                TaskGoStraightToCoord(ped, -604.0, -1611.0, 27.0, 1.0, -1, 42.41, 0.5)
                Wait(12000)

                ClearPedTasks(ped)
                TaskGoStraightToCoord(ped, -599.14, -1611.62, 27.08, 1.0, -1, 42.41, 0.5)
                Wait(12000)
            end
        end)
    end)
end)
