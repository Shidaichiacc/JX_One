-- Tao mot nhom quai dua tren quai luyen cong that cua ban do hien tai.
-- Dung chung cho Cam nang Tan thu va Lenh bai Admin.

if MAP_MONSTER_SUMMON_CACHE == nil then MAP_MONSTER_SUMMON_CACHE = {} end

function SummonMapMonster_IsValid(nNpcIdx)
	if not nNpcIdx or nNpcIdx <= 0 then return 0 end
	if GetNpcKind(nNpcIdx) ~= 0 then return 0 end
	local nSetting = GetNpcSettingIdx(nNpcIdx)
	if not nSetting or nSetting <= 0 then return 0 end
	local szScript = GetNpcScript(nNpcIdx) or ""
	if strfind(szScript, "simcity") then return 0 end
	return 1
end

function SummonMapMonster_LoadTemplates(nMapId)
	local tbResult = {}
	local tbSeen = {}
	local tbAround = GetAroundNpcList(200, 8) or {}
	for i = 1, getn(tbAround) do
		local nNpcIdx = tbAround[i]
		if SummonMapMonster_IsValid(nNpcIdx) == 1 then
			local nSetting = GetNpcSettingIdx(nNpcIdx)
			if not tbSeen[nSetting] then
				tbSeen[nSetting] = 1
				tinsert(tbResult, {
					nSetting,
					GetNpcName(nNpcIdx) or "Qu¸i luyÖn c«ng",
					GetNpcSeries(nNpcIdx) or random(0, 4),
					GetNpcCurCamp(nNpcIdx) or 4
				})
				if getn(tbResult) >= 6 then break end
			end
		end
	end
	WriteLog("[SummonMapMonsterScan] "..GetAccount().."\t"..GetName().."\tMap="..nMapId.."\tAround="..getn(tbAround).."\tTemplates="..getn(tbResult))
	if getn(tbResult) > 0 then MAP_MONSTER_SUMMON_CACHE[nMapId] = tbResult end
	return tbResult
end

function SummonMapMonsterGroup()
	local nMapId, nX, nY = GetWorldPos()
	WriteLog("[SummonMapMonsterClick] "..GetAccount().."\t"..GetName().."\tMap="..nMapId.."\tX="..nX.."\tY="..nY)
	local nMapIdx = SubWorldID2Idx(nMapId)
	if not nMapIdx or nMapIdx < 0 then
		Msg2Player("Kh«ng x¸c ®Þnh ®­îc b¶n ®å hiÖn t¹i.")
		return 0
	end

	local tbTemplates = MAP_MONSTER_SUMMON_CACHE[nMapId]
	if not tbTemplates or getn(tbTemplates) == 0 then
		tbTemplates = SummonMapMonster_LoadTemplates(nMapId)
	end
	if not tbTemplates or getn(tbTemplates) == 0 then
		Msg2Player("Kh«ng t×m thÊy qu¸i luyÖn c«ng cña b¶n ®å. H·y ®øng gÇn khu vùc cã qu¸i råi thö l¹i.")
		return 0
	end

	local nLevel = GetLevel()
	local nCreated = 0
	for i = 1, 10 do
		local tbNpc = tbTemplates[random(1, getn(tbTemplates))]
		local nSX = nX + random(-7, 7)
		local nSY = nY + random(-7, 7)
		if abs(nSX - nX) < 3 then nSX = nSX + 3 end
		if abs(nSY - nY) < 3 then nSY = nSY + 3 end
		local nNpcIdx = AddNpcEx(tbNpc[1], nLevel, tbNpc[3], nMapIdx, nSX * 32, nSY * 32, 1, tbNpc[2], 0)
		if nNpcIdx and nNpcIdx > 0 then
			SetNpcCurCamp(nNpcIdx, tbNpc[4])
			nCreated = nCreated + 1
		end
	end

	if nCreated > 0 then
		Msg2Player("§· t¹o "..nCreated.." qu¸i luyÖn c«ng t­¬ng øng víi b¶n ®å hiÖn t¹i.")
		WriteLog("[SummonMapMonster] "..GetAccount().."\t"..GetName().."\tMap="..nMapId.."\tCount="..nCreated)
		return 1
	end
	Msg2Player("Kh«ng thÓ t¹o qu¸i t¹i vÞ trÝ hiÖn t¹i.")
	return 0
end
