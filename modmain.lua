--to configure basic statue
TUNING.EYETURRET_DAMAGE = GetModConfigData("eyeturret_damage")
TUNING.EYETURRET_HEALTH = GetModConfigData("eyeturret_health")
TUNING.EYETURRET_REGEN = GetModConfigData("eyeturret_regen")
GLOBAL.TUNING.EYETURRET_RANGE = GetModConfigData("eyeturret_range")
TUNING.EYETURRET_ATTACK_PERIOD = GetModConfigData("eyeturret_attack_period")

AddPrefabPostInit("eyeturret", function(inst)
	--to make Houndius Shootius movable
	if GetModConfigData("movable") == 1 then
		local function turnon(inst)
	    	inst.on = true
	    	inst:Remove()
	    	GLOBAL.SpawnPrefab("eyeturret_item").Transform:SetPosition(inst.Transform:GetWorldPosition())
		end
	    inst:AddComponent("machine")
	    inst.components.machine.turnonfn = turnon
	end
	--to make Houndius Shootius droppable
	if GetModConfigData("droppable") == 1 then
		if inst and inst.components and inst.components.lootdropper then
	    	inst.components.lootdropper:AddRandomLoot("eyeturret_item", 1)
	    	inst.components.lootdropper.numrandomloot = 1
	    end
	end
end)