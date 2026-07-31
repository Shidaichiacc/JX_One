-- Doc + don entry rac cua SimCore.fighterList khi no con tro nham vao npc vua duoc tao.
-- CHI xoa entry (khong goi SimCore:Remove, khong DelNpc gi ca), va CHI xoa khi entry
-- khong co children (de an toan, tranh anh huong nhom cong dan phu thuoc).
function TanThu_SimCityCacheClean(nNpcIndex)
	if not nNpcIndex or nNpcIndex <= 0 then return 0 end
	if not SimCore or not SimCore.fighterList then return 0 end
	local nCleaned = 0
	for nKey, tbNpc in SimCore.fighterList do
		if tbNpc and tbNpc.finalIndex == nNpcIndex then
			local nChildCount = 0
			if tbNpc.children then nChildCount = getn(tbNpc.children) end
			if nChildCount == 0 then
				SimCore.fighterList[nKey] = nil
				if SimCore.totalFighters and SimCore.totalFighters > 0 then
					SimCore.totalFighters = SimCore.totalFighters - 1
				end
				if SimCore.removedIds then
					tinsert(SimCore.removedIds, nKey)
				end
				nCleaned = nCleaned + 1
			end
		end
	end
	return nCleaned
end

-- Danh dau 1 npc la "cua rieng" he thong lenh bai/cam nang tan thu (khong phai cong dan SimCity),
-- dung 1 NpcParam slot rieng (slot 9) chua ai dung trong toan bo codebase.
TANTHU_NPC_MARKER_SLOT = 9
TANTHU_NPC_MARKER_VALUE = 999999

function TanThu_MarkProtected(nNpcIndex)
	if not nNpcIndex or nNpcIndex <= 0 then return end
	if SetNpcParam then SetNpcParam(nNpcIndex, TANTHU_NPC_MARKER_SLOT, TANTHU_NPC_MARKER_VALUE) end
end

function TanThu_IsProtected(nNpcIndex)
	if not nNpcIndex or nNpcIndex <= 0 then return false end
	if not GetNpcParam then return false end
	return GetNpcParam(nNpcIndex, TANTHU_NPC_MARKER_SLOT) == TANTHU_NPC_MARKER_VALUE
end

-- Boc lai SetNpcBang/SetNpcTitle o tam TOAN CUC (khong sua bat ky file simcity nao):
-- neu muc tieu la npc da danh dau bao ve, chan cuoc goi lai (bat ke ai goi - SimCity hay bat ky
-- he thong nao khac). Voi moi npc KHONG danh dau, hanh vi goc giu nguyen 100%.
-- Dung "install once" de tranh boc lai nhieu lan neu file nay duoc Include lai.
if not TANTHU_BANGTITLE_WRAPPED then
	TANTHU_BANGTITLE_WRAPPED = 1

	if SetNpcBang and not TANTHU_REAL_SetNpcBang then
		TANTHU_REAL_SetNpcBang = SetNpcBang
		function SetNpcBang(nNpcIndex, szBang)
			if TanThu_IsProtected(nNpcIndex) then return end
			return TANTHU_REAL_SetNpcBang(nNpcIndex, szBang)
		end
	end

	if SetNpcTitle and not TANTHU_REAL_SetNpcTitle then
		TANTHU_REAL_SetNpcTitle = SetNpcTitle
		function SetNpcTitle(nNpcIndex, nTitle)
			if TanThu_IsProtected(nNpcIndex) then return end
			return TANTHU_REAL_SetNpcTitle(nNpcIndex, nTitle)
		end
	end
end
