IL("TITLE");
IncludeLib("SETTING");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\misc\\eventsys\\type\\npc.lua");
Include("\\script\\task\\metempsychosis\\task_func.lua");

function VongSangChuyenSinh_GetTransCount()
	local nEngineTrans = 0;
	if (type(ST_GetTransLifeCount) == "function") then
		nEngineTrans = ST_GetTransLifeCount() or 0;
	end
	local nTaskTrans = 0;
	if (type(zhuansheng_get_gre) == "function") then
		for i = 1, 7 do
			local nLevel = zhuansheng_get_gre(i);
			if (nLevel and nLevel > 0) then
				nTaskTrans = i;
			end
		end
	end
	if (nTaskTrans > nEngineTrans) then return nTaskTrans end
	return nEngineTrans;
end

function VongSangChuyenSinh()
	local tbOption = {"Ng≠¨i muËn nhÀn vﬂng s∏ng nµo?"};
		tinsert(tbOption, "VÔng s∏ng chuy”n sinh l”n 1/vongsang_ts1")
		tinsert(tbOption, "VÔng s∏ng chuy”n sinh l”n 2/vongsang_ts2")
		tinsert(tbOption, "VÔng s∏ng chuy”n sinh l”n 3/vongsang_ts3")
		tinsert(tbOption, "VÔng s∏ng chuy”n sinh l”n 4/vongsang_ts4")
		tinsert(tbOption, "VÔng s∏ng chuy”n sinh l”n 5/vongsang_ts5")
		tinsert(tbOption, "VÔng s∏ng chuy”n sinh l”n 6/vongsang_ts6")
		tinsert(tbOption, "VÔng s∏ng chuy”n sinh l”n 7/vongsang_ts7")
		tinsert(tbOption, "K’t thÛc ÆËi thoπi./no")
	CreateTaskSay(tbOption)
end

function VongSangChuyenSinh_Apply(nNeed, nID)
	local n_transcount = VongSangChuyenSinh_GetTransCount();
	if (n_transcount < nNeed) then
		Talk(1, "", "Bπn ch≠a ÆÒ Æi“u ki÷n Æ” nhÀn Æ≠Óc hÁ trÓ nµy, h∑y Æi tu luy™n ti’p Æi.")
		return
	end
	if (Title_GetActiveTitle() == nID) then
		Talk(1, "", "Bπn Æang sˆ dÙng vﬂng s∏ng nµy, kh´ng th” nhÀn th™m l«n nˆa. Khi nµo m t vﬂng s∏ng rÂi Æ’n Æ©y g∆p ta Æ” nhÀn lπi.")
		return
	end
	SetTask(1122, nID)
	Title_AddTitle(nID, 1, 30*24*60*60*18);
	Title_ActiveTitle(nID);
	if (SyncTaskValue) then SyncTaskValue(1122); end
end

function vongsang_ts1() VongSangChuyenSinh_Apply(1, 5001) end
function vongsang_ts2() VongSangChuyenSinh_Apply(2, 5002) end
function vongsang_ts3() VongSangChuyenSinh_Apply(3, 5003) end
function vongsang_ts4() VongSangChuyenSinh_Apply(4, 5004) end
function vongsang_ts5() VongSangChuyenSinh_Apply(5, 5005) end
function vongsang_ts6() VongSangChuyenSinh_Apply(6, 5006) end
function vongsang_ts7() VongSangChuyenSinh_Apply(7, 5007) end

--pEventType:Reg("L◊ Quan", "NhÀn vÔng s∏ng chuy”n sinh", VongSangChuyenSinh);
