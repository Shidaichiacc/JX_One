IncludeLib("SETTING")
Include("\\script\\global\\nobitaxd\\npc\\simcity_cache_cleanup.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

----------------------------------------------------------------------------------------------------
--								 L÷nh Bµi Boss Hoµng Kim Ng…u Nhi™n								  --
----------------------------------------------------------------------------------------------------
function main()
	PickBoss()
end

TBBOSS  = {
	[1] =	{szName = "Huy“n Gi∏c ßπi S≠",		nBossId = 740,	nRate = 322, nSeries = 0, nLevel = 95},
	[2] =	{szName = "ß≠Íng B t Nhi‘m",		nBossId = 741,	nRate = 336, nSeries = 1, nLevel = 95},
	[3] =	{szName = "Bπch Doanh Doanh",		nBossId = 742,	nRate = 336, nSeries = 1, nLevel = 95},
	[4] =	{szName = "Thanh Tuy÷t S≠ Th∏i",	nBossId = 743,	nRate = 341, nSeries = 2, nLevel = 95},
	[5] =	{szName = "Y™n Hi”u Tr∏i",			nBossId = 744,	nRate = 336, nSeries = 2, nLevel = 95},
	[6] =	{szName = "Hµ Nh©n Ng∑",			nBossId = 745,	nRate = 321, nSeries = 3, nLevel = 95},
	[7] =	{szName = "Tı ßπi Nhπc",			nBossId = 1367,	nRate = 341, nSeries = 4, nLevel = 95},
	[8] =	{szName = "Tuy“n C¨ Tˆ",			nBossId = 747,	nRate = 341, nSeries = 4, nLevel = 95},
	[9] =	{szName = "Thanh Li™n Tˆ",			nBossId = 1368,	nRate = 200, nSeries = 4, nLevel = 95},
	[10] =	{szName = "ßoan MÈc Du÷",			nBossId = 565,	nRate = 227, nSeries = 3, nLevel = 95},
	[11] =	{szName = "CÊ B∏ch",				nBossId = 566,	nRate = 200, nSeries = 0, nLevel = 95},
	[12] =	{szName = "ß≠Íng Phi Y’n",			nBossId = 1366,	nRate = 200, nSeries = 1, nLevel = 95},	
	[13] =	{szName = "Hµ Linh Phi™u",			nBossId = 568,	nRate = 200, nSeries = 2, nLevel = 95},
	[14] =	{szName = "Lam Y Y",				nBossId = 582,	nRate = 200, nSeries = 1, nLevel = 95},
	[15] =	{szName = "Mπnh Th≠¨ng L≠¨ng",		nBossId = 583,	nRate = 200, nSeries = 3, nLevel = 95},
	[16] =	{szName = "Gia LuÀt Tﬁ Ly",			nBossId = 563,	nRate = 200, nSeries = 3, nLevel = 95},
	[17] =	{szName = "ßπo Thanh Ch©n Nh©n",	nBossId = 562,	nRate = 200, nSeries = 4, nLevel = 95},
	[18] =	{szName = "V≠¨ng T∏",				nBossId = 739,	nRate = 200, nSeries = 0, nLevel = 95},
	[19] =	{szName = "Huy“n Nan ßπi S≠",		nBossId = 1365,	nRate = 200, nSeries = 0, nLevel = 95},
	[20] =	{szName = "Chung Linh TÛ",			nBossId = 567,	nRate = 200, nSeries = 2, nLevel = 95},
}

function PickBoss(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh´ng th” th∂ Boss Î nh˜ng n¨i phi chi’n Æ u Æ≠Óc.")
		return
	end
	local nBossCount = getn(TBBOSS)
	local nRandomIndex = random(1, nBossCount)
	local item = TBBOSS[nRandomIndex]
	local nw,nx,ny = GetWorldPos()
	if LENHBAI_BOSSHOANGKIM_CURNPC and LENHBAI_BOSSHOANGKIM_CURNPC > 0 then
		DelNpc(LENHBAI_BOSSHOANGKIM_CURNPC)
		LENHBAI_BOSSHOANGKIM_CURNPC = nil
	end
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1)
	if not index or index <= 0 then
		Talk(1,"","Khong the goi Boss tai vi tri nay. Hay thu lai o mot vi tri khac (khong sat tuong/vat can).")
		return
	end
	LENHBAI_BOSSHOANGKIM_CURNPC = index
	if SetNpcKind then SetNpcKind(index, 0) end
	if SetNpcCurCamp then SetNpcCurCamp(index, 5) end
	if SetNpcParam then
		SetNpcParam(index, 2, 0)
		SetNpcParam(index, 3, 0)
		SetNpcParam(index, 4, 0)
	end
	if SetNpcTitle then SetNpcTitle(index, 0) end
	if TanThu_SimCityCacheClean then TanThu_SimCityCacheClean(index) end
	if SetNpcParam then SetNpcParam(index, 9, 999999) end
	SetNpcDeathScript(index,"\\script\\global\\pgaming\\missions\\bosshoangkim\\bossdai\\goldboss_death.lua")		
	SetNpcParam(index,1,item.nBossId)
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos()
	str = format("<color=yellow>%s<color> Æ∑ xu t hi÷n tπi <color=yellow>%s(%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function cancel()
end

function GetDesc(nItemIdx)
	local szDesc = "<color=water>G‰i ra ng…u nhi™n<color>\n"
    szDesc = szDesc.."<color=orange>Boss ßπi Hoµng Kim<color>"
    return szDesc
end