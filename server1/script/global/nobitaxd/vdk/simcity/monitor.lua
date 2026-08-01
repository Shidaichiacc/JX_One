-- SIMCITY V3 - MONITOR GM
-- Chi doc du lieu runtime, khong tao, xoa hoac sua bot.
-- SimCity V3 phai duoc nap truoc khi GM chay file nay.

SimCityMonitor = SimCityMonitor or {}

function SimCityMonitor:IsThon(nW)
	if nW == 53 or nW == 20 or nW == 99 or nW == 100 or nW == 101
		or nW == 121 or nW == 153 or nW == 174 then return 1 end
	return 0
end

function SimCityMonitor:MapType(nW, world)
	if SimCityWorld:IsTongKimMap(nW) == 1 then return "Tong Kim / su kien" end
	if SimCityWorld:IsThanhThiMap(nW) == 1 then return "Thanh thi" end
	if self:IsThon(nW) == 1 then return "Thon" end
	if world.isTrainMap == 1 then return "Luyen cong" end
	if world.worldId then return "Map SimCity khac" end
	return "Map chua co du lieu SimCity"
end

function SimCityMonitor:OnOff(v)
	if v == 1 then return "BAT" end
	if v == 0 then return "TAT" end
	return "CHUA DAT"
end

function SimCityMonitor:Collect(nW)
	local s = {
		allCitizen=0, allFollow=0, mapCitizen=0, mapFollow=0,
		normal=0, stall=0, datau=0, train=0, combat=0, tongkim=0, other=0,
		alive=0, waiting=0, retry=0, fighting=0, active=0,
		camp1=0, camp2=0, camp3=0, camp4=0, campOther=0,
		pet=0, keoxe=0, tieuthiep=0
	}
	for _, f in SimCitizen.fighterList do
		s.allCitizen = s.allCitizen + 1
		if f.nMapId == nW then
			s.mapCitizen = s.mapCitizen + 1
			if f.stall == 1 and f.daTau == 1 then s.datau = s.datau + 1
			elseif f.stall == 1 then s.stall = s.stall + 1
			elseif f.mode == "train" then s.train = s.train + 1
			elseif f.mode == "chiendau" then s.combat = s.combat + 1
			elseif f.tongkim == 1 then s.tongkim = s.tongkim + 1
			elseif f.mode == "thanhthi" or f.mode == nil then s.normal = s.normal + 1
			else s.other = s.other + 1 end
			if f.finalIndex and f.finalIndex > 0 and f.isDead ~= 1 then s.alive = s.alive + 1
			else s.waiting = s.waiting + 1 end
			if f.spawnRetryTick then s.retry = s.retry + 1 end
			if f.isFighting == 1 then s.fighting = s.fighting + 1 end
			if f.isActive == 1 then s.active = s.active + 1 end
			if f.camp == 1 then s.camp1 = s.camp1 + 1
			elseif f.camp == 2 then s.camp2 = s.camp2 + 1
			elseif f.camp == 3 then s.camp3 = s.camp3 + 1
			elseif f.camp == 4 then s.camp4 = s.camp4 + 1
			else s.campOther = s.campOther + 1 end
		end
	end
	if SimTheoSau and SimTheoSau.fighterList then
		for _, f in SimTheoSau.fighterList do
			s.allFollow = s.allFollow + 1
			if f.nMapId == nW then
				s.mapFollow = s.mapFollow + 1
				if f.mode == "pet" then s.pet = s.pet + 1
				elseif f.mode == "keoxe" then s.keoxe = s.keoxe + 1
				elseif f.mode == "tieuthiep" then s.tieuthiep = s.tieuthiep + 1 end
			end
		end
	end
	return s
end

function SimCityMonitor:Pending(nW)
	local batches = SimCityThanhThi.batchesByMap and SimCityThanhThi.batchesByMap[nW]
	if not batches then return 0 end
	local first = 1
	if SimCityThanhThi.timerIdsByMap[nW] then first = SimCityThanhThi.timerIdsByMap[nW].currentIndex or 1 end
	local total = 0
	for i = first, getn(batches) do
		if type(batches[i]) == "table" then total = total + getn(batches[i]) end
	end
	return total
end

function SimCityMonitor:Show()
	if not SimCityWorld or not SimCitizen or not SimCityThanhThi then
		if Msg2Player then Msg2Player("<color=yellow>SimCity V3 chua duoc nap. Hay nap V3 truoc monitor.lua.<color>") end
		return 0
	end
	local nW = GetWorldPos()
	local world = SimCityWorld:Get(nW)
	local loaded = world.worldId ~= nil
	local name = "Khong ro ten"
	if loaded and world.name and world.name ~= "" then name = world.name end
	local s = self:Collect(nW)
	local usedStall = 0
	if SIMCITY_STALL_USED_POS and SIMCITY_STALL_USED_POS[nW] then usedStall = getn(SIMCITY_STALL_USED_POS[nW]) end
	local stallBot = s.stall + s.datau
	local batch = "KHONG"
	if SimCityThanhThi.timerIdsByMap[nW] then batch = "CO" end
	local stallState = "OK"
	if usedStall ~= stallBot then
		if batch == "CO" then stallState = "DANG TAO"
		else stallState = "LECH" end
	end
	local status = "OK"
	if not loaded or s.waiting > 0 or s.retry > 0 or stallState == "LECH" then
		status = "CAN KIEM TRA"
	elseif batch == "CO" then
		status = "DANG TAO BOT"
	end

	Msg2Player("<color=yellow>======= SIMCITY V3 - GM MONITOR =======<color>")
	if status == "OK" then
		Msg2Player("<color=green>TRANG THAI: OK<color>")
	elseif status == "DANG TAO BOT" then
		Msg2Player("<color=cyan>TRANG THAI: DANG TAO BOT<color>")
	else
		Msg2Player("<color=yellow>TRANG THAI: " .. status .. "<color>")
	end
	Msg2Player("<color=white>Map [" .. nW .. "]: " .. name .. "<color>")
	Msg2Player("<color=white>Loai: " .. self:MapType(nW, world) .. " | Player: " .. (world.playerTrackerCount or 0) .. "<color>")
	Msg2Player("<color=white>Bot: " .. s.mapCitizen .. " | Song: " .. s.alive .. " | Cho spawn: " .. s.waiting .. " | Retry: " .. s.retry .. "<color>")
	Msg2Player("<color=cyan>Thuong: " .. s.normal .. " | Ban hang: " .. s.stall .. " | Da tau: " .. s.datau .. "<color>")
	if s.train > 0 or s.combat > 0 or s.tongkim > 0 or s.other > 0 then
		Msg2Player("<color=white>Luyen: " .. s.train .. " | Chien: " .. s.combat .. " | Tong Kim: " .. s.tongkim .. " | Khac: " .. s.other .. "<color>")
	end
	if s.mapFollow > 0 then
		Msg2Player("<color=white>Theo sau: " .. s.mapFollow .. " | Pet: " .. s.pet .. " | Keo xe: " .. s.keoxe .. " | Tieu thiep: " .. s.tieuthiep .. "<color>")
	end
	if stallState == "OK" then
		Msg2Player("<color=green>Stall: bot " .. stallBot .. " | Vi tri " .. usedStall .. " | OK<color>")
	elseif stallState == "DANG TAO" then
		Msg2Player("<color=cyan>Stall: bot " .. stallBot .. " | Vi tri " .. usedStall .. " | DANG TAO<color>")
	else
		Msg2Player("<color=yellow>Stall: bot " .. stallBot .. " | Vi tri " .. usedStall .. " | LECH<color>")
	end
	Msg2Player("<color=white>Auto: " .. self:OnOff(SimCityThanhThi.autoAddThanhThi) .. " | Batch: " .. batch .. " | Cho tao: " .. self:Pending(nW) .. "<color>")
	Msg2Player("<color=pink>Toan server: Citizen " .. s.allCitizen .. " | Theo sau " .. s.allFollow .. "<color>")
	return 1
end

function main()
	return SimCityMonitor:Show()
end
