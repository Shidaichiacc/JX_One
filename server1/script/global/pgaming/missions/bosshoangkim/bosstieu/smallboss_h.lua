Include("\\script\\global\\pgaming\\missions\\bosshoangkim\\bosstieu\\lib\\serverlib.lua")

SMALLBOSS_SERVER_INFO  = { 
	[1] =	{	szName = "LiÔu Thanh Thanh",		nBossId = 523,	nRate = 322, nSeries = 1, nLevel = 90},
	[2] =	{	szName = "DiÖu Nh­",				nBossId = 513,	nRate = 336, nSeries = 2, nLevel = 90},
	[3] =	{	szName = "Tr­¬ng Tèng ChÝnh",		nBossId = 511,	nRate = 336, nSeries = 4, nLevel = 90},
	[4] =	{	szName = "T©y V­¬ng Tµ §éc",		nBossId = 1358,	nRate = 336, nSeries = 1, nLevel = 90},
	[5] =	{	szName = "Do·n Thanh V©n",			nBossId = 1360,	nRate = 336, nSeries = 2, nLevel = 90},
	[6] =	{	szName = "H¾c Y S¸t Thñ",			nBossId = 1361,	nRate = 336, nSeries = 3, nLevel = 90},
	[7] =	{	szName = "Ng¹o Thiªn T­íng Qu©n",	nBossId = 1356,	nRate = 336, nSeries = 0, nLevel = 90},
	[8] =	{	szName = "ThËp Ph­¬ng C©u DiÖt",	nBossId = 1362,	nRate = 336, nSeries = 3, nLevel = 90},
	[9] =	{	szName = "Thanh Y Tö",				nBossId = 1364,	nRate = 336, nSeries = 4, nLevel = 90},
	[10] =	{	szName = "TÞnh Th«ng",				nBossId = 1355,	nRate = 336, nSeries = 0, nLevel = 90},
}

SMALLBOSS_FILE_POS = {
	"\\settings\\bosshoangkim\\maps\\bigboss\\bienkinh.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\daily.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\duongchau.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\laman.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\phuongtuong.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\tuongduong.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\thanhdo.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\balanghuyen.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\giangtanthon.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\vinhlactran.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\chutientran.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\daohuongthon.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\longmontran.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\thachcotran.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\longtuyenthon.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\thienvuong.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\thieulam.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\duongmon.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\ngudoc.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\ngamy.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\thuyyen.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\caibang.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\thiennhan.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\vodang.txt",
	"\\settings\\bosshoangkim\\maps\\bigboss\\conlon.txt",
}

SMALLBOSS_AWARD = {
	[511] = { -- Tr­¬ng T«ng ChÝnh - Vâ §ang
		szName = {"LÖnh Bµi ThÇn BÝ","Tr­êng MÖnh Hoµn","Gia Bµo Hoµn","§¹i Lùc Hoµn","Cao ThiÓm Hoµn","Cao Trung Hoµn","Phi Tèc Hoµn","B¨ng Phßng Hoµn","L«i Phßng Hoµn","Háa Phßng Hoµn","§éc Phßng Hoµn","Vâ L©m LÖnh","Phóc Duyªn Lé (TiÓu)","Phóc Duyªn Lé (Trung)","Phóc Duyªn Lé (§¹i)","Th¸i Cùc QuyÒn Phæ. QuyÓn 3","Th¸i Cùc KiÕm Phæ. QuyÓn 2"},
		nProp = {{6,1,4958,1,0,0},{6,0,1,1,0,0},{6,0,2,1,0,0},{6,0,3,1,0,0},{6,0,4,1,0,0},{6,0,5,1,0,0},{6,0,6,1,0,0},{6,0,7,1,0,0},{6,0,8,1,0,0},{6,0,9,1,0,0},{6,0,10,1,0,0},{6,1,4905,1,0,0},{6,1,122,1,0,0},{6,1,123,1,0,0},{6,1,124,1,0,0},{6,1,33,1,0,0},{6,1,34,1,0,0}},
		nCount = 3,
		nRate = 90,
	},
	[513] = { -- DiÖu Nh­ - Nga My
		szName = {"LÖnh Bµi ThÇn BÝ","Tr­êng MÖnh Hoµn","Gia Bµo Hoµn","§¹i Lùc Hoµn","Cao ThiÓm Hoµn","Cao Trung Hoµn","Phi Tèc Hoµn","B¨ng Phßng Hoµn","L«i Phßng Hoµn","Háa Phßng Hoµn","§éc Phßng Hoµn","Vâ L©m LÖnh","Phóc Duyªn Lé (TiÓu)","Phóc Duyªn Lé (Trung)","Phóc Duyªn Lé (§¹i)","DiÖt KiÕm MËt TÞch","Nga My PhËt Quang Ch­ëng MËt TÞch","Phæ §é MËt TÞch"},
		nProp = {{6,1,4958,1,0,0},{6,0,1,1,0,0},{6,0,2,1,0,0},{6,0,3,1,0,0},{6,0,4,1,0,0},{6,0,5,1,0,0},{6,0,6,1,0,0},{6,0,7,1,0,0},{6,0,8,1,0,0},{6,0,9,1,0,0},{6,0,10,1,0,0},{6,1,4905,1,0,0},{6,1,122,1,0,0},{6,1,123,1,0,0},{6,1,124,1,0,0},{6,1,42,1,0,0},{6,1,43,1,0,0},{6,1,59,1,0,0}},
		nCount = 3,
		nRate = 90,
	},
	[523] = { -- LiÔu Thanh Thanh - §­êng M«n
		szName = {"LÖnh Bµi ThÇn BÝ","Tr­êng MÖnh Hoµn","Gia Bµo Hoµn","§¹i Lùc Hoµn","Cao ThiÓm Hoµn","Cao Trung Hoµn","Phi Tèc Hoµn","B¨ng Phßng Hoµn","L«i Phßng Hoµn","Háa Phßng Hoµn","§éc Phßng Hoµn","Vâ L©m LÖnh","Phóc Duyªn Lé (TiÓu)","Phóc Duyªn Lé (Trung)","Phóc Duyªn Lé (§¹i)","Tô TiÔn thuËt. B¹o Vò Lª Hoa","H·m TÜnh thuËt.Lo¹n Hoµn KÝch","Phi §ao thuËt. NhiÕp Hån NguyÖt ¶nh","Phi Tiªu thuËt. Cöu Cung Phi Tinh"},
		nProp = {{6,1,4958,1,0,0},{6,0,1,1,0,0},{6,0,2,1,0,0},{6,0,3,1,0,0},{6,0,4,1,0,0},{6,0,5,1,0,0},{6,0,6,1,0,0},{6,0,7,1,0,0},{6,0,8,1,0,0},{6,0,9,1,0,0},{6,0,10,1,0,0},{6,1,4905,1,0,0},{6,1,122,1,0,0},{6,1,123,1,0,0},{6,1,124,1,0,0},{6,1,27,1,0,0},{6,1,28,1,0,0},{6,1,45,1,0,0},{6,1,46,1,0,0}},
		nCount = 3,
		nRate = 90,
	},
	[1358] = { -- T©y V­¬ng Tµ §éc - Ngò §éc
		szName = {"LÖnh Bµi ThÇn BÝ","Tr­êng MÖnh Hoµn","Gia Bµo Hoµn","§¹i Lùc Hoµn","Cao ThiÓm Hoµn","Cao Trung Hoµn","Phi Tèc Hoµn","B¨ng Phßng Hoµn","L«i Phßng Hoµn","Háa Phßng Hoµn","§éc Phßng Hoµn","Vâ L©m LÖnh","Phóc Duyªn Lé (TiÓu)","Phóc Duyªn Lé (Trung)","Phóc Duyªn Lé (§¹i)","Ngò §éc Ch­ëng Ph¸p. QuyÓn 1","Ngò §éc §ao ph¸p. QuyÓn 2","Ngò §éc NhiÕp T©m thuËt. QuyÓn 3"},
		nProp = {{6,1,4958,1,0,0},{6,0,1,1,0,0},{6,0,2,1,0,0},{6,0,3,1,0,0},{6,0,4,1,0,0},{6,0,5,1,0,0},{6,0,6,1,0,0},{6,0,7,1,0,0},{6,0,8,1,0,0},{6,0,9,1,0,0},{6,0,10,1,0,0},{6,1,4905,1,0,0},{6,1,122,1,0,0},{6,1,123,1,0,0},{6,1,124,1,0,0},{6,1,47,1,0,0},{6,1,48,1,0,0},{6,1,49,1,0,0}},
		nCount = 3,
		nRate = 90,
	},
	[1360] = { -- Do·n Thanh V©n - Thóy Yªn
		szName = {"LÖnh Bµi ThÇn BÝ","Tr­êng MÖnh Hoµn","Gia Bµo Hoµn","§¹i Lùc Hoµn","Cao ThiÓm Hoµn","Cao Trung Hoµn","Phi Tèc Hoµn","B¨ng Phßng Hoµn","L«i Phßng Hoµn","Háa Phßng Hoµn","§éc Phßng Hoµn","Vâ L©m LÖnh","Phóc Duyªn Lé (TiÓu)","Phóc Duyªn Lé (Trung)","Phóc Duyªn Lé (§¹i)","Thóy Yªn §ao ph¸p","VThóy Yªn Song ®ao"},
		nProp = {{6,1,4958,1,0,0},{6,0,1,1,0,0},{6,0,2,1,0,0},{6,0,3,1,0,0},{6,0,4,1,0,0},{6,0,5,1,0,0},{6,0,6,1,0,0},{6,0,7,1,0,0},{6,0,8,1,0,0},{6,0,9,1,0,0},{6,0,10,1,0,0},{6,1,4905,1,0,0},{6,1,122,1,0,0},{6,1,123,1,0,0},{6,1,124,1,0,0},{6,1,40,1,0,0},{6,1,41,1,0,0}},
		nCount = 3,
		nRate = 90,
	},
	[1361] = { -- H¾c Y S¸t Thñ - C¸i Bang
		szName = {"LÖnh Bµi ThÇn BÝ","Tr­êng MÖnh Hoµn","Gia Bµo Hoµn","§¹i Lùc Hoµn","Cao ThiÓm Hoµn","Cao Trung Hoµn","Phi Tèc Hoµn","B¨ng Phßng Hoµn","L«i Phßng Hoµn","Háa Phßng Hoµn","§éc Phßng Hoµn","Vâ L©m LÖnh","Phóc Duyªn Lé (TiÓu)","Phóc Duyªn Lé (Trung)","Phóc Duyªn Lé (§¹i)","C¸i Bang Ch­ëng Ph¸p","C¸i Bang C«n ph¸p"},
		nProp = {{6,1,4958,1,0,0},{6,0,1,1,0,0},{6,0,2,1,0,0},{6,0,3,1,0,0},{6,0,4,1,0,0},{6,0,5,1,0,0},{6,0,6,1,0,0},{6,0,7,1,0,0},{6,0,8,1,0,0},{6,0,9,1,0,0},{6,0,10,1,0,0},{6,1,4905,1,0,0},{6,1,122,1,0,0},{6,1,123,1,0,0},{6,1,124,1,0,0},{6,1,54,1,0,0},{6,1,55,1,0,0}},
		nCount = 3,
		nRate = 90,
	},
	[1356] = { -- Ng¹o Thiªn T­íng Qu©n - Thiªn V­¬ng
		szName = {"LÖnh Bµi ThÇn BÝ","Tr­êng MÖnh Hoµn","Gia Bµo Hoµn","§¹i Lùc Hoµn","Cao ThiÓm Hoµn","Cao Trung Hoµn","Phi Tèc Hoµn","B¨ng Phßng Hoµn","L«i Phßng Hoµn","Háa Phßng Hoµn","§éc Phßng Hoµn","Vâ L©m LÖnh","Phóc Duyªn Lé (TiÓu)","Phóc Duyªn Lé (Trung)","Phóc Duyªn Lé (§¹i)","Thiªn V­¬ng Chïy Ph¸p. QuyÓn 1","Thiªn V­¬ng Th­¬ng ph¸p. QuyÓn 2","Thiªn V­¬ng §ao ph¸p.QuyÓn 3"},
		nProp = {{6,1,4958,1,0,0},{6,0,1,1,0,0},{6,0,2,1,0,0},{6,0,3,1,0,0},{6,0,4,1,0,0},{6,0,5,1,0,0},{6,0,6,1,0,0},{6,0,7,1,0,0},{6,0,8,1,0,0},{6,0,9,1,0,0},{6,0,10,1,0,0},{6,1,4905,1,0,0},{6,1,122,1,0,0},{6,1,123,1,0,0},{6,1,124,1,0,0},{6,1,37,1,0,0},{6,1,38,1,0,0},{6,1,39,1,0,0}},
		nCount = 3,
		nRate = 90,
	},
	[1362] = { -- ThËp Ph­¬ng C©u DiÖt - Thiªn NhÉn
		szName = {"LÖnh Bµi ThÇn BÝ","Tr­êng MÖnh Hoµn","Gia Bµo Hoµn","§¹i Lùc Hoµn","Cao ThiÓm Hoµn","Cao Trung Hoµn","Phi Tèc Hoµn","B¨ng Phßng Hoµn","L«i Phßng Hoµn","Háa Phßng Hoµn","§éc Phßng Hoµn","Vâ L©m LÖnh","Phóc Duyªn Lé (TiÓu)","Phóc Duyªn Lé (Trung)","Phóc Duyªn Lé (§¹i)","V©n Long KÝch. M©u ph¸p","L­u Tinh. §ao ph¸p","NhiÕp Hån. Chó thuËt"},
		nProp = {{6,1,4958,1,0,0},{6,0,1,1,0,0},{6,0,2,1,0,0},{6,0,3,1,0,0},{6,0,4,1,0,0},{6,0,5,1,0,0},{6,0,6,1,0,0},{6,0,7,1,0,0},{6,0,8,1,0,0},{6,0,9,1,0,0},{6,0,10,1,0,0},{6,1,4905,1,0,0},{6,1,122,1,0,0},{6,1,123,1,0,0},{6,1,124,1,0,0},{6,1,35,1,0,0},{6,1,36,1,0,0},{6,1,53,1,0,0}},
		nCount = 3,
		nRate = 90,
	},
	[1364] = { -- Thanh Y Tö - C«n L«n
		szName = {"LÖnh Bµi ThÇn BÝ","Tr­êng MÖnh Hoµn","Gia Bµo Hoµn","§¹i Lùc Hoµn","Cao ThiÓm Hoµn","Cao Trung Hoµn","Phi Tèc Hoµn","B¨ng Phßng Hoµn","L«i Phßng Hoµn","Háa Phßng Hoµn","§éc Phßng Hoµn","Vâ L©m LÖnh","Phóc Duyªn Lé (TiÓu)","Phóc Duyªn Lé (Trung)","Phóc Duyªn Lé (§¹i)","Ngù Phong thuËt","Ngù L«i thuËt","Ngù T©m thuËt"},
		nProp = {{6,1,4958,1,0,0},{6,0,1,1,0,0},{6,0,2,1,0,0},{6,0,3,1,0,0},{6,0,4,1,0,0},{6,0,5,1,0,0},{6,0,6,1,0,0},{6,0,7,1,0,0},{6,0,8,1,0,0},{6,0,9,1,0,0},{6,0,10,1,0,0},{6,1,4905,1,0,0},{6,1,122,1,0,0},{6,1,123,1,0,0},{6,1,124,1,0,0},{6,1,50,1,0,0},{6,1,51,1,0,0},{6,1,52,1,0,0}},
		nCount = 3,
		nRate = 90,
	},
	[1355] = { -- TÞnh Th«ng - ThiÕu L©m
		szName = {"LÖnh Bµi ThÇn BÝ","Tr­êng MÖnh Hoµn","Gia Bµo Hoµn","§¹i Lùc Hoµn","Cao ThiÓm Hoµn","Cao Trung Hoµn","Phi Tèc Hoµn","B¨ng Phßng Hoµn","L«i Phßng Hoµn","Háa Phßng Hoµn","§éc Phßng Hoµn","Vâ L©m LÖnh","Phóc Duyªn Lé (TiÓu)","Phóc Duyªn Lé (Trung)","Phóc Duyªn Lé (§¹i)","ThiÕu L©m QuyÒn Ph¸p. QuyÓn 1","ThiÕu L©m C«n ph¸p. QuyÓn 2","ThiÕu L©m §ao ph¸p. QuyÓn 3"},
		nProp = {{6,1,4958,1,0,0},{6,0,1,1,0,0},{6,0,2,1,0,0},{6,0,3,1,0,0},{6,0,4,1,0,0},{6,0,5,1,0,0},{6,0,6,1,0,0},{6,0,7,1,0,0},{6,0,8,1,0,0},{6,0,9,1,0,0},{6,0,10,1,0,0},{6,1,4905,1,0,0},{6,1,122,1,0,0},{6,1,123,1,0,0},{6,1,124,1,0,0},{6,1,56,1,0,0},{6,1,57,1,0,0},{6,1,58,1,0,0}},
		nCount = 3,
		nRate = 90,
	},
}

BOSS_DEATH_SCRIPT = "\\script\\global\\pgaming\\missions\\bosshoangkim\\bosstieu\\smallboss_death.lua"
TIME_SMALLBOSS_REMOVE = 60*60*18
SmallBoss_DataSave = {}

function SmallBossCleanSimCityMark(nNpcIndex, nBossId)
    if not nNpcIndex or nNpcIndex <= 0 then return end
    if SetNpcParam then
        SetNpcParam(nNpcIndex, 2, 0)
        SetNpcParam(nNpcIndex, 3, 0)
        SetNpcParam(nNpcIndex, 4, 0)
        if nBossId then SetNpcParam(nNpcIndex, 1, nBossId) end
    end
    if SetNpcTitle then SetNpcTitle(nNpcIndex, 0) end
    if SetNpcBang then SetNpcBang(nNpcIndex, "") end
end

SMALLBOSS_SPAWN_INFO = {
	[1]	= {n_level = 90,	n_series = 1,	n_npcid = 523,	n_mapid = 25,	tb_coords = {{531,300}, {482,331}},	sz_name = "LiÔu Thanh Thanh", sz_mapname = "§­êng M«n"},
	[2]	= {n_level = 90,	n_series = 2,	n_npcid = 513,	n_mapid = 13,	tb_coords = {{285,302}, {218,312}},	sz_name = "DiÖu Nh­", sz_mapname = "Nga My"},
	[3]	= {n_level = 90,	n_series = 4,	n_npcid = 511,	n_mapid = 81,	tb_coords = {{219,210}, {232,191}},	sz_name = "Tr­¬ng T«ng ChÝnh", sz_mapname = "Vâ §ang"},
	[4]	= {n_level = 90,	n_series = 1,	n_npcid = 1358,	n_mapid = 183,	tb_coords = {{204,214}, {183,167}},	sz_name = "T©y V­¬ng T¸ §éc", sz_mapname = "Ngò §éc"},
	[5]	= {n_level = 90,	n_series = 2,	n_npcid = 1360,	n_mapid = 154,	tb_coords = {{39,107}, {69,82}},	sz_name = "Do·n Thanh V©n", sz_mapname = "Thóy Yªn"},
	[6]	= {n_level = 90,	n_series = 3,	n_npcid = 1361,	n_mapid = 115,	tb_coords = {{195,205}, {180,176}},	sz_name = "H¾c Y S¸t Thñ", sz_mapname = "C¸i Bang"},
	[7]	= {n_level = 90,	n_series = 0,	n_npcid = 1356,	n_mapid = 59,	tb_coords = {{188,195}, {237,192}},	sz_name = "Ng¹o Thiªn T­íng Qu©n", sz_mapname = "Thiªn V­¬ng"},
	[8]	= {n_level = 90,	n_series = 3,	n_npcid = 1362,	n_mapid = 45,	tb_coords = {{208,202}, {199,192}},	sz_name = "ThËp Ph­¬ng C©u DiÖt", sz_mapname = "Thiªn NhÉn"},
	[9]	= {n_level = 90,	n_series = 4,	n_npcid = 1364,	n_mapid = 131,	tb_coords = {{173,208}, {202,190}},	sz_name = "Thanh Y Tö", sz_mapname = "C«n L«n"},
	[10] = {n_level = 90,	n_series = 0,	n_npcid = 1355,	n_mapid = 103,	tb_coords = {{180,220}, {199,180}},	sz_name = "TÞnh Th«ng", sz_mapname = "ThiÕu L©m"},
}

function smallboss_toworld(nNumBoss)
    if not nNumBoss then return end
    local nTime = tonumber(GetLocalDate("%d%H"))
    smallboss_newboss(nTime)
    SmallBoss_DataSave[nTime].new_boss = {}
    SmallBoss_DataSave[nTime].record_boss = {}
    SmallBoss_DataSave[nTime].map_names = {}
    local nMax = getn(SMALLBOSS_SPAWN_INFO)
    if nNumBoss > nMax then nNumBoss = nMax end
    for k=1, nNumBoss do
        local boss_pak = smallboss_getaboss()
        if boss_pak and boss_pak[1] ~= nil then
            local nNpcIndex = AddNpcEx(unpack(boss_pak))
            SmallBossCleanSimCityMark(nNpcIndex, boss_pak[1])
            SetNpcDeathScript(nNpcIndex, BOSS_DEATH_SCRIPT)
            SetNpcTimer(nNpcIndex, TIME_SMALLBOSS_REMOVE)
            local nMapIdx = boss_pak[4]
            local map_name = SmallBoss_DataSave[nTime].map_names[nMapIdx] or "B¶n ®å hµnh tr×nh"
            local szMsg = format("Nghe nãi %s ®· xuÊt hiÖn ë %s g©y sãng giã cho vâ l©m.", boss_pak[8], map_name)
            local szSub = format("<color=yellow>%s<color> xuÊt hiÖn t¹i <color=green>%s (%d,%d) <color>.", boss_pak[8], map_name, floor((boss_pak[5]/32)/8), floor((boss_pak[6]/32)/16))
            AddGlobalNews(szMsg)
            Msg2SubWorld(szSub)
        else
            print("Lçi: Boss TiÓu thø "..k.." kh«ng thÓ khëi t¹o.")
        end
    end
end

function smallboss_newboss(nTime)
    if not SmallBoss_DataSave[nTime] then
        SmallBoss_DataSave[nTime] = {record_boss = {}, new_boss = {}, map_names = {}}
    end
    return 1
end

function smallboss_getaboss()
    local nTime = tonumber(GetLocalDate("%d%H"))
    smallboss_newboss(nTime)
    local item = SmallBoss_DataSave[nTime]
    local boss_info = nil
    local m_loop = 0
    local nMaxBoss = getn(SMALLBOSS_SPAWN_INFO)
    while (1) do
        m_loop = m_loop + 1
        if m_loop > 200 then break end
        local nRBoss = random(1, nMaxBoss)
        if not item.new_boss[nRBoss] then
            item.new_boss[nRBoss] = 1
            boss_info = SMALLBOSS_SPAWN_INFO[nRBoss]
            break
        end
    end
    if not boss_info then return nil end
    local nMapIdx = SubWorldID2Idx(boss_info.n_mapid)
    if nMapIdx == -1 then return nil end
    local tb_coords = boss_info.tb_coords
    local nIdx = random(getn(tb_coords))
    local nXBoss = tb_coords[nIdx][1] * 8 * 32
    local nYBoss = tb_coords[nIdx][2] * 16 * 32
    item.map_names[nMapIdx] = boss_info.sz_mapname
    return {boss_info.n_npcid, boss_info.n_level, boss_info.n_series, nMapIdx, nXBoss, nYBoss, 1, boss_info.sz_name, 1}
end

function _getadata(file)
    local nHeight = _GetTabFileHeight(file)
    if nHeight <= 1 then 
        print("Lçi: File tåa ®é kh«ng cã d÷ liÖu hoÆc sai ®­êng dÉn: "..tostring(file))
        return nil 
    end
    local totalcount = nHeight - 1
    local id = random(1, totalcount)
    local w = tonumber(_GetTabFileData(file, id + 1, 1))
    local x = tonumber(_GetTabFileData(file, id + 1, 2))
    local y = tonumber(_GetTabFileData(file, id + 1, 3))
    local z = _GetTabFileData(file, id + 1, 4)
    return w, x, y, z
end

function _GetTabFileHeight(mapfile)
    if (TabFile_Load(mapfile, mapfile) == 0) then
        print("Load TabFile Error: "..tostring(mapfile))
        return 0
    end
    return TabFile_GetRowCount(mapfile)
end

function _GetTabFileData(mapfile, row, col)
    if (TabFile_Load(mapfile, mapfile) == 0) then
        return 0
    else
        local szVal = TabFile_GetCell(mapfile, row, col)
        if szVal == nil or szVal == "" then return 0 end
        
        local nVal = tonumber(szVal)
        if nVal then return nVal end
        return szVal
    end
end