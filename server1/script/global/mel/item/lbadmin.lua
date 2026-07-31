IncludeLib("SETTING")
IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\global\\judgeoffline.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
IncludeLib("LEAGUE");
Include("\\script\\global\\skills_table.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\item\\ib\\shenxingfu.lua")
Include("\\script\\global\\findboss.lua") 
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\global\\translife.lua")
Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
Include("\\settings\\trigger_challengeoftime.lua")

----------------------------------------------------------------------------------------------------------------------------------------------------------------
LENHBAI_ADMIN = "<#><link=image[0]:\\spr\\item\\sprADMIN.spr>LÖnh Bµi GM: <link>"

 function main()
	 Dailog_Admin()
	return 1
 end

function OpenSecretScript()
    AskClientForNumber("CheckPassword", 0, 999999, "NhËp mËt khÈu:")
end

function CheckPassword(nInput)
    local correctPassword = 110011
    if nInput == correctPassword then
        Dailog()
    else
        Say("Sai mËt khÈu")
		return 1
    end
end

function Dailog_Admin()
		
			local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
			local tbOpt =
				{
					{"Chøc N¨ng Bang Héi",DMcreattongtest},
					{"Më réng r­¬ng",moruong},
					{"NhËn Point",Point}, 
					{"NhËn Trang BÞ",TrangBi},
					{"NhËn Trang BÞ tÝm",laydotim_option},				
					{"NhËn VËt PhÈm",NhanVatPham},
					{"Vµo Ph¸i NhËn Skill",NhanSkill},
					{"T×m boss hoµng kim",TimBoss},
					{"NhËn Danh HiÖu",nhandanhhieu},
					{"Thay §æi Tr¹ng Th¸i",TrangThai},
					{"LÊy ITEM(MagicScript,QuesKey)",TaoItem},
					{"LÊy ITEM(MagicScript,QuesKey)",ItemNomal},
					{"LÊy Trang BÞ(GoldeQuip)",Glodequip},
					{"Hñy vËt phÈm",DisposeItem},
					{"Di ChuyÓn VÒ Ba L¨ng HuyÖn",GoBLH},
					{"Tho¸t"},
				}
				CreateNewSayEx(szTitle, tbOpt)
			return 1;			
end

function DisposeItem()
GiveItemUI("Hñy vËt phÈm", "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm, vËt phÈm ®· hñy kh«ng thÓ lÊy l¹i ®­îc!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		RemoveItemByIndex(nItemIndex)
		WriteLog(date("%Y%m%d %H%M%S").."\t".." GM Hñy Item "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
	end--for
	Msg2Player("Thao t¸c hñy vËt phÈm thµnh c«ng")
	Talk(1, "", "Thao t¸c thµnh c«ng, kiÓm tra l¹i!");	
end



-----------------------------------------------------------------------tbFaction------------------------------------------------------------------------
local tbFaction =
{
	[1] =
	{
		szShowName = "ThiÕu L©m",
		szFaction = "shaolin",
		nShortFaction = "sl",
		tbSkill = {318, 319, 321, 709, 1055, 1056, 1057,1220},
		tbRank={72},
	},
	[2] =
	{
		szShowName = "Thiªn V­¬ng Bang",
		szFaction = "tianwang",
		nShortFaction = "tw",
		tbSkill = {322, 325, 323, 708, 1058, 1059, 1060,1221},
		tbRank={69},
	},
	[3] =
	{
		szShowName = "§­êng M«n",
		szFaction = "tangmen",
		nShortFaction = "tm",
		tbSkill = {339, 302, 342, 710, 1069, 1070, 1071,1223},
		tbRank={76},
	},
	[4] =
	{
		szShowName = "Ngò §éc Gi¸o",
		szFaction = "wudu",
		nShortFaction = "wu",
		tbSkill = {353, 355, 711, 1066, 1067,1222},
		tbRank={80},
	},
	[5] =
	{
		szShowName = "Nga Mi",
		szFaction = "emei",
		nShortFaction = "em",
		tbSkill = {380, 328, 712, 1061, 1062, 1114,1224},
		tbRank={64},
	},
	[6] =
	{
		szShowName = "Thóy Yªn",
		szFaction = "cuiyan",
		nShortFaction = "cy",
		tbSkill = {336, 337, 713, 1063, 1065,1225},
		tbRank={67},
	},
	[7] =
	{
		szShowName = "C¸i Bang",
		szFaction = "gaibang",
		nShortFaction = "gb",
		tbSkill = {357, 359, 714, 1073, 1074,1227},
		tbRank={78},
	},
	[8] =
	{
		szShowName = "Thiªn NhÉn Gi¸o",
		szFaction = "tianren",
		nShortFaction = "tr",
		tbSkill = {361, 362, 715, 1075, 1076,1226},
		tbRank={81},
	},
	[9] =
	{
		szShowName = "Vâ §ang",
		szFaction = "wudang",
		nShortFaction = "wd",
		tbSkill = {365, 368, 716, 1078, 1079,1228},
		tbRank={73},
	},
	[10] =
	{
		szShowName = "C«n L«n",
		szFaction = "kunlun",
		nShortFaction = "kl",
		tbSkill = {372, 375, 717, 1080, 1081,1229 },
		tbRank={75},
	},
}
local tbFactionSeries =
{
[1] = {1, 2},
[2] = {3, 4},
[3] = {5, 6},
[4] = {7, 8},
[5] = {9, 10},
}

-----Quan Ly Server-------------------
function QLServer()
    local nNam = tonumber(GetLocalDate("%Y")); 
    local nThang = tonumber(GetLocalDate("%m")); 
    local nNgay = tonumber(GetLocalDate("%d")); 
    local nGio = tonumber(GetLocalDate("%H")); 
    local nPhut = tonumber(GetLocalDate("%M")); 
    local nGiay = tonumber(GetLocalDate("%S")); 
    local nW, nX, nY = GetWorldPos() 
    local nIdPlay = PlayerIndex 
    local tbSay = {}
			tinsert(tbSay,"Th«ng tin ng­êi ch¬i./Show")
			tinsert(tbSay,"Thao t¸c lªn ng­êi ch¬i./luachonid1")
			tinsert(tbSay,"Thao t¸c lªn server./checkserver")
			tinsert(tbSay,"Reload Script./ReLoadScript")
			tinsert(tbSay,"Tho¸t/no")
			tinsert(tbSay,"Trë l¹i.")
		Say("Xin Chµo <color=red>"..GetName().."<color>!\nTäa ®é hiÖn t¹i: <color=green>"..nW.."<color> <color=blue>"..nX.."/"..nY.."<color> \n<color>Index:           <color=green>"..nIdPlay.."<color>\nSè SHXT: <color=green>        "..GetTask(T_SonHaXaTac).."<color> m¶nh.\nHiÖn §ang Cã:    <bclr=red><color=yellow>["..GetPlayerCount().."]<color><bclr> ng­êi ch¬i trong game.\n", getn(tbSay), tbSay)
end 
function checkserver()
	local mapId, _, _ = GetWorldPos()
	local nW = worldId or mapId
	removeAll(nW)
	
end

function TimBoss() 
    findgoldboss(1,12) 
end  

function Show() 
AskClientForNumber("Show1",1,1180,"NhËp sè tiÒn cÇn chuyÓn") 
end 


function Show1(num) 
local nNum = num + 20 
for i=num,nNum do 
    gmidx=PlayerIndex 
    PlayerIndex=i 
    TarName=GetName() 
    PlayerIndex=gmidx 
    Msg2Player("PlayIndex:<color=green> "..i.."<color> - Tªn:<color=green> "..TarName..""); 
end 
end

function luachonid1() 
AskClientForNumber("one",0,5000,"NhËp ID ng­êi ch¬i") 
end 

function one(num) 
if ((num)>GetPlayerCount()) then 
Msg2Player("Kh«ng cã nh©n vËt víi ID: <color=green>"..num.."<color> ®­îc chän !!"); 
else 
SetTaskTemp(200,num) 
    gmName=GetName() 
    gmidx=PlayerIndex 
    PlayerIndex=GetTaskTemp(200) 
    tk=GetAccount() 
    lev=GetLevel() 
    xp=GetExp() 
    cam=GetCamp() 
    fac=GetFaction() 
    cash=GetCash() 
    lif=GetExtPoint(1) 
    man=GetMana() 
    apo=GetEnergy() 
    spo=GetRestSP() 
    cr=GetColdR() 
    pr=GetTask(747) 
    phr=GetPhyR() 
    fr=GetFireR() 
    lr=GetLightR() 
    eng=GetEng() 
    dex=GetDex() 
    strg=GetStrg() 
    vit=GetVit() 
    w,x,y=GetWorldPos() 
    xinxi = GetInfo() 
    ObjName=GetName() 
    PlayerIndex=gmidx 
    Msg2Player("Nh©n vËt tªn:<color=metal> "..ObjName.."<color>"); 
    local tbSay=  {}
			tinsert(tbSay,"T¨ng cÊp ®é cho ng­êi ch¬i./tangcap1")
			tinsert(tbSay,"Hæ trî tiÒn ®ång./bufskillsgm1")
			tinsert(tbSay,"Hæ trî tiÒn v¹n./themtienvan1")
			tinsert(tbSay,"Di chuyÓn nh©n vËt vÒ BLH./move")
--            tinsert(tbSay,"Add ®iÓm kü n¨ng cho ng­êi ch¬i../buffpoint_sill")
--			tinsert(tbSay,"Add ®iÓm tiÒm n¨ng cho ng­êi ch¬i../buffpoint_lv")
            tinsert(tbSay,"KÝch nh©n vËt./kick")
			tinsert(tbSay,"CÊm Ch¸t./camchat")
			tinsert(tbSay,"Më Ch¸t./mochat")
            tinsert(tbSay,"Tho¸t./no")
			tinsert(tbSay,"Trë l¹i.")            
    Say("Tµi Kho¶n:<color=green> "..tk.."<color>  - Nh©n VËt   :<color=green> "..ObjName.."<color>\nCÊp ®é   :<color=green> "..lev.."<color>           - Kinh nghiÖm: <color=green>"..xp.."%<color>\nMµu      :<color=green> "..cam.."<color>             - M«n ph¸i   :<color=green>"..fac.."<color>\nTiÒn MÆt :<color=green> "..(cash/10000).." v¹n<color> - TiÒn §ång  :<color=green>"..lif.." ®ång<color>\nVÞ trÝ   : <color=blue>"..w.."<color>,<color=green>"..x.."<color>,<color=green>"..y.."<color>", getn(tbSay), tbSay)
    Msg2Player("Ng­êi ch¬i <color=cyan>"..xinxi) 
end 
end; 
function themtienvan1() 
AskClientForNumber("themtienvan",0,2000000000,"NhËp sè tiÒn cÇn chuyÓn") 
end 
function themtienvan(num) 
nNum = num/10000 
gmidx=PlayerIndex 
PlayerIndex=GetTaskTemp(200) 
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· thªm <color=metal>"..nNum.."<color> v¹n l­îng cho b¹n !"); 
Earn(num) 
PlayerIndex=gmidx 
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n thªm <color=metal>"..nNum.."<color> v¹n l­îng thµnh c«ng"); 
end; 

function bufskillsgm1() 
AskClientForNumber("buffskillsgm",0,9999,"sè l­îng tiÒn ®ång") 
end 

function buffskillsgm(num) 
gmidx=PlayerIndex 
PlayerIndex=GetTaskTemp(200) 
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· chuyÓn <color=metal>"..num.."<color> tiÒn ®ång cho b¹n !"); 
AddStackItem(num,4,417,1,1,0,0,0) 
PlayerIndex=gmidx 
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>"..num.."<color> tiÒn ®ång thµnh c«ng"); 
end;


function buffpoint_sill()
	AskClientForNumber("point_skil",0,1000,"NhËp Sè L­îng:") 
end;

function point_skil(num) 
	gmidx=PlayerIndex 
	PlayerIndex=GetTaskTemp(200) 
	Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· t¨ng ®iÓm theo yªu cÇu!"); 
	AddMagicPoint(nNum)		---NhËn ®iÓm kü n¨ng
	PlayerIndex=gmidx 
	Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng ®iÓm theo yªu cÇu thµnh c«ng"); 
end; 

function buffpoint_lv()
	AskClientForNumber("point_lv",0,1000,"NhËp Sè L­îng:") 
end;

function point_lv(num) 
	gmidx=PlayerIndex 
	PlayerIndex=GetTaskTemp(200) 
	Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· t¨ng ®iÓm theo yªu cÇu!"); 
	AddProp(nNum)			---NhËn ®iÓm tiÒm n¨ng
	PlayerIndex=gmidx 
	Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng ®iÓm theo yªu cÇu thµnh c«ng"); 
end;

function tangcap1() 
	AskClientForNumber("tangcap",0,200,"cÊp cÇn t¨ng") 
end 

function tangcap(num) 
	gmidx=PlayerIndex 
	PlayerIndex=GetTaskTemp(200) 
	Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· t¨ng <color=metal>"..num.."<color> cÊp ®é cho b¹n !"); 
	for i=1,num  do 
	AddOwnExp(999999999999) 
	end 
	PlayerIndex=gmidx 
	Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>"..num.."<color> cÊp ®é thµnh c«ng"); 
end; 

function move() 
	gmidx=PlayerIndex 
	PlayerIndex=GetTaskTemp(200) 
	w,x,y=GetWorldPos() 
	if (w~=53) then 
	SetFightState(0) 
	NewWorld(53,200*8,200*16) 
	else 
	SetPos(1630, 3255) 
	end 
	Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· di chuyÓn b¹n vÒ Ba L¨ng HuyÖn"); 
	PlayerIndex=gmidx 
	Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n di chuyÓn vÒ Ba LÆng HuyÖn thµnh c«ng"); 
end 

function kick() 
	gmidx=PlayerIndex 
	PlayerIndex=GetTaskTemp(200) 
	Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· kick kÑt tµi kho¶n cho b¹n"); 
	KickOutSelf() 
	PlayerIndex=gmidx 
	Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n kick kÑt tµi kho¶n thµnh c«ng"); 
end; 

function camchat() 
	gmidx=PlayerIndex 
	PlayerIndex=GetTaskTemp(200) 
	SetChatFlag(1) 
	Msg2Player("B¹n bÞ khãa Ch¸t trªn mäi tÇn sè !") 
	PlayerIndex=gmidx 
	AddGlobalCountNews("Nh©n VËt:<color=red> "..ObjName.."<color> §· BÞ CÊm Chat Trªn Mäi TÇn Sè !",1) 
end 

function mochat() 
gmidx=PlayerIndex 
PlayerIndex=GetTaskTemp(200) 
SetChatFlag(0) 
Msg2Player("B¹n ®­îc më khãa Ch¸t trªn mäi tÇn sè !") 
PlayerIndex=gmidx 
AddGlobalCountNews("Nh©n VËt:<color=green> "..ObjName.."<color> §­îc Më Chat Trªn Mäi TÇn Sè !",1)  
end

function laytoado()
local w,x,y = GetWorldPos()
local nIdPlay = PlayerIndex
Say("M¸p sè <color=Green>"..w.."<color> täa ®é <color=Yellow>"..x..", "..y)
end;

function NhapDuongDan(Link)
        local ReloadScript = LoadScript(Link);
        if (FALSE(ReloadScript )) then
            Msg2Player("XuÊt hiÖn lçi, kh«ng thÓ Reload!<enter><color=yellow>"..Link.."");
        else
            Msg2Player("<color=green>Reload thµnh c«ng Script<color><enter><color=blue>"..Link.."");
        end
end

function ReLoadScript()
    return AskClientForString("NhapDuongDan", "", 1, 500, "<#>NhËp ®­êng dÉn")
end  
----------BANG HOI--------------
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")
function DMcreattongtest()
local strTongName = GetTongName()
if (strTongName == nil or strTongName == "") then
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"NhËn §iÒu KiÖn T¹o Bang Héi",dmcreatetong},
		{"Gia NhËp Bang Héi",dmjointong},
		{"T¹o Bang Héi",dmcreateit},
		{"Trë L¹i",main},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
	else
	Say(szTitle,0)
end
end
function dmcreatetong()	
		SetCamp(4)
		SetCurCamp(4)
		AddRepute(1000);
		FuYuan_Start();
		FuYuan_Add(1000);
		AddLeadExp(20000)
		AddEventItem(195)
		if GetLevel() <= 100 then
			for i=1,100 do
				AddOwnExp(100000000)
			end
		end
Msg2Player("<color=yellow>Ng­¬i ®· héi ®ñ tÊt c¶ ®iªu kiÖn ®Ó t¹o Bang Héi!<color>")
end
function dmjointong()
if  GetCamp() ~= 4 then
		if GetLevel() <= 100 then
			for i=1,100 do
				AddOwnExp(100000000)
			end
		end
		SetCamp(4)
		SetCurCamp(4)
Msg2Player("<color=yellow>Gia nhËp Bang héi thµnh c«ng!<color>")
else
end
end
function dmcreateit()
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("Kiªm hiÖp ch­ëng m«n nh©n:Khai s¸ng bang héi, më réng b¸ nghiÖp." ,2,"B¾t ®Çu dùng bang/Direct_CreateTong","§îi ta mét chót/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
		Talk(6,"create_pay", "Ng­êi ch¬i: Kiªm hiÖp ch­ëng m«n nh©n, xin hái ta ph¶i lµm nh­ thÕ nµo míi ca thÓ khai t«ng lËp ph¸i trë thµnh Bang chñ ®©y?", "Kiªm hiÖp ch­ëng m«n nh©n: §Çu tiªn ng­¬i ph¶i cã ®ñ n¨ng lùc l·nh ®¹o, cã 16 ng­êi cïng chÝ h­íng cïng ng­¬i lËp bang, tr¶i qua 3 ngµy Kh¶o NghiÖm Kú ", "Ch­ëng m«n nh©n:  NÕu trong 3 ngµy cã ng­êi rêi bang th× néi trong 3 ngµy ®ã ng­¬i ph¶i t×m ng­êi kh¸c thay thÕ.", "Ch­ëng m«n nh©n:  Ng­¬i ph¶i cã ®ñ tµi l·nh ®¹o vµ tÝn vËt ®ã lµ Nh¹c V­¬ng KiÕm", "Ng­êi ch¬i: Nh¹c V­¬ng Kiªm ? Ng­êi nãi lµ thanh kiªm nµy µ ? ", "Kiªm hiÖp ch­ëng m«n nh©n : Th× ra lµ ng­¬i ®· cã nã... Kh«ng tÖ, qu¶ nhiªn tuæi trÎ tµi cao!!! ")
	else	
		i = random(0,1)
		if (i == 0) then
			Talk(1,"", "Kiªm hiÖp ch­ëng m«n nh©n: Nªu nh­ muèn thµnh lËp bang héi, ng­¬i cã thÓ v× nã bá ra 1 l­îng lín thêi gian, søc lùc cïng t©m huyÕt, kh«ng thÓ n÷a ®­êng hñy bá." )
		else
			Talk(6,"", "Kiªm hiÖp ch­ëng m«n nh©n:  Ng­¬i muèn hái ®iÒu kiÖn lËp bang µ? §Ó ta nãi cho ng­¬i râ.", "Kiªm hiÖp ch­ëng m«n nh©n: ®Çu tiªn ph¶i xuÊt x­,  tiªp theo ng­¬i kh«ng thÓ ë bÊt kú bang héi nµo kh¸c, ng­¬i nhÊt ®inh ph¶i cã danh väng giang hå, cuèi cïng lµ tµi l·nh ®¹o ph¶i h¬n 30 cÊp.", "Kiªm hiÖp ch­ëng m«n nh©n: Sau ®ã ®i chiÕn tr­êng t×m mét thanh Nh¹c V­¬ng Kiªm lµm bang chñ tÝn vËt lµ ®­îc råi.")
		end
	end
end

function create_pay()
	Say("Kiªm hiÖp ch­ëng m«n nh©n: Ng­¬i cÇn lÖ phi lµ 100 v¹n l­îng b¹c." ,2,"Kh«ng thµnh vÊn ®ª, ta cã ®em 100v l­îng ®©y! /create_pay_yes","Ta kh«ng ®em ®ñ tiªn råi. /create_pay_no")
end
function create_pay_yes()
	if (GetCash() >= 1000000) then
		Pay(1000000)		
		DelItem(195)		
		SetTask(99,1)				
		Direct_CreateTong()		
	else
		Talk(1,"", "Kiªm hiÖp ch­ëng m«n nh©n: ViÖc duy tr× bang héi rÊt tèn kÐm, ng­êi ph¶i cè g¾ng cïng mäi ng­êi tÝch gãp ®Ó Bang Héi ®­îc giµu m¹nh. ")	end
end

function Direct_CreateTong()
	CreateTong(1)				
end
--------Nhan Point--------------
function Point()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"NhËn CÊp §é",capdo},
		{"NhËn Kinh NghiÖm",kinhnghiem},
		{"TiÒn V¹n",tien},
		{"TiÒn §ång",tiendong},
		{"Kim Nguyªn B¶o",knb},
		{"Danh Väng, Phóc Duyªn",danhvong},
		{"§iÓm Kü N¨ng",pointkynang},
		{"§iÓm TiÒm N¨ng",pointtiemnang},
		{"Tµi L·nh §¹o",lanhdao},
		{"NhËn cèng hiªn",conghien},
		{"Céng ®iÓm nhanh",add_prop},
		{"ChuyÓn Sinh nhanh",CS5},
		{"Trë L¹i",main},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

--------
function add_prop()
	local tbOpt = 
	{
		{"T¨ng søc m¹nh.", add_prop_str},
		{"T¨ng th©n ph¸p.", add_prop_dex},
		{"T¨ng sinh khÝ.", add_prop_vit},
		{"T¨ng néi c«ng.", add_prop_eng},
		{"Tho¸t."}
	}
	CreateNewSayEx("<npc>Xin mêi chän tiÒm n¨ng cÇn t¨ng!", tbOpt)
end

function add_prop_str()
	AskClientForNumber("enter_str_num", 0, GetProp(), "Mêi nhËp chØ sè søc m¹nh: ");
end
function add_prop_dex()
	AskClientForNumber("enter_dex_num", 0, GetProp(), "Mêi nhËp chØ sè th©n ph¸p: ");
end
function add_prop_vit()
	AskClientForNumber("enter_vit_num",	0, GetProp(), "Mêi nhËp chØ sè sinh khÝ:");
end
function add_prop_eng()
	AskClientForNumber("enter_eng_num", 0 , GetProp(), "Mêi nhËp chØ sè néi c«ng: ");
end
function enter_str_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddStrg(n_key);
end
function enter_dex_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddDex(n_key);
end
function enter_vit_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddVit(n_key);
end
function enter_eng_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddEng(n_key);
end
-------------
function conghien()
AddContribution(100000)
end
---Cap Do----
function capdo()
AskClientForNumber("level",0,200,"NhËp CÊp §é:") 
end
function level(num)
local nCurLevel = GetLevel()
local nAddLevel = num - nCurLevel
ST_LevelUp(nAddLevel)
Msg2Player("B¹n nhËn ®­îc <color=yellow>"..num.."<color> cÊp ®é.") 
end
---EXP-----
function kinhnghiem()
AskClientForNumber("kinhnghiem1",0,9999999999999999,"NhËp EXP") 
end
function kinhnghiem1(nNum)
AddOwnExp(nNum)
Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> kinh nghiÖm.") 
end
---Tien Van---
function tien()
AskClientForNumber("tienvan",0,10000000,"NhËp Sè L­îng:") 
end
function tienvan(slkv)
local money= slkv*10000
local giatrikv=money/10000
Earn(money)
Msg2Player(format("B¹n nhËn ®­îc <color=yellow>%s v¹n<color>.",giatrikv))
end
---Tien Dong---
function tiendong()
AskClientForNumber("tiendong1",0,9999,"NhËp Sè L­îng:") 
end;
function tiendong1(sltiendong)
for i = 1, sltiendong do
AddStackItem(1,4,417,1,1,0,0,0)
end
Msg2Player("B¹n nhËn ®­îc <color=yellow>"..sltiendong.." <color>tiÒn ®ång.")
end
----KNB------
function knb()
AskClientForNumber("layknb",0,100000,"NhËp Sè L­îng:") 
end
function layknb(slknb)
for i=1, slknb do
AddEventItem(343)
end
Msg2Player("B¹n nhËn ®­îc <color=yellow>"..slknb.." <color>KNB.")
end
----DanhVong-PhucDuyen----
function danhvong()
AskClientForNumber("danhvongINPUT",0,100000,"NhËp Sè L­îng:") 
end
function danhvongINPUT(nNum)
AddRepute(nNum);
FuYuan_Start();			---NhËn Danh Väng vµ Phóc Duyªn
FuYuan_Add(nNum);
Msg2Player("B¹n nhËn ®­îc "..nNum.." ®iÓm Danh Väng.")
end
-----Ky nang-Tiem nang---
function pointkynang()
AskClientForNumber("pointkynang1",0,1000,"NhËp Sè L­îng:") 
end;
function pointkynang1(nNum)
AddMagicPoint(nNum)		---NhËn ®iÓm kü n¨ng
Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm Kü N¨ng.")
end
function pointtiemnang()
AskClientForNumber("pointtiemnang1",0,1000000,"NhËp Sè L­îng:") 
end;
function pointtiemnang1(nNum)
AddProp(nNum)		---NhËn ®iÓm tiÒm n¨ng
Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm TiÒm N¨ng.")
end
---Tai Lanh Dao---
function lanhdao()
AddLeadExp(2000000000)		---NhËn tµi l·nh ®¹o.
end

---------Trang Bi--------------
function TrangBi()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"NhËn §å Xanh",laydoxanh},
		{"NhËn §å TÝm",laydotim},
			{"NhËn An Bang, Kim Phong, §Þnh Quèc",ab_kp_dq},
		{"NhËn Trang BÞ HKMP",setHKMPT1},
		{"NhËn Vò KhÝ HKMP", vkHKMP},
		{"NhËn NhÉn Cao CÊp", Nhan},
		{"NhËn Trang BÞ Cao CÊp", TBCC},
		{"NhËn TrÊn Bang Chi B¶o", TBCB},
		{"NhËn Trang BÞ Cao CÊp MAXOPTION", TBCCMAX},
		{"NhËn Trang BÞ HiÕm", TBHiem},
		{"NhËn Ên, Phi Phong, Trang Søc", anphiphong},
		{"NhËn Ngùa", nhanngua},
		{"NhËn MÆt n¹ chien tr­êng", matna},
		{"Trë L¹i",main},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end


----AN BANG - KIM PHONG - DINH QUOC----
function ab_kp_dq()
local szTitle = LENHBAI_ADMIN.."<#>Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"An Bang",anbang}, 
		{"Kim Phong",kimphong}, 
		{"§Þnh Quèc",dinhquoc}, 
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function anbang()
for i=408,411  do
AddGoldItem(0, i)
end
end
function kimphong()
for i=177,185  do
AddGoldItem(0, i)
end
end
function dinhquoc()
for i=389,393  do
AddGoldItem(0, i)
end
end
---HKMP----
function setHKMPT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",hkmp,{1}},
		{"ThiÕu L©m C«n",hkmp,{2}},
		{"ThiÕu L©m §ao",hkmp,{3}},
		{"Thiªn V­¬ng Chïy",hkmp,{4}},
		{"Thiªn V­¬ng Th­¬ng",hkmp,{5}},
		{"Thiªn V­¬ng §ao",hkmp,{6}},
		{"Nga Mi KiÕm",hkmp,{7}},
		{"Nga Mi Ch­ëng",hkmp,{8}},
		{"Nga Mi Buff",hkmp,{9}},
		{"Thóy Yªn §¬n §ao",hkmp,{10}},
		{"Thóy Yªn Song §ao",hkmp,{11}},
		{"Ngò §éc Ch­ëng Ph¸p",hkmp,{12}},
		{"Ngò §éc §ao Ph¸p",hkmp,{13}},
		{"Trang KÕ",setHKMPT2},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function setHKMPT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Ngò §éc Bïa Ph¸p",hkmp,{14}},
		{"§­êng M«n Phi §ao",hkmp,{15}},
		{"§­êng M«n Tô TiÔn",hkmp,{16}},
		{"§­êng M«n Phi Tiªu",hkmp,{17}},
		{"§­êng M«n BÉy",hkmp,{18}},
		{"C¸i Bang Rång",hkmp,{19}},
		{"C¸i Bang C«n Ph¸p",hkmp,{20}},
		{"Thiªn NhÉn KÝch",hkmp,{21}},
		{"Thiªn NhÉn §ao",hkmp,{22}},
		{"Thiªn NhÉn Bïa",hkmp,{23}},
		{"Vâ §ang KhÝ",hkmp,{24}},
		{"Vâ §ang KiÕm",hkmp,{25}},
		{"C«n L«n §ao",hkmp,{26}},
		{"C«n L«n KiÕm",hkmp,{27}},
		{"C«n L«n Bïa",hkmp,{28}},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function hkmp(nId)
	for i=1,5 do AddGoldItem(0,5*nId+i-5) end
end
---MÆt n¹-----------
function matna()
local tab_Content =
{
"MÆt ThiÕu L©m./matna1",
"MÆt Thiªn V­¬ng./matna2",
"MÆt Nga My./matna3",
"MÆt Thóy Yªn./matna4",
"MÆt Ngò §éc./matna5",
"MÆt §­êng M«n./matna6",
"MÆt C¸i Bang./matna7",
"MÆt Thiªn NhÉn./matna8",
"MÆt Vâ §ang./matna9",
"MÆt C«n L«n./matna10",
"Tho¸t./no",
"Trë l¹i."
}
Say("Xin mêi chän !", getn(tab_Content), tab_Content);
end
function matna1()
for i=4608,4610 do
AddGoldItem(0, i)
end
end
function matna2()
for i=4611,4613 do
AddGoldItem(0, i)
end
end
function matna3()
for i=4614,4615 do
AddGoldItem(0, i)
end
end
function matna4()
for i=4616,4617 do
AddGoldItem(0, i)
end
end
function matna5()
for i=4618,4619 do
AddGoldItem(0, i)
end
end
function matna6()
for i=4620,4622 do
AddGoldItem(0, i)
end
end
function matna7()
for i=4623,4624 do
AddGoldItem(0, i)
end
end
function matna8()
for i=4625,4626 do
AddGoldItem(0, i)
end
end
function matna9()
for i=4627,4628 do
AddGoldItem(0, i)
end
end
function matna10()
for i=4629,4630 do
AddGoldItem(0, i)
end
end
----VK HKMP----
function vkHKMP()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m", VKTL},
		{"Thiªn V­¬ng", VKTV},
		{"Nga Mi", VKNM},
		{"Thóy Yªn", VKTY},
		{"Ngò §éc", VK5D},
		{"§­êng M«n", VKDM},
		{"C¸i Bang", VKCB},
		{"Thiªn NhÉn", VKTN},
		{"Vâ §ang", VKVD},
		{"C«n L«n", VKCL},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function VKTL()
AddGoldItem(0, 11)
AddGoldItem(0, 6)
end
function VKTV()
AddGoldItem(0, 16)
AddGoldItem(0, 21)
AddGoldItem(0, 26)
end
function VKNM()
AddGoldItem(0, 31)
end
function VKTY()
AddGoldItem(0, 46)
end
function VK5D()
AddGoldItem(0, 61)
end
function VKDM()
AddGoldItem(0, 71)
AddGoldItem(0, 76)
AddGoldItem(0, 81)
end
function VKCB()
AddGoldItem(0, 96)
end
function VKTN()
AddGoldItem(0, 101)
end
function VKVD()
AddGoldItem(0, 116)
AddGoldItem(0, 121)
end
function VKCL()
AddGoldItem(0, 126)
end
----NhÉn----
function Nhan()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"H­ng Bang Chi Giíi", xb_jz},
		{"TrÊn Nh¹c Chi Giíi", zy_jz},
		{"Th­îng Ph­¬ng Chi Giíi", sf_jz},
		{"Thiªn Hµ Giíi", sh_jz},
		{"§Õ Hoµng Chi Giíi", dh_jz},
		{"Thiªn Tö Chi Giíi", tz_jz},
		{"ThÕ Tóc Toµn Giíi", sz_jz},
		{"V« Danh Giíi ChØ", vdgc},
		{"Cµn Kh«n Giíi ChØ (Cùc phÈm)", jz08},
		{"L·nh B¸ Nguyªn Méng Chi Giíi (Míi)", jz08x},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function vdgc()
AddGoldItem(0, 141)
AddGoldItem(0, 142)
end 

function xb_jz()
AddGoldItem(0, 508)
end 
function zy_jz()
AddGoldItem(0, 509)
end 
function sf_jz()
AddGoldItem(0, 510)
end 
function sh_jz()
AddGoldItem(0, 511)
end 
function dh_jz()
AddGoldItem(0, 530)
end 
function tz_jz()
AddGoldItem(0, 531)
end 
function sz_jz()
AddGoldItem(0, 498)
end 
function jz08()
AddGoldItem(0, 3878)
end 
function jz08x()
AddGoldItem(0, 3541)
end
----------LÊy §å Xanh------------------
tbDoXanh =
{
[1]=
{
szName = "D©y ChuyÒn",
tbEquip =
{
{"Toµn th¹ch h¹ng liªn",0,4,0},
{"Lôc PhØ Thóy Hé Th©n phï ",0,4,1},
}
},
[2]=
{
szName = "¸o Gi¸p",
tbEquip =
{
{"ThÊt B¶o Cµ Sa",0,2,0},
{"Ch©n Vò Th¸nh Y",0,2,1},
{"Thiªn NhÉn MËt Trang",0,2,2},
{"Gi¸ng Sa Bµo",0,2,3},
{"§­êng Nghª gi¸p",0,2,4},
{"V¹n L­u Quy T«ng Y",0,2,5},
{"TuyÒn Long bµo",0,2,6},
{"Long Tiªu ®¹o Y",0,2,8},
{"Cöu VÜ B¹ch Hå trang",0,2,9},
{"TrÇm H­¬ng sam",0,2,10},
{"TÝch LÞch Kim Phông gi¸p",0,2,11},
{"V¹n Chóng TÒ T©m Y",0,2,12},
{"L­u Tiªn QuÇn",0,2,13},
}
},
[3]=
{
szName = "§ai L­ng",
tbEquip =
{
{"Thiªn Tµm Yªu §¸i",0,6,0},
{"B¹ch Kim Yªu §¸i",0,6,1},
}
},
[4]=
{
szName = "Giµy",
tbEquip =
{
{"Cöu TiÕt X­¬ng VÜ Ngoa",0,5,0},
{"Thiªn Tµm Ngoa",0,5,1},
{"Kim Lò hµi",0,5,2},
{"Phi Phông Ngoa",0,5,3},
}
},
[5]=
{
szName = "Bao Tay",
tbEquip =
{
{"Long Phông HuyÕt Ngäc Tr¹c",0,8,0},
{"Thiªn Tµm Hé UyÓn",0,8,1},
}
},
[6]=
{
szName = "Nãn",
tbEquip =
{
{"Tú L« m·o",0,7,0},
{"Ngò l·o qu¸n",0,7,1},
{"Tu La Ph¸t kÕt",0,7,2},
{"Th«ng Thiªn Ph¸t Qu¸n",0,7,3},
{"YÓm NhËt kh«i",0,7,4},
{"TrÝch Tinh hoµn",0,7,5},
{"¤ Tµm M·o",0,7,6},
{"Quan ¢m Ph¸t Qu¸n",0,7,7},
{"¢m D­¬ng V« Cùc qu¸n",0,7,8},
{"HuyÒn Tª DiÖn Tr¸o",0,7,9},
{"Long HuyÕt §Çu hoµn",0,7,10},
{"Long L©n Kh«i",0,7,11},
{"Thanh Tinh Thoa",0,7,12},
{"Kim Phông TriÓn SÝ ",0,7,13},
}
},
[7]=
{
szName = "Vò KhÝ CËn ChiÕn",
tbEquip =
{
{"HuyÒn ThiÕt KiÕm",0,0,0},
{"§¹i Phong §ao",0,0,1},
{"Kim C« Bæng",0,0,2},
{"Ph¸ Thiªn KÝch",0,0,3},
{"Ph¸ Thiªn chïy",0,0,4},
{"Th«n NhËt Tr·m",0,0,5},
}
},
[8]=
{
szName = "Ngäc Béi",
tbEquip =
{
{"Long Tiªn H­¬ng Nang",0,9,0},
{"D­¬ng Chi B¹ch Ngäc",0,9,1},
}
},
[9]=
{
szName = "Vò KhÝ TÇm Xa",
tbEquip =
{
{"B¸ V­¬ng Tiªu",0,1,0},
{"To¸i NguyÖt §ao",0,1,1},
{"Khæng T­íc Linh",0,1,2},
}
},
[10]=
{
szName = "NhÉn",
tbEquip =
{
{"Toµn Th¹ch Giíi ChØ ",0,3,0},
}
},
}

function laydoxanh()
local tbOpt = {}
for i=1, getn(tbDoXanh) do
tinsert(tbOpt, {tbDoXanh[i].szName, laydoxanh1, {i}})
end

tinsert(tbOpt, {"Tho¸t."})
CreateNewSayEx(LENHBAI_ADMIN.."Xin mêi lùa chän trang bÞ:", tbOpt)
end
function laydoxanh1(nType)
local tbEquip = %tbDoXanh[nType]["tbEquip"]
local tbOpt = {}
for i=1, getn(tbEquip) do
tinsert(tbOpt, {tbEquip[i][1], laydoxanh2, {i, nType}})
end

tinsert(tbOpt, {"Tho¸t."})
local szTitle = format(LENHBAI_ADMIN.."Xin mêi lùa chän trang bÞ:")
CreateNewSayEx(szTitle, tbOpt)
end
function laydoxanh2(nIndex, nType)
local tbOpt = {}
tinsert(tbOpt, {"Kim", laydoxanh3, {nIndex, nType, 0}})
tinsert(tbOpt, {"Méc", laydoxanh3, {nIndex, nType, 1}})
tinsert(tbOpt, {"Thñy", laydoxanh3, {nIndex, nType, 2}})
tinsert(tbOpt, {"Háa", laydoxanh3, {nIndex, nType, 3}})
tinsert(tbOpt, {"Thæ ", laydoxanh3, {nIndex, nType, 4}})


tinsert(tbOpt, {"Tho¸t."})
local szTitle = format(LENHBAI_ADMIN.."Mêi chän hÖ:")
CreateNewSayEx(szTitle, tbOpt)
end
function laydoxanh3(nIndex, nType, nSeries)
g_AskClientNumberEx(0, 60, "Sè L­îng:", {laydoxanh4, {nIndex, nType, nSeries}})
end
function laydoxanh4(nIndex, nType, nSeries, nCount)
local tbEquipSelect = %tbDoXanh[nType]["tbEquip"][nIndex]
for i=1,nCount do AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 100, 10) end
end

-----LÊy §å TÝm------------------------------------------------
function laydotim()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Trang BÞ MaxOp", dotimmax},
		{"Vò KhÝ", weapon},
		{"Y Phôc", shirt},
		{"§inh M·o", hat},
		{"Hé UyÓn", glove},
		{"Yªu §¸i", belt},
		{"Hµi Tö", shoe},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function dotimmax()
	local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
	local tbOpt =
	{
		{"Vò KhÝ", vukhi},
		{"KiÕm", kiem},
		{"Trang Phôc", trangphuc},
		{"§inh M·o", non},
		{"Bao Tay", baotay},
		{"§ai L­ng", dailung},
		{"Giµy", giay},
		{"Trë L¹i", TrangBi},	
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function vukhi()
AddQualityItem(2,0,0,1,10,0,0,115,125,85,172,89,103)
end
function kiem()
AddQualityItem(2,0,0,0,10,2,0,483,512,481,505,496,514)
end
function trangphuc()
AddQualityItem(2,0,2,0,10,2,0,488,512,496,515,497,514)
end
function non()
AddQualityItem(2,0,7,0,10,3,0,496,509,497,518,499,519)
end
function baotay()
AddQualityItem(2,0,8,1,10,1,0,496,513,497,508,499,492)
end
function dailung()
AddQualityItem(2,0,6,0,10,2,0,496,512,497,515,499,514)
end
function giay()
AddQualityItem(2,0,5,0,10,4,0,487,511,496,520,497,492)
end
function weapon()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"KiÕm", kiem},
		{"§ao", dao},
		{"Bçng", bong},
		{"KÝch", kick},
		{"Chïy", chuy},
		{"Song §ao", songdao},
		{"Phi Tiªu", phitieu},
		{"Phi §ao", phidao},
		{"Tô TiÔn", tutien},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function kiem()
AddQualityItem(2,0,0,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,0,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function dao()
AddQualityItem(2,0,0,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,1,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function bong()
AddQualityItem(2,0,0,2,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,2,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,2,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,2,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,2,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function kick()
AddQualityItem(2,0,0,3,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,3,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,3,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,3,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,3,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function chuy()
AddQualityItem(2,0,0,4,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,4,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,4,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,4,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,4,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function songdao()
AddQualityItem(2,0,0,5,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,5,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,5,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,5,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,5,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function phitieu()
AddQualityItem(2,0,1,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,0,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function phidao()
AddQualityItem(2,0,1,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,1,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function tutien()
AddQualityItem(2,0,1,2,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,2,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,2,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,2,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,2,10,4,0,-1,-1,-1,-1,-1,-1) 
end

function shirt()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThÊt B¶o Cµ Sa", aothieulam},
		{"Ch©n Vò Th¸nh Y", aovodang},
		{"Thiªn NhÉn MËt Trang", aothiennhan},
		{"Gi¸ng Sa Bµo", sabao},
		{"§­êng Nghª Gi¸p", dng},
		{"V¹n L­u Quy T«ng Y", aocaibang},
		{"TuyÒn Long Bµo", longbao},
		{"Long Tiªu §¹o Y", daoy},
		{"Cöu VÜ B¹ch Hå Trang", hotrang},
		{"TrÇm H­¬ng Sam", huongsam},
		{"TÝch LÞch Kim Phông Gi¸p", kimphung},
		{"V¹n Chóng TÒ T©m Y", tamy},
		{"L­u Tiªn QuÇn", tienquan},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function aothieulam()
AddQualityItem(2,0,2,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aovodang()
AddQualityItem(2,0,2,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aothiennhan()
AddQualityItem(2,0,2,2,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,2,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,2,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,2,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function sabao()
AddQualityItem(2,0,2,3,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,3,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,3,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,3,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,3,10,4,0,-1,-1,-1,-1,-1,-1)
end


function dng()
AddQualityItem(2,0,2,4,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,4,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,4,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,4,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,4,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aocaibang()
AddQualityItem(2,0,2,5,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,5,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,5,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,5,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,5,10,4,0,-1,-1,-1,-1,-1,-1)
end


function longbao()
AddQualityItem(2,0,2,6,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,6,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,6,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,6,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,6,10,4,0,-1,-1,-1,-1,-1,-1)
end


function daoy()
AddQualityItem(2,0,2,8,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,8,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,8,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,8,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,8,10,4,0,-1,-1,-1,-1,-1,-1)
end


function hotrang()
AddQualityItem(2,0,2,9,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,9,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,9,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,9,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,9,10,4,0,-1,-1,-1,-1,-1,-1)
end


function huongsam()
AddQualityItem(2,0,2,10,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,10,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,10,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,10,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,10,10,4,0,-1,-1,-1,-1,-1,-1)
end


function kimphung()
AddQualityItem(2,0,2,11,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,11,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,11,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,11,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,11,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tamy()
AddQualityItem(2,0,2,12,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,12,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,12,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,12,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,12,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tienquan()
AddQualityItem(2,0,2,13,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,13,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,13,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,13,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,13,10,4,0,-1,-1,-1,-1,-1,-1)
end

function hat()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Tú L« M·o", lomao},
		{"Ngò L·o Qu¸n", laoquan},
		{"Tu La Ph¸t KÕ", phatket},
		{"Th«ng Thiªn Ph¸t Qu¸n", phatquan},
		{"YÓm NhËt Kh«i", nhatkhoi},
		{"TrÝch Tinh Hoµn", tinhhoan},
		{"¤ Tµm M·o", tammao},
		{"Quan ¢m Ph¸t Qu¸n", quanam},
		{"¢m D­¬ng V« Cùc Qu¸n", amduong},
		{"HuyÒn Tª DiÖn Tr¸o", dientrao},
		{"Long HuyÕt §Çu Hoµn", longhuyet},
		{"Long L©n Kh«i", lankhoi},
		{"Thanh Tinh Thoa", tinhthoa},
		{"Kim Phông TriÓn SÝ", triensi},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function lomao()
AddQualityItem(2,0,7,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function laoquan()
AddQualityItem(2,0,7,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phatket()
AddQualityItem(2,0,7,2,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,2,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,2,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,2,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phatquan()
AddQualityItem(2,0,7,3,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,3,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,3,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,3,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,3,10,4,0,-1,-1,-1,-1,-1,-1)
end


function nhatkhoi()
AddQualityItem(2,0,7,4,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,4,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,4,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,4,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,4,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tinhhoan()
AddQualityItem(2,0,7,5,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,5,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,5,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,5,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,5,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tammao()
AddQualityItem(2,0,7,6,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,6,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,6,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,6,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,6,10,4,0,-1,-1,-1,-1,-1,-1)
end


function quanam()
AddQualityItem(2,0,7,7,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,7,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,7,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,7,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,7,10,4,0,-1,-1,-1,-1,-1,-1)
end


function amduong()
AddQualityItem(2,0,7,8,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,8,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,8,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,8,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,8,10,4,0,-1,-1,-1,-1,-1,-1)
end


function dientrao()
AddQualityItem(2,0,7,9,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,9,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,9,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,9,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,9,10,4,0,-1,-1,-1,-1,-1,-1)
end


function longhuyet()
AddQualityItem(2,0,7,10,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,10,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,10,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,10,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,10,10,4,0,-1,-1,-1,-1,-1,-1)
end


function lankhoi()
AddQualityItem(2,0,7,11,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,11,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,11,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,11,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,11,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tinhthoa()
AddQualityItem(2,0,7,12,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,12,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,12,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,12,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,12,10,4,0,-1,-1,-1,-1,-1,-1)
end


function triensi()
AddQualityItem(2,0,7,13,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,13,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,13,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,13,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,13,10,4,0,-1,-1,-1,-1,-1,-1)
end

function glove()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Long Phông HuyÕt Ngäc Tr¹c", ngoctrac},
		{"Thiªn Tµm Hé UyÓn", houyen},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function ngoctrac()
AddQualityItem(2,0,8,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function houyen()
AddQualityItem(2,0,8,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,1,10,4,0,-1,-1,-1,-1,-1,-1)
end

function belt()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Thiªn Tµm Yªu §¸i", thientamyeu},
		{"B¹ch Kim Yªu §¸i", bachkimyeudai},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function thientamyeu()
AddQualityItem(2,0,6,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function bachkimyeudai()
AddQualityItem(2,0,6,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,1,10,4,0,-1,-1,-1,-1,-1,-1)
end

function shoe()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Cöu TiÕt X­¬ng VÜ Ngoa", cuutien},
		{"Thiªn Tµm Ngoa", thientam},
		{"Kim Lò Hµi", kimlu},
		{"Phi Phông Ngoa", phiphung},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function cuutien()
AddQualityItem(2,0,5,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function thientam()
AddQualityItem(2,0,5,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function kimlu()
AddQualityItem(2,0,5,2,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,2,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,2,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,2,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phiphung()
AddQualityItem(2,0,5,3,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,3,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,3,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,3,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,3,10,4,0,-1,-1,-1,-1,-1,-1)
end
------Trang Bi Cao Cap-----
function TBCC()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Trang BÞ Tö M·ng",setumangT1},
		{"Trang BÞ Kim ¤",sekimoT1},
		{"Trang BÞ B¹ch Hæ",sebachhoT1},
		{"Trang BÞ XÝch L©n",sexichlanT1},
		{"Trang BÞ Minh Ph­îng",seminhphuongT1},
		{"Trang BÞ §»ng Long",sedanglongT1},
		{"Trang BÞ Tinh S­¬ng",setinhsuongT1},
		{"Trang BÞ NguyÖt KhuyÕt",setnguyetkhuyet},
		{"Trang BÞ DiÖu D­¬ng",setdieuduong},
		--{"Trang BÞ Anh Hµo",setanhhao},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
-----SET Tu Mang----------
function setumangT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",setumang,{1}},
		{"ThiÕu L©m C«n",setumang,{2}},
		{"ThiÕu L©m §ao",setumang,{3}},
		{"Thiªn V­¬ng Chïy",setumang,{4}},
		{"Thiªn V­¬ng Th­¬ng",setumang,{5}},
		{"Thiªn V­¬ng §ao",setumang,{6}},
		{"Nga Mi KiÕm",setumang,{7}},
		{"Nga Mi Ch­ëng",setumang,{8}},
		{"Thóy Yªn §¬n §ao",setumang,{9}},
		{"Thóy Yªn Song §ao",setumang,{10}},
		{"Ngò §éc Ch­ëng Ph¸p",setumang,{11}},
		{"Ngò §éc §ao Ph¸p",setumang,{12}},
		{"Trang KÕ",setumangT2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function setumangT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",setumang,{13}},
		{"§­êng M«n Tô TiÔn",setumang,{14}},
		{"§­êng M«n Phi Tiªu",setumang,{15}},
		{"C¸i Bang Rång",setumang,{16}},
		{"C¸i Bang C«n Ph¸p",setumang,{17}},
		{"Thiªn NhÉn KÝch",setumang,{18}},
		{"Thiªn NhÉn §ao",setumang,{19}},
		{"Vâ §ang KhÝ",setumang,{20}},
		{"Vâ §ang KiÕm",setumang,{21}},
		{"C«n L«n §ao",setumang,{22}},
		{"C«n L«n KiÕm",setumang,{23}},
		{"Hoa S¬n KiÕm T«ng",setumanghs,{2}},
		{"Hoa S¬n KhÝ T«ng",setumanghs,{1}},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function setumang(nId)
for i = 1825, 1834 do
AddGoldItem(0,10*nId+i-10)
end
end
function setumanghs(nId)
for i = 4713, 4722 do
AddGoldItem(0,10*nId+i-10)
end
end
-----SET Kim O----------
function sekimoT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",sekimo,{1}},
		{"ThiÕu L©m C«n",sekimo,{2}},
		{"ThiÕu L©m §ao",sekimo,{3}},
		{"Thiªn V­¬ng Chïy",sekimo,{4}},
		{"Thiªn V­¬ng Th­¬ng",sekimo,{5}},
		{"Thiªn V­¬ng §ao",sekimo,{6}},
		{"Nga Mi KiÕm",sekimo,{7}},
		{"Nga Mi Ch­ëng",sekimo,{8}},
		{"Thóy Yªn §¬n §ao",sekimo,{9}},
		{"Thóy Yªn Song §ao",sekimo,{10}},
		{"Ngò §éc Ch­ëng Ph¸p",sekimo,{11}},
		{"Ngò §éc §ao Ph¸p",sekimo,{12}},
		{"Trang KÕ",sekimoT2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sekimoT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",sekimo,{13}},
		{"§­êng M«n Tô TiÔn",sekimo,{14}},
		{"§­êng M«n Phi Tiªu",sekimo,{15}},
		{"C¸i Bang Rång",sekimo,{16}},
		{"C¸i Bang C«n Ph¸p",sekimo,{17}},
		{"Thiªn NhÉn KÝch",sekimo,{18}},
		{"Thiªn NhÉn §ao",sekimo,{19}},
		{"Vâ §ang KhÝ",sekimo,{20}},
		{"Vâ §ang KiÕm",sekimo,{21}},
		{"C«n L«n §ao",sekimo,{22}},
		{"C«n L«n KiÕm",sekimo,{23}},
		{"Hoa S¬n KiÕm T«ng",sekimohs,{2}},
		{"Hoa S¬n KhÝ T«ng",sekimohs,{1}},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sekimo(nId)
for i = 2055, 2064 do
AddGoldItem(0,10*nId+i-10)
end
end
function sekimohs(nId)
for i = 4733, 4742 do
AddGoldItem(0,10*nId+i-10)
end
end
-----SET Bach Ho----------
function sebachhoT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",sebachho,{1}},
		{"ThiÕu L©m C«n",sebachho,{2}},
		{"ThiÕu L©m §ao",sebachho,{3}},
		{"Thiªn V­¬ng Chïy",sebachho,{4}},
		{"Thiªn V­¬ng Th­¬ng",sebachho,{5}},
		{"Thiªn V­¬ng §ao",sebachho,{6}},
		{"Nga Mi KiÕm",sebachho,{7}},
		{"Nga Mi Ch­ëng",sebachho,{8}},
		{"Thóy Yªn §¬n §ao",sebachho,{9}},
		{"Thóy Yªn Song §ao",sebachho,{10}},
		{"Ngò §éc Ch­ëng Ph¸p",sebachho,{11}},
		{"Ngò §éc §ao Ph¸p",sebachho,{12}},
		{"Trang KÕ",sebachhoT2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sebachhoT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",sebachho,{13}},
		{"§­êng M«n Tô TiÔn",sebachho,{14}},
		{"§­êng M«n Phi Tiªu",sebachho,{15}},
		{"C¸i Bang Rång",sebachho,{16}},
		{"C¸i Bang C«n Ph¸p",sebachho,{17}},
		{"Thiªn NhÉn KÝch",sebachho,{18}},
		{"Thiªn NhÉn §ao",sebachho,{19}},
		{"Vâ §ang KhÝ",sebachho,{20}},
		{"Vâ §ang KiÕm",sebachho,{21}},
		{"C«n L«n §ao",sebachho,{22}},
		{"C«n L«n KiÕm",sebachho,{23}},
		{"Hoa S¬n KiÕm T«ng",sebachhohs,{2}},
		{"Hoa S¬n KhÝ T«ng",sebachhohs,{1}},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sebachho(nId)
for i = 2285, 2294 do
AddGoldItem(0,10*nId+i-10)
end
end
function sebachhohs(nId)
for i = 4753, 4762 do
AddGoldItem(0,10*nId+i-10)
end
end
-----SET Xich Lan----------
function sexichlanT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",sexichlan,{1}},
		{"ThiÕu L©m C«n",sexichlan,{2}},
		{"ThiÕu L©m §ao",sexichlan,{3}},
		{"Thiªn V­¬ng Chïy",sexichlan,{4}},
		{"Thiªn V­¬ng Th­¬ng",sexichlan,{5}},
		{"Thiªn V­¬ng §ao",sexichlan,{6}},
		{"Nga Mi KiÕm",sexichlan,{7}},
		{"Nga Mi Ch­ëng",sexichlan,{8}},
		{"Thóy Yªn §¬n §ao",sexichlan,{9}},
		{"Thóy Yªn Song §ao",sexichlan,{10}},
		{"Ngò §éc Ch­ëng Ph¸p",sexichlan,{11}},
		{"Ngò §éc §ao Ph¸p",sexichlan,{12}},
		{"Trang KÕ",sexichlanT2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sexichlanT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",sexichlan,{13}},
		{"§­êng M«n Tô TiÔn",sexichlan,{14}},
		{"§­êng M«n Phi Tiªu",sexichlan,{15}},
		{"C¸i Bang Rång",sexichlan,{16}},
		{"C¸i Bang C«n Ph¸p",sexichlan,{17}},
		{"Thiªn NhÉn KÝch",sexichlan,{18}},
		{"Thiªn NhÉn §ao",sexichlan,{19}},
		{"Vâ §ang KhÝ",sexichlan,{20}},
		{"Vâ §ang KiÕm",sexichlan,{21}},
		{"C«n L«n §ao",sexichlan,{22}},
		{"C«n L«n KiÕm",sexichlan,{23}},
		{"Hoa S¬n KiÕm T«ng",sexichlanhs,{2}},
		{"Hoa S¬n KhÝ T«ng",sexichlanhs,{1}},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sexichlan(nId)
for i = 2515, 2524 do
AddGoldItem(0,10*nId+i-10)
end
end
function sexichlanhs(nId)
for i = 4773, 4782 do
AddGoldItem(0,10*nId+i-10)
end
end
-----SET Minh Phuong----------
function seminhphuongT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",seminhphuong,{1}},
		{"ThiÕu L©m C«n",seminhphuong,{2}},
		{"ThiÕu L©m §ao",seminhphuong,{3}},
		{"Thiªn V­¬ng Chïy",seminhphuong,{4}},
		{"Thiªn V­¬ng Th­¬ng",seminhphuong,{5}},
		{"Thiªn V­¬ng §ao",seminhphuong,{6}},
		{"Nga Mi KiÕm",seminhphuong,{7}},
		{"Nga Mi Ch­ëng",seminhphuong,{8}},
		{"Thóy Yªn §¬n §ao",seminhphuong,{9}},
		{"Thóy Yªn Song §ao",seminhphuong,{10}},
		{"Ngò §éc Ch­ëng Ph¸p",seminhphuong,{11}},
		{"Ngò §éc §ao Ph¸p",seminhphuong,{12}},
		{"Trang KÕ",seminhphuongT2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function seminhphuongT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",seminhphuong,{13}},
		{"§­êng M«n Tô TiÔn",seminhphuong,{14}},
		{"§­êng M«n Phi Tiªu",seminhphuong,{15}},
		{"C¸i Bang Rång",seminhphuong,{16}},
		{"C¸i Bang C«n Ph¸p",seminhphuong,{17}},
		{"Thiªn NhÉn KÝch",seminhphuong,{18}},
		{"Thiªn NhÉn §ao",seminhphuong,{19}},
		{"Vâ §ang KhÝ",seminhphuong,{20}},
		{"Vâ §ang KiÕm",seminhphuong,{21}},
		{"C«n L«n §ao",seminhphuong,{22}},
		{"C«n L«n KiÕm",seminhphuong,{23}},
		{"Hoa S¬n KiÕm T«ng",seminhphuonghs,{2}},
		{"Hoa S¬n KhÝ T«ng",seminhphuonghs,{1}},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function seminhphuong(nId)
for i = 2745, 2754 do
AddGoldItem(0,10*nId+i-10)
end
end
function seminhphuonghs(nId)
for i = 4793, 4802 do
AddGoldItem(0,10*nId+i-10)
end
end
-----SET Dang Long----------
function sedanglongT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",sedanglong,{1}},
		{"ThiÕu L©m C«n",sedanglong,{2}},
		{"ThiÕu L©m §ao",sedanglong,{3}},
		{"Thiªn V­¬ng Chïy",sedanglong,{4}},
		{"Thiªn V­¬ng Th­¬ng",sedanglong,{5}},
		{"Thiªn V­¬ng §ao",sedanglong,{6}},
		{"Nga Mi KiÕm",sedanglong,{7}},
		{"Nga Mi Ch­ëng",sedanglong,{8}},
		{"Thóy Yªn §¬n §ao",sedanglong,{9}},
		{"Thóy Yªn Song §ao",sedanglong,{10}},
		{"Ngò §éc Ch­ëng Ph¸p",sedanglong,{11}},
		{"Ngò §éc §ao Ph¸p",sedanglong,{12}},
		{"Trang KÕ",sedanglongT2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sedanglongT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",sedanglong,{13}},
		{"§­êng M«n Tô TiÔn",sedanglong,{14}},
		{"§­êng M«n Phi Tiªu",sedanglong,{15}},
		{"C¸i Bang Rång",sedanglong,{16}},
		{"C¸i Bang C«n Ph¸p",sedanglong,{17}},
		{"Thiªn NhÉn KÝch",sedanglong,{18}},
		{"Thiªn NhÉn §ao",sedanglong,{19}},
		{"Vâ §ang KhÝ",sedanglong,{20}},
		{"Vâ §ang KiÕm",sedanglong,{21}},
		{"C«n L«n §ao",sedanglong,{22}},
		{"C«n L«n KiÕm",sedanglong,{23}},
		{"Hoa S¬n KiÕm T«ng",sedanglonghs,{1}},
		{"Hoa S¬n KhÝ T«ng",sedanglonghs,{2}},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sedanglong(nId)
for i = 2975, 2984 do
AddGoldItem(0,10*nId+i-10)
end
end
function sedanglonghs(nId)
for i = 4813, 4822 do
AddGoldItem(0,10*nId+i-10)
end
end
-----SET Tinh Suong----------
function setinhsuongT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",setinhsuong,{1}},
		{"ThiÕu L©m C«n",setinhsuong,{2}},
		{"ThiÕu L©m §ao",setinhsuong,{3}},
		{"Thiªn V­¬ng Chïy",setinhsuong,{4}},
		{"Thiªn V­¬ng Th­¬ng",setinhsuong,{5}},
		{"Thiªn V­¬ng §ao",setinhsuong,{6}},
		{"Nga Mi KiÕm",setinhsuong,{7}},
		{"Nga Mi Ch­ëng",setinhsuong,{8}},
		{"Thóy Yªn §¬n §ao",setinhsuong,{9}},
		{"Thóy Yªn Song §ao",setinhsuong,{10}},
		{"Ngò §éc Ch­ëng Ph¸p",setinhsuong,{11}},
		{"Ngò §éc §ao Ph¸p",setinhsuong,{12}},
		{"Trang KÕ",setinhsuongT2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function setinhsuongT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",setinhsuong,{13}},
		{"§­êng M«n Tô TiÔn",setinhsuong,{14}},
		{"§­êng M«n Phi Tiªu",setinhsuong,{15}},
		{"C¸i Bang Rång",setinhsuong,{16}},
		{"C¸i Bang C«n Ph¸p",setinhsuong,{17}},
		{"Thiªn NhÉn KÝch",setinhsuong,{18}},
		{"Thiªn NhÉn §ao",setinhsuong,{19}},
		{"Vâ §ang KhÝ",setinhsuong,{20}},
		{"Vâ §ang KiÕm",setinhsuong,{21}},
		{"C«n L«n §ao",setinhsuong,{22}},
		{"C«n L«n KiÕm",setinhsuong,{23}},
		{"Hoa S¬n KiÕm T«ng",setinhsuonghs,{1}},
		{"Hoa S¬n KhÝ T«ng",setinhsuonghs,{2}},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function setinhsuong(nId)
for i = 5379, 5388 do
AddGoldItem(0,10*nId+i-10)
end
end
function setinhsuonghs(nId)
for i = 5609, 5618 do
AddGoldItem(0,10*nId+i-10)
end
end
------Trang Bi MaxOp-----
function TBCCMAX()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		--{"Trang BÞ Tö M·ng",setumangmaxT1},
		{"Trang BÞ Kim ¤",sekimomaxT1},
		{"Trang BÞ B¹ch Hæ",sebachhomaxT1},
		{"Trang BÞ XÝch L©n",sexichlanmaxT1},
		{"Trang BÞ Minh Ph­îng",seminhphuongmaxT1},
		{"Trang BÞ §»ng Long",sedanglongmaxT1},
		{"Trang BÞ Tinh S­¬ng",setinhsuongmaxT1},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
-----SET KIM O MAX----------
function sekimomaxT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",sekimomax,{1}},
		{"ThiÕu L©m C«n",sekimomax,{2}},
		{"ThiÕu L©m §ao",sekimomax,{3}},
		{"Thiªn V­¬ng Chïy",sekimomax,{4}},
		{"Thiªn V­¬ng Th­¬ng",sekimomax,{5}},
		{"Thiªn V­¬ng §ao",sekimomax,{6}},
		{"Nga Mi KiÕm",sekimomax,{7}},
		{"Nga Mi Ch­ëng",sekimomax,{8}},
		{"Thóy Yªn §¬n §ao",sekimomax,{9}},
		{"Thóy Yªn Song §ao",sekimomax,{10}},
		{"Ngò §éc Ch­ëng Ph¸p",sekimomax,{11}},
		{"Ngò §éc §ao Ph¸p",sekimomax,{12}},
		{"Trang KÕ",sekimomaxT2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sekimomaxT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",sekimomax,{13}},
		{"§­êng M«n Tô TiÔn",sekimomax,{14}},
		{"§­êng M«n Phi Tiªu",sekimomax,{15}},
		{"C¸i Bang Rång",sekimomax,{16}},
		{"C¸i Bang C«n Ph¸p",sekimomax,{17}},
		{"Thiªn NhÉn KÝch",sekimomax,{18}},
		{"Thiªn NhÉn §ao",sekimomax,{19}},
		{"Vâ §ang KhÝ",sekimomax,{20}},
		{"Vâ §ang KiÕm",sekimomax,{21}},
		{"C«n L«n §ao",sekimomax,{22}},
		{"C«n L«n KiÕm",sekimomax,{23}},
		{"Hoa S¬n KiÕm T«ng",sekimohsmax,{1}},
		{"Hoa S¬n KhÝ T«ng",sekimohsmax,{2}},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sekimomax(nId)
for i = 3235, 3244 do
AddGoldItem(0,10*nId+i-10)
end
end
-----SET BACH HO MAX----------
function sebachhomaxT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",sebachhomax,{1}},
		{"ThiÕu L©m C«n",sebachhomax,{2}},
		{"ThiÕu L©m §ao",sebachhomax,{3}},
		{"Thiªn V­¬ng Chïy",sebachhomax,{4}},
		{"Thiªn V­¬ng Th­¬ng",sebachhomax,{5}},
		{"Thiªn V­¬ng §ao",sebachhomax,{6}},
		{"Nga Mi KiÕm",sebachhomax,{7}},
		{"Nga Mi Ch­ëng",sebachhomax,{8}},
		{"Thóy Yªn §¬n §ao",sebachhomax,{9}},
		{"Thóy Yªn Song §ao",sebachhomax,{10}},
		{"Ngò §éc Ch­ëng Ph¸p",sebachhomax,{11}},
		{"Ngò §éc §ao Ph¸p",sebachhomax,{12}},
		{"Trang KÕ",sebachhomaxT2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sebachhomaxT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",sebachhomax,{13}},
		{"§­êng M«n Tô TiÔn",sebachhomax,{14}},
		{"§­êng M«n Phi Tiªu",sebachhomax,{15}},
		{"C¸i Bang Rång",sebachhomax,{16}},
		{"C¸i Bang C«n Ph¸p",sebachhomax,{17}},
		{"Thiªn NhÉn KÝch",sebachhomax,{18}},
		{"Thiªn NhÉn §ao",sebachhomax,{19}},
		{"Vâ §ang KhÝ",sebachhomax,{20}},
		{"Vâ §ang KiÕm",sebachhomax,{21}},
		{"C«n L«n §ao",sebachhomax,{22}},
		{"C«n L«n KiÕm",sebachhomax,{23}},
		{"Hoa S¬n KiÕm T«ng",sebachhohsmax,{2}},
		{"Hoa S¬n KhÝ T«ng",sebachhohsmax,{1}},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sebachhomax(nId)
for i = 3895, 3904 do
AddGoldItem(0,10*nId+i-10)
end
end
function sebachhohsmax(nId)
for i = 6129, 6138 do
AddGoldItem(0,10*nId+i-10)
end
end
-----SET XICH LAN MAX----------
function sexichlanmaxT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",sexichlanmax,{1}},
		{"ThiÕu L©m C«n",sexichlanmax,{2}},
		{"ThiÕu L©m §ao",sexichlanmax,{3}},
		{"Thiªn V­¬ng Chïy",sexichlanmax,{4}},
		{"Thiªn V­¬ng Th­¬ng",sexichlanmax,{5}},
		{"Thiªn V­¬ng §ao",sexichlanmax,{6}},
		{"Nga Mi KiÕm",sexichlanmax,{7}},
		{"Nga Mi Ch­ëng",sexichlanmax,{8}},
		{"Thóy Yªn §¬n §ao",sexichlanmax,{9}},
		{"Thóy Yªn Song §ao",sexichlanmax,{10}},
		{"Ngò §éc Ch­ëng Ph¸p",sexichlanmax,{11}},
		{"Ngò §éc §ao Ph¸p",sexichlanmax,{12}},
		{"Trang KÕ",sexichlanmaxT2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sexichlanmaxT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",sexichlanmax,{13}},
		{"§­êng M«n Tô TiÔn",sexichlanmax,{14}},
		{"§­êng M«n Phi Tiªu",sexichlanmax,{15}},
		{"C¸i Bang Rång",sexichlanmax,{16}},
		{"C¸i Bang C«n Ph¸p",sexichlanmax,{17}},
		{"Thiªn NhÉn KÝch",sexichlanmax,{18}},
		{"Thiªn NhÉn §ao",sexichlanmax,{19}},
		{"Vâ §ang KhÝ",sexichlanmax,{20}},
		{"Vâ §ang KiÕm",sexichlanmax,{21}},
		{"C«n L«n §ao",sexichlanmax,{22}},
		{"C«n L«n KiÕm",sexichlanmax,{23}},
		{"Hoa S¬n KiÕm T«ng",sexichlanhsmax,{2}},
		{"Hoa S¬n KhÝ T«ng",sexichlanhsmax,{1}},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sexichlanmax(nId)
for i = 4136, 4145 do
AddGoldItem(0,10*nId+i-10)
end
end
function sexichlanhsmax(nId)
for i = 6149, 6158 do
AddGoldItem(0,10*nId+i-10)
end
end
-----SET MINH PHUONG MAX----------
function seminhphuongmaxT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",seminhphuongmax,{1}},
		{"ThiÕu L©m C«n",seminhphuongmax,{2}},
		{"ThiÕu L©m §ao",seminhphuongmax,{3}},
		{"Thiªn V­¬ng Chïy",seminhphuongmax,{4}},
		{"Thiªn V­¬ng Th­¬ng",seminhphuongmax,{5}},
		{"Thiªn V­¬ng §ao",seminhphuongmax,{6}},
		{"Nga Mi KiÕm",seminhphuongmax,{7}},
		{"Nga Mi Ch­ëng",seminhphuongmax,{8}},
		{"Thóy Yªn §¬n §ao",seminhphuongmax,{9}},
		{"Thóy Yªn Song §ao",seminhphuongmax,{10}},
		{"Ngò §éc Ch­ëng Ph¸p",seminhphuongmax,{11}},
		{"Ngò §éc §ao Ph¸p",seminhphuongmax,{12}},
		{"Trang KÕ",seminhphuongmaxT2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function seminhphuongmaxT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",seminhphuongmax,{13}},
		{"§­êng M«n Tô TiÔn",seminhphuongmax,{14}},
		{"§­êng M«n Phi Tiªu",seminhphuongmax,{15}},
		{"C¸i Bang Rång",seminhphuongmax,{16}},
		{"C¸i Bang C«n Ph¸p",seminhphuongmax,{17}},
		{"Thiªn NhÉn KÝch",seminhphuongmax,{18}},
		{"Thiªn NhÉn §ao",seminhphuongmax,{19}},
		{"Vâ §ang KhÝ",seminhphuongmax,{20}},
		{"Vâ §ang KiÕm",seminhphuongmax,{21}},
		{"C«n L«n §ao",seminhphuongmax,{22}},
		{"C«n L«n KiÕm",seminhphuongmax,{23}},
		{"Hoa S¬n KiÕm T«ng",seminhphuonghsmax,{2}},
		{"Hoa S¬n KhÝ T«ng",seminhphuonghsmax,{1}},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function seminhphuongmax(nId)
for i = 4863, 4872 do
AddGoldItem(0,10*nId+i-10)
end
end
function seminhphuonghsmax(nId)
for i = 5290, 5299 do
AddGoldItem(0,10*nId+i-10)
end
end
-----SET DANG LONG MAX----------
function sedanglongmaxT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",sedanglongmax,{1}},
		{"ThiÕu L©m C«n",sedanglongmax,{2}},
		{"ThiÕu L©m §ao",sedanglongmax,{3}},
		{"Thiªn V­¬ng Chïy",sedanglongmax,{4}},
		{"Thiªn V­¬ng Th­¬ng",sedanglongmax,{5}},
		{"Thiªn V­¬ng §ao",sedanglongmax,{6}},
		{"Nga Mi KiÕm",sedanglongmax,{7}},
		{"Nga Mi Ch­ëng",sedanglongmax,{8}},
		{"Thóy Yªn §¬n §ao",sedanglongmax,{9}},
		{"Thóy Yªn Song §ao",sedanglongmax,{10}},
		{"Ngò §éc Ch­ëng Ph¸p",sedanglongmax,{11}},
		{"Ngò §éc §ao Ph¸p",sedanglongmax,{12}},
		{"Trang KÕ",sedanglongmaxT2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sedanglongmaxT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",sedanglongmax,{13}},
		{"§­êng M«n Tô TiÔn",sedanglongmax,{14}},
		{"§­êng M«n Phi Tiªu",sedanglongmax,{15}},
		{"C¸i Bang Rång",sedanglongmax,{16}},
		{"C¸i Bang C«n Ph¸p",sedanglongmax,{17}},
		{"Thiªn NhÉn KÝch",sedanglongmax,{18}},
		{"Thiªn NhÉn §ao",sedanglongmax,{19}},
		{"Vâ §ang KhÝ",sedanglongmax,{20}},
		{"Vâ §ang KiÕm",sedanglongmax,{21}},
		{"C«n L«n §ao",sedanglongmax,{22}},
		{"C«n L«n KiÕm",sedanglongmax,{23}},
		{"Hoa S¬n KiÕm T«ng",sedanglonghsmax,{1}},
		{"Hoa S¬n KhÝ T«ng",sedanglonghsmax,{2}},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function sedanglongmax(nId)
for i = 5629, 5638 do
AddGoldItem(0,10*nId+i-10)
end
end
-----SET TINH SUONG MAX----------
function setinhsuongmaxT1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",setinhsuongmax,{1}},
		{"ThiÕu L©m C«n",setinhsuongmax,{2}},
		{"ThiÕu L©m §ao",setinhsuongmax,{3}},
		{"Thiªn V­¬ng Chïy",setinhsuongmax,{4}},
		{"Thiªn V­¬ng Th­¬ng",setinhsuongmax,{5}},
		{"Thiªn V­¬ng §ao",setinhsuongmax,{6}},
		{"Nga Mi KiÕm",setinhsuongmax,{7}},
		{"Nga Mi Ch­ëng",setinhsuongmax,{8}},
		{"Thóy Yªn §¬n §ao",setinhsuongmax,{9}},
		{"Thóy Yªn Song §ao",setinhsuongmax,{10}},
		{"Ngò §éc Ch­ëng Ph¸p",setinhsuongmax,{11}},
		{"Ngò §éc §ao Ph¸p",setinhsuongmax,{12}},
		{"Trang KÕ",setinhsuongmaxT2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function setinhsuongmaxT2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",setinhsuongmax,{13}},
		{"§­êng M«n Tô TiÔn",setinhsuongmax,{14}},
		{"§­êng M«n Phi Tiªu",setinhsuongmax,{15}},
		{"C¸i Bang Rång",setinhsuongmax,{16}},
		{"C¸i Bang C«n Ph¸p",setinhsuongmax,{17}},
		{"Thiªn NhÉn KÝch",setinhsuongmax,{18}},
		{"Thiªn NhÉn §ao",setinhsuongmax,{19}},
		{"Vâ §ang KhÝ",setinhsuongmax,{20}},
		{"Vâ §ang KiÕm",setinhsuongmax,{21}},
		{"C«n L«n §ao",setinhsuongmax,{22}},
		{"C«n L«n KiÕm",setinhsuongmax,{23}},
		{"Hoa S¬n KiÕm T«ng",setinhsuongmax,{24}},
		{"Hoa S¬n KhÝ T«ng",setinhsuongmax,{25}},
		{"Trë L¹i",setinhsuongmaxT1},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function setinhsuongmax(nId)
for i = 5879, 5888 do
AddGoldItem(0,10*nId+i-10)
end
end
-------Trang BÞ HiÕm-------------
function TBHiem()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Long T­¬ng Chi L©n",longtuong},
		{"H¾c ThÇn",hacthan},
		{"Vò LiÖt",vuliet},
		{"Huynh §Ö",huynhde},
		{"§éng S¸t",dongsat},
		{"Cè S¬n",coson},
		{"NhÉn §éc C«",docco},
		{"NhÉn Set Cæ Th¸p",cothap},
		{"Th­¬ng Khung",unknow},
		{"Admin PGaming",pgaming},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
---------C¸c Trang BÞ Long T­¬ng-H¾c ThÇn---§éng S¸t--Vò LiÖt--------------------------
function cothap()
for i=5360,5363 do
AddGoldItem(0, i)
end
end


function longtuong()
for i=5219,5227 do
AddGoldItem(0, i)
end
end

function docco()
for i=4134,4135 do
AddGoldItem(0, i)
end
end

function hacthan()
for i=4838,4842 do
AddGoldItem(0, i)
end
end

function vuliet()
for i=5208,5212 do
AddGoldItem(0, i)
end
end

function huynhde()
AddGoldItem(0, 4436)
AddGoldItem(0, 4481)
end

function dongsat()
for i=494,497 do
AddGoldItem(0, i)
end
end 

function unknow()
for i=5198,5202 do
AddGoldItem(0, i)
end
end

function pgaming()
for i=5203,5207 do
AddGoldItem(0, i)
end
end

function coson()
AddGoldItem(0, 4129)
AddGoldItem(0, 4133)
AddGoldItem(0, 4441)
AddGoldItem(0, 4445)
AddGoldItem(0, 4449)
AddGoldItem(0, 4453)
AddGoldItem(0, 4457)
AddGoldItem(0, 4461)
AddGoldItem(0, 4465)
AddGoldItem(0, 4469)
end
-------Ên Phi Phong-------------
function anphiphong()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Ên",an},
		{"Phi Phong",phiphong},
		{"Trang Søc",trangsuc},
		{"Hång ¶nh",honganh},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
---Ên------
function an()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{	
		{"T©n NhËm Hµnh Ên Gi¸m (HË)",anha1},
		{"T©n NhËm Hµnh Ên Gi¸m (Trung)",antrung1},
		{"T©n NhËm Hµnh Ên Gi¸m (Th­îng)",anthuong1},
		{"C­êng Hãa",cuonghoa},
		{"Nh­îc Hãa",nhuochoa},
		{"C­êng Hãa vµ Nh­îc Hãa",cuonghoanhuochoa},
		{"Trë L¹i",anphiphong},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function cuonghoa()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Hoµng Kim Ên (C­êng hãa) 1",nguhanhan,{1}},
		{"Hoµng Kim Ên (C­êng hãa) 2",nguhanhan,{2}},
		{"Hoµng Kim Ên (C­êng hãa) 3",nguhanhan,{3}},
		{"Hoµng Kim Ên (C­êng hãa) 4",nguhanhan,{4}},
		{"Hoµng Kim Ên (C­êng hãa) 5",nguhanhan,{5}},
		{"Hoµng Kim Ên (C­êng hãa) 6",nguhanhan,{6}},
		{"Hoµng Kim Ên (C­êng hãa) 7",nguhanhan,{7}},
		{"Hoµng Kim Ên (C­êng hãa) 8",nguhanhan,{8}},
		{"Hoµng Kim Ên (C­êng hãa) 9",nguhanhan,{9}},
		{"Hoµng Kim Ên (C­êng hãa) 10",nguhanhan,{10}},
		{"Trë L¹i",an},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function nhuochoa()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Hoµng Kim Ên (Nh­îc hãa) 1",nguhanhan,{11}},
		{"Hoµng Kim Ên (Nh­îc hãa) 2",nguhanhan,{12}},
		{"Hoµng Kim Ên (Nh­îc hãa) 3",nguhanhan,{13}},
		{"Hoµng Kim Ên (Nh­îc hãa) 4",nguhanhan,{14}},
		{"Hoµng Kim Ên (Nh­îc hãa) 5",nguhanhan,{15}},
		{"Hoµng Kim Ên (Nh­îc hãa) 6",nguhanhan,{16}},
		{"Hoµng Kim Ên (Nh­îc hãa) 7",nguhanhan,{17}},
		{"Hoµng Kim Ên (Nh­îc hãa) 8",nguhanhan,{18}},
		{"Hoµng Kim Ên (Nh­îc hãa) 9",nguhanhan,{19}},
		{"Hoµng Kim Ên (Nh­îc hãa) 10",nguhanhan,{20}},
		{"Trë L¹i",an},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function cuonghoanhuochoa()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Ngò Hµnh Ên 1",nguhanhan,{21}},
		{"Ngò Hµnh Ên 2",nguhanhan,{22}},
		{"Ngò Hµnh Ên 3",nguhanhan,{23}},
		{"Ngò Hµnh Ên 4",nguhanhan,{24}},
		{"Ngò Hµnh Ên 5",nguhanhan,{25}},
		{"Ngò Hµnh Ên 6",nguhanhan,{26}},
		{"Ngò Hµnh Ên 7",nguhanhan,{27}},
		{"Ngò Hµnh Ên 8",nguhanhan,{28}},
		{"Ngò Hµnh Ên 9",nguhanhan,{29}},
		{"Ngò Hµnh Ên 10",nguhanhan,{30}},
		{"Trë L¹i",an},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function nguhanhan(nId)
for i = 3205, 3205 do
AddGoldItem(0,1*nId+i-1)
end
end
---Phi Phong------
function phiphong()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Phi Phong CÊp ThÊp",phiphong1},
		{"Phi Phong PhÖ Quang",phiphongphequang},
		{"Phi Phong KhÊp ThÇn",phiphongkhapthan},
		{"Phi Phong K×nh Thiªn",phiphongkinhthien},
		{"Phi Phong V« Cùc",phiphongvocuc},
		{"Phi Phong Cao CÊp",phiphongcaocap},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end


function anha1()
AddGoldItem(0, 5930)
end

function antrung1()
AddGoldItem(0, 5931)
end

function anthuong1()
AddGoldItem(0, 5932)
end


function phiphong1()
for i=3465,3475 do
AddGoldItem(0, i)
end
end
function phiphongphequang()
for i=3476,3478 do
AddGoldItem(0, i)
end
end
function phiphongkhapthan()
for i=3479,3481 do
AddGoldItem(0, i)
end
end
function phiphongkinhthien()
for i=3482,3484 do
AddGoldItem(0, i)
end
end
function phiphongvocuc()
for i=3485,3487 do
AddGoldItem(0, i)
end
end
function phiphongcaocap()
for i=3488,3490 do
AddGoldItem(0, i)
end
end
-----Trang Søc------------
function trangsuc()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Long ChuÕn Vu D·",longchien},
		{"Trang Søc 1",trangsuc1},
		{"Trang Søc 2",trangsuc2},
		{"Long §¶m",longdam},
		{"Cuång Lan",cuonglan},
		{"Trë L¹i",anphiphong},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function longchien()
AddGoldItem(0, 5657)
end

function trangsuc1()
for i=3542,3554 do
AddGoldItem(0, i)
end
for i=3491,3506 do
AddGoldItem(0, i)
end
end
function trangsuc2()
AddGoldItem(0,3506)
AddGoldItem(0,3880)
AddGoldItem(0,3881)
AddGoldItem(0,3882)
AddGoldItem(0,3883)
AddGoldItem(0,3884)
AddGoldItem(0,3885)
AddGoldItem(0,3886)
AddGoldItem(0,3887)
AddGoldItem(0,3888)
end
function longdam()
for i=4483,4487 do
AddGoldItem(0, i)
end
end
function cuonglan()
for i=4488,4492 do
AddGoldItem(0, i)
end
end
---Hång ¶nh------
function honganh()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Hång ¶nh Th­êng",honganh1},
		{"Hång ¶nh Hoµng Mü",honganh2},
		{"Trë L¹i",anphiphong},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function honganh1()
for i=204,207 do
AddGoldItem(0, i)
end
end
function honganh2()
for i=434,437 do
AddGoldItem(0, i)
end
end
-----Ngùa------------
function nhanngua()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Ngùa Nhãm 1",vip1},
		{"Ngùa Nhãm 2",vip2},
		{"Ngùa Nhãm 3",vip3},
		{"Ngùa Nhãm 4",vip4},
		{"Ngùa Nhãm 5",vip5},
		{"Ngùa Nhãm 6",vip6},
		{"Ng©n Gi¸p HuyÒn TruÖ",huyentrue},
		{"Trë L¹i",trangbi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function huyentrue()
AddGoldItem(0, 6264)
end



function vip1()
AddItem(0,10,6,10,0,0,0)
AddItem(0,10,7,10,0,0,0)
AddItem(0,10,8,10,0,0,0)
AddItem(0,10,9,10,0,0,0)
AddItem(0,10,10,10,0,0,0)
AddItem(0,10,33,10,0,0,0)

end
function vip2()
AddItem(0,10,11,10,0,0,0)
AddItem(0,10,12,10,0,0,0)
AddItem(0,10,13,10,0,0,0)
AddItem(0,10,14,10,0,0,0)
AddItem(0,10,15,10,0,0,0)

end
function vip3()
AddItem(0,10,16,10,0,0,0)
AddItem(0,10,17,10,0,0,0)
AddItem(0,10,18,10,0,0,0)
AddItem(0,10,19,10,0,0,0)
AddItem(0,10,20,10,0,0,0)

end
function vip4()
--AddItem(0,10,21,10,0,0,0)
AddItem(0,10,22,10,0,0,0)
AddItem(0,10,23,10,0,0,0)
AddItem(0,10,24,10,0,0,0)
AddItem(0,10,25,10,0,0,0)
end
function vip5()
for i=5093,5097 do
AddGoldItem(0, i)
end
end
function vip6()
AddGoldItem(0, 4480)
AddGoldItem(0, 4366)
AddGoldItem(0, 3879)
AddGoldItem(0, 5933)
AddGoldItem(0, 6263)
AddGoldItem(0, 6262)
end

------NhËn VËt PhÈm-----------
function NhanVatPham()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
	--	{"VËt PhÈm Trïng Sinh",trungsinh},
	--	{"NhËn 50 item",TaoItem2},
	--	{"NhËn 100 item",TaoItem3},
		{"Nguyªn LiÖu ChÕ T¹o §å TÝm",epdotim},
	--	{"VËt PhÈm Kh¸c",vatphamkhac},
	--	{"Trë L¹i",main},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end






-----------Trïng Sinh----------------------------------------------------------------------------------------------
local VPTrungSinh =
{
{szName="<B¾c §Èu Tr­êng Sinh ThuËt - C¬ Së Thiªn>", tbProp={6,1,1390,0,0,0}, tbParam={60}},
{szName="<B¾c §Èu Tr­êng Sinh ThuËt - §¹i Thõa T©m Ph¸p>", tbProp={6,1,2974,0,0,0}, tbParam={60}},
--{szName="TÝch LÞch §¬n", tbProp={6,1,2973,0,0,0}},
{szName="B¾c §Èu TÈy Tñy §¬n", tbProp={6,1,30127,0,0,0}, tbParam={60}},
}
function trungsinh()
local szTitle = LENHBAI_ADMIN.."<#>Xin chµo <color=red>"..GetName().."<color>. Xin mêi chän VËt PhÈm cÇn sö dông.\n\nHiÖn t¹i cã <color=red>"..GetPlayerCount().." <color>ng­êi ch¬i ®ang trùc tuyÕn.<color>"
local tbOpt = {}
local nCount = getn(%VPTrungSinh)
local szOption = ""
for i=1, nCount do
szOption = format("NhËn %s", %VPTrungSinh[i].szName)
tinsert(tbOpt, {szOption, get_itemTS, {i}})
end
tinsert(tbOpt, {"TÝch LÞch §¬n", tichlichdon})
tinsert(tbOpt, {"Trë VÒ", NhanVatPham})
tinsert(tbOpt, {"Tho¸t"})
CreateNewSayEx(szTitle, tbOpt)
end
function get_itemTS(nIndex)
local nMaxCount = CalcFreeItemCellCount()
g_AskClientNumberEx(0, nMaxCount, "NhËp Sè L­îng:", {get_item_TS, {nIndex}})
end
function get_item_TS(nIndex, nCount)
if nCount <= 0 then
return
end
if CalcFreeItemCellCount() < nCount then
Talk(1, "", format("Hµnh trang cÇn Ýt nhÊt <color=yellow>%d<color> « trèng", nCount))
return
end
local szLogTitle = format("[liguan]get_free_item_%s", %VPTrungSinh[nIndex].szName)
tbAwardTemplet:GiveAwardByList(%VPTrungSinh[nIndex], szLogTitle, nCount)
end
function tichlichdon()
for i =1,999 do
AddItem(6,1,2973,0,0,0)
end
end
-----------Ðp ®å tÝm----------------------------------------------------------------------------------------------
function epdotim()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"HuyÒn Tinh",HuyenTinh},
		{"Thñy Tinh",ThuyTinh},
		{"Phóc Duyªn",PhucDuyen},
		{"Kho¸ng Th¹ch ChÕ T¹o",khoangthach},
		{"Manh Thiªn Th¹ch",manhthienthach},
		{"Trë L¹i",NhanVatPham},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
-----------HuyÒn Tinh----------------------------------------------------------------------------------------------
local NhanHuyenTinh =
{
{szName="HuyÒn Tinh CÊp 1", tbProp={6,1,147,1,0,0,0}, tbParam={60}},
{szName="HuyÒn Tinh CÊp 2", tbProp={6,1,147,2,0,0,0}, tbParam={60}},
{szName="HuyÒn Tinh CÊp 3", tbProp={6,1,147,3,0,0,0}, tbParam={60}},
{szName="HuyÒn Tinh CÊp 4", tbProp={6,1,147,4,0,0,0}, tbParam={60}},
{szName="HuyÒn Tinh CÊp 5", tbProp={6,1,147,5,0,0,0}, tbParam={60}},
{szName="HuyÒn Tinh CÊp 6", tbProp={6,1,147,6,0,0,0}, tbParam={60}},
{szName="HuyÒn Tinh CÊp 7", tbProp={6,1,147,7,0,0,0}, tbParam={60}},
{szName="HuyÒn Tinh CÊp 8", tbProp={6,1,147,8,0,0,0}, tbParam={60}},
{szName="HuyÒn Tinh CÊp 9", tbProp={6,1,147,9,0,0,0}, tbParam={60}},
{szName="HuyÒn Tinh CÊp 10", tbProp={6,1,147,10,0,0,0}, tbParam={60}},
}
function HuyenTinh()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt = {}
local nCount = getn(%NhanHuyenTinh)
local szOption = ""
for i=1, nCount do
szOption = format("NhËn %s", %NhanHuyenTinh[i].szName)
tinsert(tbOpt, {szOption, get_itemHT, {i}})
end
tinsert(tbOpt, {"Trë VÒ", NhanVatPham})
tinsert(tbOpt, {"Tho¸t"})
CreateNewSayEx(szTitle, tbOpt)
end
function get_itemHT(nIndex)
local nMaxCount = CalcFreeItemCellCount()
g_AskClientNumberEx(0, nMaxCount, "NhËp Sè L­îng:", {get_item_HT, {nIndex}})
end
function get_item_HT(nIndex, nCount)
if nCount <= 0 then
return
end
if CalcFreeItemCellCount() < nCount then
Talk(1, "", format("Hµnh trang cÇn Ýt nhÊt <color=yellow>%d<color> « trèng", nCount))
return
end
local szLogTitle = format("[liguan]get_free_item_%s", %NhanHuyenTinh[nIndex].szName)
tbAwardTemplet:GiveAwardByList(%NhanHuyenTinh[nIndex], szLogTitle, nCount)
end
-----Thuy Tinh---------
local NhanThuyTinh =
{
{szName="Tö Thñy Tinh", tbProp={4,239,1,1,0,0}, tbParam={60}},
{szName="Lam Thñy Tinh", tbProp={4,238,1,1,0,0}, tbParam={60}},
{szName="Lôc Thñy Tinh", tbProp={4,240,1,1,0,0}, tbParam={60}},
}
function ThuyTinh()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt = {}
local nCount = getn(%NhanThuyTinh)
local szOption = ""
for i=1, nCount do
szOption = format("NhËn %s", %NhanThuyTinh[i].szName)
tinsert(tbOpt, {szOption, get_itemTT, {i}})
end
tinsert(tbOpt, {"Trë VÒ", NhanVatPham})
tinsert(tbOpt, {"Tho¸t"})
CreateNewSayEx(szTitle, tbOpt)
end
function get_itemTT(nIndex)
local nMaxCount = CalcFreeItemCellCount()
g_AskClientNumberEx(0, nMaxCount, "NhËp Sè L­îng:", {get_item_TT, {nIndex}})
end
function get_item_TT(nIndex, nCount)
if nCount <= 0 then
return
end
if CalcFreeItemCellCount() < nCount then
Talk(1, "", format("Hµnh trang cÇn Ýt nhÊt <color=yellow>%d<color> « trèng", nCount))
return
end
local szLogTitle = format("[liguan]get_free_item_%s", %NhanThuyTinh[nIndex].szName)
tbAwardTemplet:GiveAwardByList(%NhanThuyTinh[nIndex], szLogTitle, nCount)
end
-----Phuc Duyen---------
local NhanPhucDuyen =
{
{szName="Phóc Duyªn TiÓu", tbProp={6,1,122,1,0,0,0}, tbParam={60}},
{szName="Phóc Duyªn Trung", tbProp={6,1,123,1,0,0,0}, tbParam={60}},
{szName="Phóc Duyªn §¹i", tbProp={6,1,124,1,0,0,0}, tbParam={60}},
}
function PhucDuyen()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt = {}
local nCount = getn(%NhanPhucDuyen)
local szOption = ""
for i=1, nCount do
szOption = format("NhËn %s", %NhanPhucDuyen[i].szName)
tinsert(tbOpt, {szOption, get_itemPD, {i}})
end
tinsert(tbOpt, {"Trë VÒ", NhanVatPham})
tinsert(tbOpt, {"Tho¸t"})
CreateNewSayEx(szTitle, tbOpt)
end
function get_itemPD(nIndex)
local nMaxCount = CalcFreeItemCellCount()
g_AskClientNumberEx(0, nMaxCount, "NhËp Sè L­îng:", {get_item_PD, {nIndex}})
end
function get_item_PD(nIndex, nCount)
if nCount <= 0 then
return
end
if CalcFreeItemCellCount() < nCount then
Talk(1, "", format("Hµnh trang cÇn Ýt nhÊt <color=yellow>%d<color> « trèng", nCount))
return
end
local szLogTitle = format("[liguan]get_free_item_%s", %NhanPhucDuyen[nIndex].szName)
tbAwardTemplet:GiveAwardByList(%NhanPhucDuyen[nIndex], szLogTitle, nCount)
end
-----Kho¸ng Th¹ch---------
function khoangthach()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Trang Phôc HÖ Kim",hekim},
		{"Trang Phôc HÖ Méc",hemoc},
		{"Trang Phôc HÖ Thñy",hethuy},
		{"Trang Phôc HÖ Háa",hehoa},
		{"Trang Phôc HÖ Thæ",hetho},
		{"Trë L¹i",epdotim},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function hekim()
AddItem(6,1,149,1,0,0,0) 
AddItem(6,1,150,1,0,0,0) 
AddItem(6,1,151,1,0,0,0) 
AddItem(6,1,152,1,0,0,0) 
AddItem(6,1,153,1,0,0,0) 
AddItem(6,1,154,1,0,0,0)
end
function hemoc()
AddItem(6,1,149,1,0,0,0) 
AddItem(6,1,150,1,1,0,0) 
AddItem(6,1,151,1,0,0,0) 
AddItem(6,1,152,1,1,0,0) 
AddItem(6,1,153,1,0,0,0) 
AddItem(6,1,154,1,1,0,0)
end
function hethuy()
AddItem(6,1,149,1,0,0,0) 
AddItem(6,1,150,1,2,0,0) 
AddItem(6,1,151,1,0,0,0) 
AddItem(6,1,152,1,2,0,0) 
AddItem(6,1,153,1,0,0,0) 
AddItem(6,1,154,1,2,0,0)
end
function hehoa()
AddItem(6,1,149,1,0,0,0) 
AddItem(6,1,150,1,3,0,0) 
AddItem(6,1,151,1,0,0,0) 
AddItem(6,1,152,1,3,0,0) 
AddItem(6,1,153,1,0,0,0) 
AddItem(6,1,154,1,3,0,0)
end
function hetho()
AddItem(6,1,149,1,0,0,0) 
AddItem(6,1,150,1,4,0,0) 
AddItem(6,1,151,1,0,0,0) 
AddItem(6,1,152,1,4,0,0) 
AddItem(6,1,153,1,0,0,0) 
AddItem(6,1,154,1,4,0,0)
end
-----Manh Thien Thach---------
function manhthienthach()
AddEventItem(1317)
AddEventItem(1318) 
AddEventItem(1319)
AddEventItem(1320)
AddEventItem(1321)
AddEventItem(1322)
AddEventItem(1323)
AddEventItem(1324)
AddEventItem(1325)
end
----VP KHAC------------
local VPKHAC =
{
{szName="Håi Thiªn T¸i T¹o LÔ Bao", tbProp={6,1,1781,0,0,0}, tbParam={60}},
{szName="Khiªu ChiÕn LÖnh.", tbProp={6,1,1499,0,0,0}},
{szName="Cµn Kh«n Song TuyÖt Béi", tbProp={6,1,2219,0,0,0}},
{szName="Nh¹c V­¬ng KiÕm LÔ Bao", tbProp={6,1,2340,0,0,0}},
{szName="Long HuyÕt Hoµng", tbProp={6,1,2340,0,0,0}},
{szName="Tö MÉu LÖnh", tbProp={6,1,1427,0,0,0}},
{szName="TÝn VËt M«n Ph¸i", tbProp={6,1,1670,0,0,0}},
{szName="TÝn VËt D­¬ng Anh", tbProp={6,1,1671,0,0,0}},
{szName="Hçn Nguyªn Linh Lé", tbProp={6,1,2312,1,0,0}},
{szName="§¹i Lùc Hoµn LÔ Hép", tbProp={6,1,2517,0,0,0}},
{szName="ThËp Toµn §¹i Bæ", tbProp={6,1,1399,0,0,0}},
}
function vatphamkhac()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt = {}
local nCount = getn(%VPKHAC)
local szOption = ""
for i=1, nCount do
szOption = format("NhËn %s", %VPKHAC[i].szName)
tinsert(tbOpt, {szOption, get_itemKhac, {i}})
end
tinsert(tbOpt, {"Trë VÒ", NhanVatPham})
tinsert(tbOpt, {"Tho¸t"})
CreateNewSayEx(szTitle, tbOpt)
end
function get_itemKhac(nIndex)
local nMaxCount = CalcFreeItemCellCount()
g_AskClientNumberEx(0, nMaxCount, "NhËp Sè L­îng:", {get_item_Khac, {nIndex}})
end
function get_item_Khac(nIndex, nCount)
if nCount <= 0 then
return
end
if CalcFreeItemCellCount() < nCount then
Talk(1, "", format("Hµnh trang cÇn Ýt nhÊt <color=yellow>%d<color> « trèng", nCount))
return
end
local szLogTitle = format("[liguan]get_free_item_%s", %VPKHAC[nIndex].szName)
tbAwardTemplet:GiveAwardByList(%VPKHAC[nIndex], szLogTitle, nCount)
end
------NhËn SKILL-----------
function NhanSkill()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{		
		{"Vµo Ph¸i Vµ Häc Skill 180",choose_faction},
		{"LÊy Skill Theo ID", LaySkillID},
		{"§çi Tªn Nh©n VËt", doiten},	
		{"ChuyÓn ®æi ngu hµnh", nguhanh},
		{"TÈy Tñy",clear_attibute_point},
		{"Trë L¹i",main},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
-------------


function doiten()
	AskClientForString("doitennv", "", 1, 100, "Xin nhËp tªn míi");
end
function doitennv(strings)
	RenameRole(strings)
end








function nguhanh()
local szTitle = "<npc>Ng­¬i cÇn g×?"
	local tbOpt =
	{
		{"ChuyÓn ®æi sang n÷ hÖ Kim", nukim},
		{"Chuyªn ®æi sang nam hÖ Thuy", namthuy},
		{"Tho¸t"},
	}

	CreateNewSayEx(szTitle, tbOpt)
end
function nukim()
if GetSex() == 1 then
SetSeries(0)
KickOutSelf()
	else
	Talk(1,"","Ng­¬i lµ Pª §ª µ ?")
end
end

function namthuy()
if GetSex() == 0 then
SetSeries(2)
KickOutSelf()
	else
	Talk(1,"","Vui lßng kiÓm tra l¹i giíi tÝnh")
end
end






function check_faction()
	local szCurFaction = GetFaction()
	if szCurFaction ~= nil and szCurFaction ~= "" then
		return
	end
	return 1
end

function knang150xx()
if check_faction() == 1 then
	Talk(1, "", "Ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn Skill ®­îc.")
	return end

if GetLevel() >= 150 then	
if GetLastFactionNumber() == 0 then  ------thieu lam
--if GetFaction() == "shaolin" then
		for i=1220,1229 do
		DelMagic(i,0)
		end
AddMagic(1055,20)
AddMagic(1056,20)
AddMagic(1057,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña ThiÕu L©m. ")

elseif GetLastFactionNumber() == 1 then --------thien vuong vuong
--elseif GetFaction() == "tianwang" then
AddMagic(1058,20)
AddMagic(1059,20)
AddMagic(1060,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña Thiªn V­¬ng. ")

elseif GetLastFactionNumber() == 2 then ---------duong mon
--elseif GetFaction() == "tangmen" then
		for i=1220,1229 do
		DelMagic(i,0)
		end
AddMagic(1069,20)
AddMagic(1070,20)
AddMagic(1071,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña §­êng M«n. ")

elseif GetLastFactionNumber() == 3 then  ----------ngu doc
--elseif GetFaction() == "wudu" then
		for i=1220,1229 do
		DelMagic(i,0)
		end
AddMagic(1066,20)
AddMagic(1067,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña Ngò §éc.")

elseif GetLastFactionNumber() == 4 then  ----------nga my
--elseif GetFaction() == "emei" then
		for i=1220,1229 do
		DelMagic(i,0)
		end
AddMagic(1061,20)
AddMagic(1062,20)
AddMagic(1114,20)
AddMagic(332,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña Nga My.")

elseif GetFaction() == "cuiyan" then -----thuy yen
		for i=1220,1229 do
		DelMagic(i,0)
		end
AddMagic(1063,20)
AddMagic(1065,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña Thóy Yªn.")

elseif GetLastFactionNumber == 5 then  -------thuy yen
--elseif GetFaction() == "cuiyan" then
		for i=1220,1229 do
		DelMagic(i,0)
		end
AddMagic(1063,20)
AddMagic(1065,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña Thóy Yªn.")

elseif GetLastFactionNumber() == 6 then -----gaibang
--elseif GetFaction() == "gaibang" then
		for i=1220,1229 do
		DelMagic(i,0)
		end
AddMagic(1073,20)
AddMagic(1074,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña C¸i Bang.")

elseif GetLastFactionNumber() == 7 then -----thien nhan
--elseif GetFaction() == "tianren" then
AddMagic(1075,20)
AddMagic(1076,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña Thiªn NhÉn.")

elseif GetLastFactionNumber() == 8 then -------vo dang
--elseif GetFaction() == "wudang" then
		for i=1220,1229 do
		DelMagic(i,0)
		end
AddMagic(1078,20)
AddMagic(1079,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña Vâ §ang.")

elseif GetLastFactionNumber() == 9 then ------con luon
--elseif GetFaction() == "kunlun" then
		for i=1220,1229 do
		DelMagic(i,0)
		end
AddMagic(1080,20)
AddMagic(1081,20)
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña C«n L«n.")

elseif GetLastFactionNumber() == 10 then ------hoa son
--elseif GetFaction() == "kunlun" then
		for i=1220,1229 do
		DelMagic(i,0)
		end
		AddMagic(1364,20) --Skill Hoa son
		AddMagic(1382,20) --Skill Hoa son
		AddMagic(1363,20) --Skill Hoa son --------Skill
		AddMagic(1365,20) --Skill Hoa son
		AddMagic(1370,20) --Skill Hoa son
		AddMagic(1369,20) --Skill Hoa son
		AddMagic(1384,20) --Skill Hoa son
		AddMagic(1368,20) --Skill Hoa son --------Doc Co Cuu Kiem
Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña Hoa S¬n.")
end
else
Talk(1, "", "LuyÖn ®Õn cÊp 150 råi h·y ®Õn t×m ta")
end
Talk(1, "", "Ban khong thuoc bat ky phai nao!")
		-- for i=1220,1229 do
		-- DelMagic(i,0)
		-- end
-- AddMagic(1063,20)
-- AddMagic(1065,20)
-- Talk(1,"","Chóc mõng b¹n ®· häc ®­îc tuyÖt kü 150 cña Thóy Yªn.")
end

SKILL_180 = {1220,1221,1223,1222,1224,1225,1227,1226,1228,1229 } --1235, 138, 
--------------------------------------------------------1296 tang toc do di chuye
local tbEquipFreeCell =
{
{2, 1}, {2, 2}, {1, 1}, {1, 2}, {2, 1},
{2, 3}, {2, 4}, {2, 2}, {1, 2}, {1, 1},
}

function knang180()
local nFaction = GetLastFactionNumber() + 1
if nFaction==0 then
Say("Kh«ng cã m«n ph¸i mµ ®åi nhËn skill thÊt truyÒn, ta kh«ng cã thêi gian ®ïa víi ng­¬i", 0)
return
else
for i=1,10 do
if (nFaction==i) then
if (HaveMagic(SKILL_180[i]) == -1) then
AddMagic(SKILL_180[i],20)
Say("B¹n häc ®­îc kü n¨ng cÊp 180 <color=yellow>"..GetSkillName(SKILL_180[i]), 0)
else
Say("Ng­¬i ®· cã kü n¨ng thÊt truyÒn råi, ®õng tham lam", 0)
return
end
end
end
end
end

----Vµo ph¸i vµ häc skill 150-----
function check_faction()
	local szCurFaction = GetFaction()
	if szCurFaction ~= nil and szCurFaction ~= "" then
		return
	end
	return 1
end

function choose_faction()
	if check_faction() ~= 1 then
		Talk(1, "", "Ng­¬i ®· gia nhËp m«n ph¸i.")
		return
	end
	local nSeries = GetSeries() + 1
	local szTitle = LENHBAI_ADMIN.."<#>Xin chµo <color=red>"..GetName().."<color>. Mét khi gia nhËp m«n ph¸i kh«ng thÓ thay ®æi, h·y suy nghÜ kü"
	local tbOpt = {}
	for i=1, getn(%tbFactionSeries[nSeries]) do
		local nIndex = %tbFactionSeries[nSeries][i]
		tinsert(tbOpt, {%tbFaction[nIndex].szShowName, set_faction, {nIndex}})
	end
	tinsert(tbOpt, {"Trë VÒ", dialog_main})
	tinsert(tbOpt, {"Tho¸t"})
	CreateNewSayEx(szTitle, tbOpt)
end

function set_faction(nIndex)
	local szTitle = format(LENHBAI_ADMIN.."<color=red>"..GetName().."<color> Cã ch¾c ch¾n muèn gia nhËp ph¸i <color=yellow>%s<color> kh«ng?", %tbFaction[nIndex].szShowName)
	local tbOpt =
	{
		{"X¸c nhËn!", do_set_faction, {nIndex}},
		{"Trë VÒ.", choose_faction},
		{"Kªt thóc ®èi tho¹i."},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function do_set_faction(nIndex)
	if check_faction() ~= 1 then
		Talk(1, "", "Ng­¬i ®· gia nhËp m«n ph¸i.")
		return
	end
	local nResult = SetFaction(%tbFaction[nIndex].szFaction)
	if nResult == 0 then
		return
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\gmscript.lua", "AddSkills", %tbFaction[nIndex].nShortFaction, 0)
	for i=1, getn(%tbFaction[nIndex].tbSkill) do--Add Skill 90-120-150-180
		AddMagic(%tbFaction[nIndex].tbSkill[i], 20)
	end
	for i=1, getn(%tbFaction[nIndex].tbRank) do--Add X­ng HiÖu
		SetRank(%tbFaction[nIndex].tbRank[i])
	end
	SetCurCamp(4)----Mµu ch÷ ®á
	SetCamp(4) 
	Talk(1, "KickOutSelf", format("Ng­¬i ®· gia nhËp thµnh c«ng ph¸i <color=yellow>%s", %tbFaction[nIndex].szShowName))
end
------Tay Tuy------------
function clear_attibute_point()
local szTitle = LENHBAI_ADMIN.."<#>Xin chµo <color=red>"..GetName().."<color>. B¹n cÇn tÈy ®iÓm TiÒm N¨ng hay Kü N¨ng?\n\nHiÖn t¹i cã <color=red>"..GetPlayerCount().." <color>ng­êi ch¬i ®ang trùc tuyÕn.<color>"
local tbOpt =
{
{"TÈy §iÓm Kü N¨ng.", do_clear_skill},
{"TÈy §iÓm TiÒm N¨ng.", do_clear_prop},
{"Trë VÒ", NhanSkill},
{"Tho¸t."},
}
CreateNewSayEx(szTitle, tbOpt)
end
function do_clear_skill()
local i = HaveMagic(210) 
local j = HaveMagic(400) 
local n = RollbackSkill() 
local x = 0
if (i ~= -1) then i = 1; x = x + i end 
if (j ~= -1) then x = x + j end
local rollback_point = n - x 
if (rollback_point + GetMagicPoint() < 0) then 
rollback_point = -1 * GetMagicPoint()
end
AddMagicPoint(rollback_point)
if (i ~= -1) then AddMagic(210, i) end 
if (j ~= -1) then AddMagic(400, j) end
Msg2Player("TÈy tñy thµnh c«ng! Ng­¬i cã "..rollback_point.." ®iÓm kü n¨ng ®Ó ph©n phèi l¹i.")
KickOutSelf()
end
function do_clear_prop()
local base_str = {35,20,25,30,20} 
local base_dex = {25,35,25,20,15}
local base_vit = {25,20,25,30,25}
local base_eng = {15,25,25,20,40}
local player_series = GetSeries() + 1

local Utask88 = GetTask(88)
AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88, 1))
AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88, 2))
AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88, 3))
AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88, 4))
end
------Lay Skill Theo ID--------
function LaySkillID()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
{
	{"LÊy Skills", g_AskClientStringEx, {"1200,20", 0, 256, "ID Skill", {AddSkill, {self}} }}, 
	{"Xãa Skills", g_AskClientStringEx, {"1200", 0, 300, "ID Skill", {DelSkill, {self}} }},
	--{"Xãa Skills", skillmoi},
	{"LÊy Danh S¸ch Skills", g_AskClientStringEx, {"1200,1210", 0, 256, "ID Skill", {AddDSSkill, {self}} }}, 
	{"Xãa Danh S¸ch Skills", g_AskClientStringEx, {"1,1500", 0, 256, "ID Skill", {DelDSSkill, {self}} }}, 
	{"Trë VÒ", NhanSkill},
	{"Tho¸t."},
}
CreateNewSayEx(szTitle, tbOpt)
end
function AddDSSkill(szPos)
       local tbPos = lib:Split(szPos, ",")
       local s = tonumber(tbPos[1])
       local e = tonumber(tbPos[2])
      for i=s,e do AddMagic(i,20) end
end 

function skillmoi()
AddMagic(1656,20)
AddMagic(1646,20)
AddMagic(1636,20)
AddMagic(1631,20)
end 

function DelDSSkill(szPos) 
      local tbPos = lib:Split(szPos, ",")
       local s = tonumber(tbPos[1])
       local e = tonumber(tbPos[2])
      for i=s,e do DelMagic(i) end
end 

function AddSkill(szPos)
       local tbPos = lib:Split(szPos, ",")
       local id = tonumber(tbPos[1])
       local cap = tonumber(tbPos[2])
      AddMagic(id,cap)
end

function DelSkill(szPos) 
      local idskill = tonumber(szPos) 
      DelMagic(idskill) 
end
---------Trang Thai--------------
function TrangThai()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"LuyÖn C«ng",luyencong},
		{"ChÝnh Ph¸i",chinhphai},
		{"Trung LËp",trunglap},
		{"Tµ Ph¸i",taphai},
		{"S¸t Thñ",satthu},
		{"Trë L¹i",main},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function luyencong()
SetCurCamp(0)
SetCamp(0)
end
function chinhphai()
SetCurCamp(1)
SetCamp(1)
end
function trunglap()
SetCurCamp(3)
SetCamp(3) 
end
function taphai()
SetCurCamp(2)
SetCamp(2) 
end
function satthu()
SetCurCamp(4)
SetCamp(4) 
end
-------------Tao ITEM-------------------------------------------------------------------
function TaoItem() 
g_AskClientStringEx("6,1,222,0,0,0",1,9000,"NhËp Vµo Item Code:",{TaoItemID}) 
end

function TaoItemID(szItem)
	local szICode = lib:Split(szItem, ",");
	local n = getn(szICode);
	if (n ~= 1) then
	if (n < 6) then Talk(1, "", format("Sai Item Code. ThiÕu tr­êng yªu cÇu <color=yellow>%s<color>",n)); return end
	if (n > 7) then Talk(1, "", format("Sai Item Code. Qu¸ nhiÒu tr­êng d÷ liÖu <color=yellow>%s<color>",n)); return end
	local itclass = tonumber(szICode[1]); 
	local ittype = tonumber(szICode[2]); 
	local itid = tonumber(szICode[3]); 
	local itlv = tonumber(szICode[4]); 
	local itseri = tonumber(szICode[5]); 
	local itluck = tonumber(szICode[6]); 
	local itmagic = tonumber(szICode[7]); 
	if (itlv < 0) then Talk(1, "", format("CÊp ®é man ®å kh«ng ®­îc thÊp qu¸ <color=yellow>%s<color>",itlv)); return end
	if (itlv > 10) then Talk(1, "", format("ChØ hæ trî ®Õn cÊp 10. HiÖn t¹i nhËp vµo <color=yellow>%s<color>",itlv)); return end
	if (itmagic == nil) then itmagic=0; end
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	else
	local EquipId = tonumber(szICode[1]); 
	AddGoldItem(0, EquipId);
	end
end
-------------Tao ITEM 2-------------------------------------------------------------------
function TaoItem2() 
g_AskClientStringEx("6,1,222,0,0,0",1,9000,"NhËp Vµo Item Code:",{TaoItemID2}) 
end

function TaoItemID2(szItem)
	local szICode = lib:Split(szItem, ",");
	local n = getn(szICode);
	if (n ~= 1) then
	if (n < 6) then Talk(1, "", format("Sai Item Code. ThiÕu tr­êng yªu cÇu <color=yellow>%s<color>",n)); return end
	if (n > 7) then Talk(1, "", format("Sai Item Code. Qu¸ nhiÒu tr­êng d÷ liÖu <color=yellow>%s<color>",n)); return end
	local itclass = tonumber(szICode[1]); 
	local ittype = tonumber(szICode[2]); 
	local itid = tonumber(szICode[3]); 
	local itlv = tonumber(szICode[4]); 
	local itseri = tonumber(szICode[5]); 
	local itluck = tonumber(szICode[6]); 
	local itmagic = tonumber(szICode[7]); 
	if (itlv < 0) then Talk(1, "", format("CÊp ®é man ®å kh«ng ®­îc thÊp qu¸ <color=yellow>%s<color>",itlv)); return end
	if (itlv > 10) then Talk(1, "", format("ChØ hæ trî ®Õn cÊp 10. HiÖn t¹i nhËp vµo <color=yellow>%s<color>",itlv)); return end
	if (itmagic == nil) then itmagic=0; end
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	else
	local EquipId = tonumber(szICode[1]); 
	AddGoldItem(0, EquipId);
	end
end
-------------Tao ITEM 3-------------------------------------------------------------------
function TaoItem3() 
g_AskClientStringEx("6,1,222,0,0,0",1,9000,"NhËp Vµo Item Code:",{TaoItemID3}) 
end

function TaoItemID3(szItem)
	local szICode = lib:Split(szItem, ",");
	local n = getn(szICode);
	if (n ~= 1) then
	if (n < 6) then Talk(1, "", format("Sai Item Code. ThiÕu tr­êng yªu cÇu <color=yellow>%s<color>",n)); return end
	if (n > 7) then Talk(1, "", format("Sai Item Code. Qu¸ nhiÒu tr­êng d÷ liÖu <color=yellow>%s<color>",n)); return end
	local itclass = tonumber(szICode[1]); 
	local ittype = tonumber(szICode[2]); 
	local itid = tonumber(szICode[3]); 
	local itlv = tonumber(szICode[4]); 
	local itseri = tonumber(szICode[5]); 
	local itluck = tonumber(szICode[6]); 
	local itmagic = tonumber(szICode[7]); 
	if (itlv < 0) then Talk(1, "", format("CÊp ®é man ®å kh«ng ®­îc thÊp qu¸ <color=yellow>%s<color>",itlv)); return end
	if (itlv > 10) then Talk(1, "", format("ChØ hæ trî ®Õn cÊp 10. HiÖn t¹i nhËp vµo <color=yellow>%s<color>",itlv)); return end
	if (itmagic == nil) then itmagic=0; end
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	else
	local EquipId = tonumber(szICode[1]); 
	AddGoldItem(0, EquipId);
	end
end

-------------Lay Trang BÞ Glodequip------------------------------------------------------------------

function Glodequip() 
g_AskClientStringEx("",1,9000,"NhËp Vµo Glodequip Code:",{TaoItemGlodequip}) 
end
function TaoItemGlodequip(idgq)
AddGoldItem(0, ""..idgq.."")
end

function ItemNomal() 
g_AskClientStringEx("",1,9000,"NhËp Vµo ID Item Code:",{ItemNomal_change}) 
end
function ItemNomal_change(idgq)
AddStackItem(100,6,1, ""..idgq.."",0,0,0)
end


---Ve BLH------------
function GoBLH() 
w,x,y=GetWorldPos() 
if (w~=53) then 
SetFightState(0) 
NewWorld(53,200*8,200*16) 
else 
SetPos(200*8, 200*16) 
end 
Msg2Player("B¹n di chuyÓn vÒ <color=yellow>Ba L¨ng HuyÖn<color> thµnh c«ng."); 
end 

----Vßng S¸ng - Danh HiÖu------
function vongsang(nindex)
Title_AddTitle(nindex, 1, 4302359);
Title_ActiveTitle(nindex);
SetTask(1122, nindex);
end

function nhandanhhieu()
local szTitle = "<npc>Xin chµo <color=yellow>"..GetName().."<color> , xin mêi chän Danh HiÖu...!!!"
local tbOpt =
{
{"Th¸i thó Ph­îng T­êng.", vongsang,{153}},
{"Th¸i thó Thµnh §«.", vongsang,{154}},
{"Th¸i thó §¹i Lý.", vongsang,{155}},
{"Th¸i thó BiÖn Kinh.", vongsang,{156}},
{"Th¸i thó T­¬ng D­¬ng.", vongsang,{157}},
{"Th¸i thó D­¬ng Ch©u.", vongsang,{158}},
{"Th¸i thó L©m An.", vongsang,{159}},
{"Vâ L©m Liªn §Êu Qu¸n Qu©n.", vongsang,{81}},
{"Vâ L©m Liªn §Êu H¹ng 2.", vongsang,{82}},
{"Vâ L©m Liªn §Êu H¹ng 3.", vongsang,{83}},
{"Vâ L©m Liªn §Êu H¹ng 4.", vongsang,{84}},
{"Trang KÕ",danhhieu2},
{"Trë L¹i",nhandanhhieu},
{"Tho¸t"},
}
	CreateNewSayEx(szTitle, tbOpt)
end

function danhhieu2()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
{
{"Vßng S¸ng ADM.", vongsang,{228}},
{"NhÊt §¹i T«ng S­", vongsang,{239}},
{"Phiªu M· §¹i T­íng Qu©n.", vongsang,{185}},
{"Vâ Häc Kú Tµi.", vongsang,{258}},
{"Ngù Long Cuång §ao.", vongsang,{165}},
{"TuyÖt ThÕ Cao Thñ.", vongsang,{240}},
{"Long ThÇn KiÕm.", vongsang,{80}},
{"Th©n Thñ BÊt Phµm.", vongsang,{256}},
{"B¸ Chñ ThÊt Thµnh.", vongsang,{193}},
{"Thiªn H¹ §Ö NhÊt Bang.", vongsang,{142}},
{"Trang KÕ",danhhieu3},
{"Trë L¹i",nhandanhhieu},
{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function danhhieu3()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
{
{"§éc B¸ Thiªn H¹", vongsang,{325}},
{"Uy M·nh V« Song­", vongsang,{326}},
{"Lùc ¸p QuÇn Hïng", vongsang,{327}},
{"Tø TuyÖt chiÕn tr­êng", vongsang,{328}},
{"Ngò TuyÖt chiÕn tr­êng", vongsang,{329}},
{"Lôc TuyÖt chiÕn tr­êng", vongsang,{330}},
{"ThÊt TuyÖt chiÕn tr­êng", vongsang,{331}},
{"B¸t TuyÖt chiÕn tr­êng", vongsang,{332}},
{"Cöu TuyÖt chiÕn tr­êng", vongsang,{333}},
{"ThËp TuyÖt chiÕn tr­êng", vongsang,{334}},
{"Trang KÕ",danhhieu4},
{"Trë L¹i",nhandanhhieu2},
{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function danhhieu4()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
{
{"TriÖu M·nh", vongsang,{408}},
{"Thiªn H¹ V« §Þch", vongsang,{421}},
{"Thiªn H¹ ThËp C­êng", vongsang,{422}},
{"T©n thñ", vongsang,{423}},
{"Vua PK.", vongsang,{229}},
{"§éc C« CÇu B¹i", vongsang,{237}},
{"Long Tranh Hæ ®Êu", vongsang,{236}},
{"Míi nhËp giang hå ", vongsang,{244}},
{"Vâ L©m Minh Chñ", vongsang,{245}},
{"Vâ L©m ChÝ T«n.", vongsang,{238}},
{"Trë L¹i",danhhieu4},
{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end


---------------Má Réng R­¬ng--------------------------------------
function moruong()
OpenStoreBox(1)
OpenStoreBox(2)
OpenStoreBox(3)
AddItem(6,1,1427,90,1,0,0)
end
----------------------NhËn TrÊn Bang Chi B¶o-------------------------------------------------------------
function TBCB()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m",CBTL},
		{"Thiªn V­¬ng",CBTV},
		{"Nga My",CBNM},
		{"Thóy Yªn",CBTY},
		{"Ngò §éc",CBND},
		{"§­êng M«n",CBDM},
		{"C¸i Bang",CBCB},
		{"Thiªn NhÉn",CBTN},
		{"Vâ §ang",CBVD},
		{"C«n L«n",CBCL},
		{"Trë L¹i",TrangBi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function CBTL()

AddGoldItem(0,769)
AddGoldItem(0,771)
AddGoldItem(0,776)
end

function CBTV()
AddGoldItem(0,793)
end

function CBNM()
AddGoldItem(0,796)
AddGoldItem(0,801)
AddGoldItem(0,808)
end

function CBTY()
AddGoldItem(0,811)
AddGoldItem(0,816)
end

function CBND()
AddGoldItem(0,829)
AddGoldItem(0,834)
end

function CBDM()
AddGoldItem(0,843)
AddGoldItem(0,854)
end

function CBCB()
AddGoldItem(0,855)
end

function CBTN()
AddGoldItem(0,868)
AddGoldItem(0,874)
AddGoldItem(0,876)
end

function CBVD()
AddGoldItem(0,881)
AddGoldItem(0,888)
end

function CBCL()
AddGoldItem(0,891)
AddGoldItem(0,898)
AddGoldItem(0,901)
end
-----------------------------nhan do nguyet khuyet -----------------------
function setnguyetkhuyet()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",thieulam1},
		{"ThiÕu L©m C«n",thieulam2},
		{"ThiÕu L©m §ao",thieulam3},
		{"Thiªn V­¬ng Chïy",thienvuong1},
		{"Thiªn V­¬ng Th­¬ng",thienvuong2},
		{"Thiªn V­¬ng §ao",thienvuong3},
		{"Nga Mi KiÕm",ngami1},
		{"Nga Mi Ch­ëng",ngami2},
		{"Thóy Yªn §¬n §ao",thuyyen1},
		{"Thóy Yªn Song §ao",thuyyen2},
		{"Ngò §éc Ch­ëng Ph¸p",ngudoc1},
		{"Ngò §éc §ao Ph¸p",ngudoc2},
		{"Trang KÕ",nguyetkhuyet22},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function nguyetkhuyet22()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",duongmon1},
		{"§­êng M«n Tô TiÔn",duongmon2},
		{"§­êng M«n Phi Tiªu",duongmon3},
		{"C¸i Bang Rång",caibang1},
		{"C¸i Bang C«n Ph¸p",caibang2},
		{"Thiªn NhÉn KÝch",thiennhan1},
		{"Thiªn NhÉn §ao",thiennhan2},
		{"Vâ §ang KhÝ",vodang1},
		{"Vâ §ang KiÕm",vodang2},
		{"C«n L«n §ao",conlon1},
		{"C«n L«n KiÕm",conlon2},
		{"Hoa S¬n KiÕm T«ng",hoason1},
		{"Hoa S¬n KhÝ T«ng",hoason2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function thieulam1()
for i=5670,5679 do
AddGoldItem(0, i)
end
end
function thieulam2()
for i=5680,5689 do
AddGoldItem(0, i)
end
end
function thieulam3()
for i=5690,5699 do
AddGoldItem(0, i)
end
end
function thienvuong1()
for i=5700,5709 do
AddGoldItem(0, i)
end
end
function thienvuong2()
for i=5710,5719 do
AddGoldItem(0, i)
end
end
function thienvuong3()
for i=5720,5729 do
AddGoldItem(0, i)
end
end
function ngami1()
for i=5730,5739 do
AddGoldItem(0, i)
end
end
function ngami2()
for i=5740,5749 do
AddGoldItem(0, i)
end
end
function thuyyen1()
for i=5750,5759 do
AddGoldItem(0, i)
end
end
function thuyyen2()
for i=5760,5769 do
AddGoldItem(0, i)
end
end
function ngudoc1()
for i=5770,5779 do
AddGoldItem(0, i)
end
end
function ngudoc2()
for i=5780,5789 do
AddGoldItem(0, i)
end
end
function duongmon1()
for i=5790,5799 do
AddGoldItem(0, i)
end
end
function duongmon2()
for i=5800,5809 do
AddGoldItem(0, i)
end
end
function duongmon3()
for i=5810,5819 do
AddGoldItem(0, i)
end
end
function caibang1()
for i=5820,5829 do
AddGoldItem(0, i)
end
end
function caibang2()
for i=5830,5839 do
AddGoldItem(0, i)
end
end
function thiennhan1()
for i=5840,5849 do
AddGoldItem(0, i)
end
end
function thiennhan2()
for i=5850,5859 do
AddGoldItem(0, i)
end
end
function vodang1()
for i=5860,5869 do
AddGoldItem(0, i)
end
end
function vodang2()
for i=5870,5879 do
AddGoldItem(0, i)
end
end
function conlon1()
for i=5880,5889 do
AddGoldItem(0, i)
end
end
function conlon2()
for i=5890,5899 do
AddGoldItem(0, i)
end
end
function hoason1()
for i=5900,5909 do
AddGoldItem(0, i)
end
end
function hoason2()
for i=5910,5919 do
AddGoldItem(0, i)
end
end

-----------------------------nhan do dieu duong -----------------------
function setdieuduong()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",thieulamdd},
		{"ThiÕu L©m C«n",thieulamdd2},
		{"ThiÕu L©m §ao",thieulamdd3},
		{"Thiªn V­¬ng Chïy",thienvuongdd1},
		{"Thiªn V­¬ng Th­¬ng",thienvuongdd2},
		{"Thiªn V­¬ng §ao",thienvuongdd3},
		{"Nga Mi KiÕm",ngamidd1},
		{"Nga Mi Ch­ëng",ngamidd2},
		{"Thóy Yªn §¬n §ao",thuyyendd1},
		{"Thóy Yªn Song §ao",thuyyendd2},
		{"Ngò §éc Ch­ëng Ph¸p",ngudocdd1},
		{"Ngò §éc §ao Ph¸p",ngudocdd2},
		{"Trang KÕ",dieuduongdd22},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function dieuduongdd22()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",duongmondd1},
		{"§­êng M«n Tô TiÔn",duongmondd2},
		{"§­êng M«n Phi Tiªu",duongmondd3},
		{"C¸i Bang Rång",caibangdd1},
		{"C¸i Bang C«n Ph¸p",caibangdd2},
		{"Thiªn NhÉn KÝch",thiennhandd1},
		{"Thiªn NhÉn §ao",thiennhandd2},
		{"Vâ §ang KhÝ",vodangdd1},
		{"Vâ §ang KiÕm",vodangdd2},
		{"C«n L«n §ao",conlondd1},
		{"C«n L«n KiÕm",conlondd2},
		{"Hoa S¬n KiÕm T«ng",hoasondd1},
		{"Hoa S¬n KhÝ T«ng",hoasondd2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function thieulamdd1()
for i=5962,5971 do
AddGoldItem(0, i)
end
end
function thieulamdd2()
for i=5972,5981 do
AddGoldItem(0, i)
end
end
function thieulamdd3()
for i=5982,5991 do
AddGoldItem(0, i)
end
end
function thienvuongdd1()
for i=5992,6001 do
AddGoldItem(0, i)
end
end
function thienvuongdd2()
for i=6002,6011 do
AddGoldItem(0, i)
end
end
function thienvuongdd3()
for i=6012,6021 do
AddGoldItem(0, i)
end
end
function ngamidd1()
for i=6022,6031 do
AddGoldItem(0, i)
end
end
function ngamidd2()
for i=6032,6041 do
AddGoldItem(0, i)
end
end
function thuyyendd1()
for i=6042,6051 do
AddGoldItem(0, i)
end
end
function thuyyendd2()
for i=6052,6061 do
AddGoldItem(0, i)
end
end
function ngudocdd1()
for i=6062,6071 do
AddGoldItem(0, i)
end
end
function ngudocdd2()
for i=6072,6081 do
AddGoldItem(0, i)
end
end
function duongmondd1()
for i=6082,6091 do
AddGoldItem(0, i)
end
end
function duongmondd2()
for i=6092,6101 do
AddGoldItem(0, i)
end
end
function duongmondd3()
for i=6102,6111 do
AddGoldItem(0, i)
end
end
function caibangdd1()
for i=6112,6121 do
AddGoldItem(0, i)
end
end
function caibangdd2()
for i=6122,6131 do
AddGoldItem(0, i)
end
end
function thiennhandd1()
for i=6132,6141 do
AddGoldItem(0, i)
end
end
function thiennhandd2()
for i=6142,6151 do
AddGoldItem(0, i)
end
end
function vodangdd1()
for i=6152,6161 do
AddGoldItem(0, i)
end
end
function vodangdd2()
for i=6162,6171 do
AddGoldItem(0, i)
end
end
function conlondd1()
for i=6172,6181 do
AddGoldItem(0, i)
end
end
function conlondd2()
for i=6182,6191 do
AddGoldItem(0, i)
end
end
function hoasondd1()
for i=6192,6201 do
AddGoldItem(0, i)
end
end
function hoasondd2()
for i=6202,6211 do
AddGoldItem(0, i)
end
end
-----------------------------nhan do anh hao -----------------------
function setanhhao()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",thieulamah},
		{"ThiÕu L©m C«n",thieulamah2},
		{"ThiÕu L©m §ao",thieulamah3},
		{"Thiªn V­¬ng Chïy",thienvuongah1},
		{"Thiªn V­¬ng Th­¬ng",thienvuongah2},
		{"Thiªn V­¬ng §ao",thienvuongah3},
		{"Nga Mi KiÕm",ngamiah1},
		{"Nga Mi Ch­ëng",ngamiah2},
		{"Thóy Yªn §¬n §ao",thuyyenah1},
		{"Thóy Yªn Song §ao",thuyyenah2},
		{"Ngò §éc Ch­ëng Ph¸p",ngudocah1},
		{"Ngò §éc §ao Ph¸p",ngudocah2},
		{"Trang KÕ",dieuduongah22},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function dieuduongah22()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"§­êng M«n Phi §ao",duongmonah1},
		{"§­êng M«n Tô TiÔn",duongmonah2},
		{"§­êng M«n Phi Tiªu",duongmonah3},
		{"C¸i Bang Rång",caibangah1},
		{"C¸i Bang C«n Ph¸p",caibangah2},
		{"Thiªn NhÉn KÝch",thiennhanah1},
		{"Thiªn NhÉn §ao",thiennhanah2},
		{"Vâ §ang KhÝ",vodangah1},
		{"Vâ §ang KiÕm",vodangah2},
		{"C«n L«n §ao",conlonah1},
		{"C«n L«n KiÕm",conlonah2},
		{"Hoa S¬n KiÕm T«ng",hoasonah1},
		{"Hoa S¬n KhÝ T«ng",hoasonah2},
		{"Trë L¹i",TBCC},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function thieulamah1()
for i=6283,6292 do
AddGoldItem(0, i)
end
end
function thieulamah2()
for i=6293,6302 do
AddGoldItem(0, i)
end
end
function thieulamah3()
for i=6303,6312 do
AddGoldItem(0, i)
end
end
function thienvuongah1()
for i=6313,6322 do
AddGoldItem(0, i)
end
end
function thienvuongah2()
for i=6323,6332 do
AddGoldItem(0, i)
end
end
function thienvuongah3()
for i=6333,6342 do
AddGoldItem(0, i)
end
end
function ngamiah1()
for i=6343,6352 do
AddGoldItem(0, i)
end
end
function ngamiah2()
for i=6353,6362 do
AddGoldItem(0, i)
end
end
function thuyyenah1()
for i=6363,6372 do
AddGoldItem(0, i)
end
end
function thuyyenah2()
for i=6373,6382 do
AddGoldItem(0, i)
end
end
function ngudocah1()
for i=6383,6392 do
AddGoldItem(0, i)
end
end
function ngudocah2()
for i=6393,6402 do
AddGoldItem(0, i)
end
end
function duongmonah1()
for i=6403,6412 do
AddGoldItem(0, i)
end
end
function duongmonah2()
for i=6413,6422 do
AddGoldItem(0, i)
end
end
function duongmonah3()
for i=6423,6432 do
AddGoldItem(0, i)
end
end
function caibangah1()
for i=6433,6442 do
AddGoldItem(0, i)
end
end
function caibangah2()
for i=6443,6452 do
AddGoldItem(0, i)
end
end
function thiennhanah1()
for i=6453,6462 do
AddGoldItem(0, i)
end
end
function thiennhanah2()
for i=6463,6472 do
AddGoldItem(0, i)
end
end
function vodangah1()
for i=6473,6482 do
AddGoldItem(0, i)
end
end
function vodangah2()
for i=6483,6492 do
AddGoldItem(0, i)
end
end
function conlonah1()
for i=6493,6502 do
AddGoldItem(0, i)
end
end
function conlonah2()
for i=6503,6512 do
AddGoldItem(0, i)
end
end
function hoasonah1()
for i=6513,6522 do
AddGoldItem(0, i)
end
end
function hoasonah2()
for i=6523,6532 do
AddGoldItem(0, i)
end
end
-------------------Pet----------------------
function Pet()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Chän Pet §i Ku",Pet1},
		{"Xãa Pet",Pet2},
		{"Trë L¹i",Pet},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end


function Pet1()
local szTitle = LENHBAI_ADMIN.."Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{
		{"Chu T­íc",Pet3},
		{"Háa Kú L©n",Pet4},
		{"Thanh Long",Pet5},
		{"HuyÒn Vò",Pet6},
		{"Dung H¹­",Pet7},
		{"Trë L¹i",Pet},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function Pet3()
 local partneridex = PARTNER_AddFightPartner(4,4,1,5,5,5,5,5,5)
PARTNER_CallOutCurPartner(1)
end
function Pet4()
 local partneridex = PARTNER_AddFightPartner(1,1,1,5,5,5,5,5,5)
PARTNER_CallOutCurPartner(1)
end
function Pet5()
 local partneridex = PARTNER_AddFightPartner(2,2,1,5,5,5,5,5,5)
PARTNER_CallOutCurPartner(1)
end
function Pet6()
 local partneridex = PARTNER_AddFightPartner(3,3,1,5,5,5,5,5,5)
PARTNER_CallOutCurPartner(1)
end
function Pet7()
 local partneridex = PARTNER_AddFightPartner(5,0,1,5,5,5,5,5,5)
PARTNER_CallOutCurPartner(1)
end

function Pet2()
PARTNER_RemovePartner(1,1,1,5,5,5,5,5,5)
end

--------Ngoai Trang--------------
function ngoaitrang()
	local szTitle = "§¹i hiÖp cÇn g×?"
	local tbOpt =
		{
			"KiÓm ID ngo¹i trang/CheckFeature",
			"Thay ®æi ngo¹i h×nh cho 1 trang bÞ/feature_item",
			"Phôc håi ngo¹i h×nh gèc cho trang bÞ/restore_feature_item",
			"Trë l¹i/main",
			"Th«i./no",
		}
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	
	
	function CheckFeature()
		local nHelm, nArmor, nWeapon, nHorse = GetPlayerFeature(PlayerIndex)
		Msg2Player("Helm, Armor, Weapon, Horse")
		Msg2Player(nHelm..", "..nArmor..", "..nWeapon..", "..nHorse)
	end
	
	
	function feature_item()
		GiveItemUI("Thay ®æi ngo¹i h×nh trang bÞ", "H·y ®Æt vµo 1 trang bÞ muèn thay ®æi. L­u ý ngo¹i h×nh míi vÉn tån t¹i sau khi tho¸t game.", "feature_item_confirm", "onCancel", 1);
	end
	
	function feature_item_confirm(nCount)
		if nCount > 1 then
			Talk(1, "", "Qu¸ nhiÒu trang bÞ, kh«ng thÓ xö lÝ")
			return
		elseif nCount==1 then
			local nItemIndex = GetGiveItemUnit(1)
			g_AskClientNumberEx(1, 500, "NhËp ID muèn ®æi:", {SetItemNewFeature, {nItemIndex}})
			--SetItemNewFeature(nItemIndex, nNo)
		end
	end
	
	function restore_feature_item()
		GiveItemUI("Phôc håi ngo¹i h×nh trang bÞ", "§Æt vµo c¸c trang bÞ muèn phôc håi.", "restore_feature_item_confirm", "onCancel", 1);
	end
	
	function restore_feature_item_confirm(nCount)
		for i=1,nCount do
			local nItemIndex = GetGiveItemUnit(i)
			SetItemNewFeature(nItemIndex, -1)
		end
	end


	tbItemName =
	{
		--VK can
		[0]={
			szName = "Vò KhÝ CËn ChiÕn 1",
			tbEquip =
			{
				{"HuyÒn ThiÕt KiÕm",0,0,0},
				{"§¹i Phong §ao",0,0,1},
				{"Kim C« Bæng",0,0,2},
				{"Ph¸ Thiªn KÝch",0,0,3},
				{"Ph¸ Thiªn chïy",0,0,4},
				{"Th«n NhËt Tr·m",0,0,5},
				{"TriÒn Thñ",0,0,6},
				{"Vò Hån §ao",0,0,7},
				{"Vò Hån ThuÉn",0,0,8},
			}
		},
		--VK xa
		[1]={
			szName = "Vò KhÝ TÇm Xa",
			tbEquip =
			{
				{"B¸ V­¬ng Tiªu",0,1,0},
				{"To¸i NguyÖt §ao",0,1,1},
				{"Khæng T­íc Linh",0,1,2},
			}		
		},
		--Ao
		[2]={
			szName = "¸o Gi¸p",
			tbEquip =
			{
				{"ThÊt B¶o Cµ Sa",0,2,0},
				{"Ch©n Vò Th¸nh Y",0,2,1},
				{"Thiªn NhÉn MËt Trang",0,2,2},
				{"Gi¸ng Sa Bµo",0,2,3},
				{"§­êng Nghª gi¸p",0,2,4},
				{"V¹n L­u Quy T«ng Y",0,2,5},
				{"TuyÒn Long bµo",0,2,6},
				{"Long Tiªu ®¹o Y",0,2,8},
				{"Cöu VÜ B¹ch Hå trang",0,2,9},
				{"TrÇm H­¬ng sam",0,2,10},
				{"TÝch LÞch Kim Phông gi¸p",0,2,11},
				{"V¹n Chóng TÒ T©m Y",0,2,12},
				{"L­u Tiªn QuÇn",0,2,13},
			}
		},
		--Nhan
		[3]={
			szName = "NhÉn",
			tbEquip =
			{
				{"Toµn Th¹ch Giíi ChØ ",0,3,0},
			}	
		},
		--Day Chuyen
		[4]={
			szName = "D©y ChuyÒn",
			tbEquip =
			{
				{"Toµn th¹ch h¹ng liªn",0,4,0},
				{"Lôc PhØ Thóy Hé Th©n phï ",0,4,1},
			}
		},
		--Giay
		[5]={
			szName = "Giµy",
			tbEquip =
			{
				{"Cöu TiÕt X­¬ng VÜ Ngoa",0,5,0},
				{"Thiªn Tµm Ngoa",0,5,1},
				{"Kim Lò hµi",0,5,2},
				{"Phi Phông Ngoa",0,5,3},
			}		
		},
		--Dai Lung
		[6]={
			szName = "§ai L­ng",
			tbEquip =
			{
				{"Thiªn Tµm Yªu §¸i",0,6,0},
				{"B¹ch Kim Yªu §¸i",0,6,1},
			}
		},
		--Non
		[7]={
			szName = "Nãn",
			tbEquip =
			{
				{"Tú L« m·o",0,7,0},
				{"Ngò l·o qu¸n",0,7,1},
				{"Tu La Ph¸t kÕt",0,7,2},
				{"Th«ng Thiªn Ph¸t Qu¸n",0,7,3},
				{"YÓm NhËt kh«i",0,7,4},
				{"TrÝch Tinh hoµn",0,7,5},
				{"¤ Tµm M·o",0,7,6},
				{"Quan ¢m Ph¸t Qu¸n",0,7,7},
				{"¢m D­¬ng V« Cùc qu¸n",0,7,8},
				{"HuyÒn Tª DiÖn Tr¸o",0,7,9},
				{"Long HuyÕt §Çu hoµn",0,7,10},
				{"Long L©n Kh«i",0,7,11},
				{"Thanh Tinh Thoa",0,7,12},
				{"Kim Phông TriÓn SÝ ",0,7,13},
			}		
		},
		--Bao Tay
		[8]={
			szName = "Bao Tay",
			tbEquip =
			{
				{"Long Phông HuyÕt Ngäc Tr¹c",0,8,0},
				{"Thiªn Tµm Hé UyÓn",0,8,1},
			}		
		},
		--NGoc Boi
		[9]={
			szName = "Ngäc Béi",
			tbEquip =
			{
				{"Long Tiªn H­¬ng Nang",0,9,0},
				{"D­¬ng Chi B¹ch Ngäc",0,9,1},
			}		
		},	
	}
	
	----------LÊy §å TÝm------------------
	function laydotim_option()
		local tbOpt = {}
		for i=0, 9 do
			tinsert(tbOpt, format("%s/#laydotim1(%d)", tbItemName[i].szName, i))  
		end
		tinsert(tbOpt, "Trë l¹i./main")
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say("Xin mêi lùa chän trang bÞ:", getn(tbOpt), tbOpt)	
	end
	function laydotim1(nType)
		local tbEquip = %tbItemName[nType]["tbEquip"]
		local tbOpt = {}
		for i=1, getn(tbEquip) do
			tinsert(tbOpt, format("%s/#laydotim2(%d,%d)", tbEquip[i][1], i, nType))
		end
		tinsert(tbOpt, "Trë l¹i./laydotim")
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say("Xin mêi lùa chän trang bÞ:", getn(tbOpt), tbOpt)	
	end
	function laydotim2(nIndex, nType)
		local szTitle = "Mêi chän hÖ:"
		local tbOpt = {}
		tinsert(tbOpt, format("Kim/#laydotim3(%d,%d, 0)",nIndex, nType))
		tinsert(tbOpt, format("Méc/#laydotim3(%d,%d, 1)",nIndex, nType))
		tinsert(tbOpt, format("Thñy/#laydotim3(%d,%d, 2)",nIndex, nType))
		tinsert(tbOpt, format("Háa/#laydotim3(%d,%d, 3)",nIndex, nType))
		tinsert(tbOpt, format("Thæ/#laydotim3(%d,%d, 4)",nIndex, nType))
		tinsert(tbOpt, "Trë l¹i./laydotim")
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)		
	end
	function laydotim3(nIndex, nType, nSeries)
		local szTitle = "Mêi chän dßng hiÖn 1:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng vËt lý hÖ Ngo¹i c«ng/#laydotim4(%d,%d,%d,10)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng c«ng kÝch chÝnh x¸c/#laydotim4(%d,%d,%d,20)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng tèc ®é xuÊt chiªu hÖ Ngo¹i c«ng/#laydotim4(%d,%d,%d,30)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Bá qua tèc ®é di chuyÓn cña ®èi ph­¬ng/#laydotim4(%d,%d,%d,40)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Kh«ng thÓ ph¸ hñy/#laydotim4(%d,%d,%d,50)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng phßng thñ vËt lý/#laydotim4(%d,%d,%d,60)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng tèc ®é di chuyÓn/#laydotim4(%d,%d,%d,70)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng ph¶n ®ßn cËn chiÕn/#laydotim4(%d,%d,%d,80)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Gi¶m thêi gian bÞ th­¬ng/#laydotim4(%d,%d,%d,90)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng ph¹m vi s¸t th­¬ng/#laydotim4(%d,%d,%d,100)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp tÊt c¶ vò khÝ/#laydotim4(%d,%d,%d,110)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Kh¸ng tÊt c¶/#laydotim4(%d,%d,%d,120)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Trang sau/#trangsau(%d,%d,%d)",nIndex, nType, nSeries))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangsau(nIndex, nType, nSeries)
		local szTitle = "Mêi chän dßng hiÖn 1:"
		local tbOpt = {}
		tinsert(tbOpt, format("Hót sinh lùc ®èi ph­¬ng/#laydotim4(%d,%d,%d,130)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Hót Néi lùc ®èi ph­¬ng/#laydotim4(%d,%d,%d,140)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Sinh lùc t¨ng/#laydotim4(%d,%d,%d,150)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Néi lùc t¨ng/#laydotim4(%d,%d,%d,160)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("ThÓ lùc t¨ng/#laydotim4(%d,%d,%d,170)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Mçi nöa gi©y Sinh lùc håi phôc/#laydotim4(%d,%d,%d,180)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Mçi n÷a gi©y Néi lùc håi phôc/#laydotim4(%d,%d,%d,190)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Mçi n÷a gi©y ThÓ lùc håi phôc/#laydotim4(%d,%d,%d,200)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Søc m¹nh t¨ng/#laydotim4(%d,%d,%d,210)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng VËt lý hÖ Ngo¹i c«ng/#laydotim4(%d,%d,%d,220)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng ®éc s¸t hÖ Ngo¹i c«ng/#laydotim4(%d,%d,%d,230)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng b¨ng s¸t hÖ Ngo¹i c«ng/#laydotim4(%d,%d,%d,240)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Trang sau/#trangke(%d,%d,%d)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim3(%d,%d,%d)",nIndex, nType, nSeries))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangke(nIndex, nType, nSeries)
		local szTitle = "Mêi chän dßng hiÖn 1:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng b¨ng háa hÖ Ngo¹i c«ng/#laydotim4(%d,%d,%d,250)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng b¨ng L«i hÖ Ngo¹i c«ng/#laydotim4(%d,%d,%d,260)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("ChuyÓn hãa s¸t th­¬ng thµnh Néi lùc/#laydotim4(%d,%d,%d,270)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Phßng thñ t¨ng/#laydotim4(%d,%d,%d,280)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Phßng ®éc t¨ng/#laydotim4(%d,%d,%d,290)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Phßng b¨ng t¨ng/#laydotim4(%d,%d,%d,300)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Phßng háa t¨ng/#laydotim4(%d,%d,%d,310)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Phßng L«i t¨ng/#laydotim4(%d,%d,%d,320)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng Ngo¹i c«ng/#laydotim4(%d,%d,%d,330)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Gi¶m cho¸ng/#laydotim4(%d,%d,%d,340)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng May m¾n/#laydotim4(%d,%d,%d,350)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Gi¶m ®éng t¸c lµm chËm/#laydotim4(%d,%d,%d,360)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Trang sau/#trangtiep(%d,%d,%d)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim3(%d,%d,%d)",nIndex, nType, nSeries))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangtiep(nIndex, nType, nSeries)
		local szTitle = "Mêi chän dßng hiÖn 1:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng th©n ph¸p/#laydotim4(%d,%d,%d,370)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Gi¶m thêi gian tróng ®éc/#laydotim4(%d,%d,%d,380)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Kim/#laydotim4(%d,%d,%d,390)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Thñy/#laydotim4(%d,%d,%d,400)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Méc/#laydotim4(%d,%d,%d,410)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Háa/#laydotim4(%d,%d,%d,420)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Thæ/#laydotim4(%d,%d,%d,430)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng VËt lý hÖ Néi c«ng/#laydotim4(%d,%d,%d,440)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng B¨ng s¸t hÖ Néi c«ng/#laydotim4(%d,%d,%d,450)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng Ho¶ s¸t hÖ Néi c«ng/#laydotim4(%d,%d,%d,460)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng L«i s¸t hÖ Néi c«ng/#laydotim4(%d,%d,%d,470)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng §éc hÖ Néi c«ng/#laydotim4(%d,%d,%d,480)",nIndex, nType, nSeries))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim3(%d,%d,%d)",nIndex, nType, nSeries))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function laydotim4(nIndex, nType, nSeries, nSeries2)
		local szTitle = "Mêi chän dßng Èn1:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng vËt lý hÖ Ngo¹i c«ng/#laydotim5(%d,%d,%d,%d,10)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng c«ng kÝch chÝnh x¸c/#laydotim5(%d,%d,%d,%d,20)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng tèc ®é xuÊt chiªu hÖ Ngo¹i c«ng/#laydotim5(%d,%d,%d,%d,30)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Bá qua tèc ®é di chuyÓn cña ®èi ph­¬ng/#laydotim5(%d,%d,%d,%d,40)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Kh«ng thÓ ph¸ hñy/#laydotim5(%d,%d,%d,%d,50)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng phßng thñ vËt lý/#laydotim5(%d,%d,%d,%d,60)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng tèc ®é di chuyÓn/#laydotim5(%d,%d,%d,%d,70)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng ph¶n ®ßn cËn chiÕn/#laydotim5(%d,%d,%d,%d,80)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Gi¶m thêi gian bÞ th­¬ng/#laydotim5(%d,%d,%d,%d,90)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng ph¹m vi s¸t th­¬ng/#laydotim5(%d,%d,%d,%d,100)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp tÊt c¶ vò khÝ/#laydotim5(%d,%d,%d,%d,110)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Kh¸ng tÊt c¶/#laydotim5(%d,%d,%d,%d,120)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Trang sau/#trangsau1(%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangsau1(nIndex, nType, nSeries, nSeries2)
		local szTitle = "Mêi chän dßng Èn1:"
		local tbOpt = {}
		tinsert(tbOpt, format("Hót sinh lùc ®èi ph­¬ng/#laydotim5(%d,%d,%d,%d,130)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Hót Néi lùc ®èi ph­¬ng/#laydotim5(%d,%d,%d,%d,140)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Sinh lùc t¨ng/#laydotim5(%d,%d,%d,%d,150)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Néi lùc t¨ng/#laydotim5(%d,%d,%d,%d,160)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("ThÓ lùc t¨ng/#laydotim5(%d,%d,%d,%d,170)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Mçi nöa gi©y Sinh lùc håi phôc/#laydotim5(%d,%d,%d,%d,180)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Mçi n÷a gi©y Néi lùc håi phôc/#laydotim5(%d,%d,%d,%d,190)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Mçi n÷a gi©y ThÓ lùc håi phôc/#laydotim5(%d,%d,%d,%d,200)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Søc m¹nh t¨ng/#laydotim5(%d,%d,%d,%d,210)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng VËt lý hÖ Ngo¹i c«ng/#laydotim5(%d,%d,%d,%d,220)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng ®éc s¸t hÖ Ngo¹i c«ng/#laydotim5(%d,%d,%d,%d,230)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng b¨ng s¸t hÖ Ngo¹i c«ng/#laydotim5(%d,%d,%d,%d,240)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Trang sau/#trangke1(%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim4(%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangke1(nIndex, nType, nSeries, nSeries2)
		local szTitle = "Mêi chän dßng Èn1:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng b¨ng háa hÖ Ngo¹i c«ng/#laydotim5(%d,%d,%d,%d,250)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng b¨ng L«i hÖ Ngo¹i c«ng/#laydotim5(%d,%d,%d,%d,260)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("ChuyÓn hãa s¸t th­¬ng thµnh Néi lùc/#laydotim5(%d,%d,%d,%d,270)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Phßng thñ t¨ng/#laydotim5(%d,%d,%d,%d,280)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Phßng ®éc t¨ng/#laydotim5(%d,%d,%d,%d,290)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Phßng b¨ng t¨ng/#laydotim5(%d,%d,%d,%d,300)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Phßng háa t¨ng/#laydotim5(%d,%d,%d,%d,310)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Phßng L«i t¨ng/#laydotim5(%d,%d,%d,%d,320)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng Ngo¹i c«ng/#laydotim5(%d,%d,%d,%d,330)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Gi¶m cho¸ng/#laydotim5(%d,%d,%d,%d,340)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng May m¾n/#laydotim5(%d,%d,%d,%d,350)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Gi¶m ®éng t¸c lµm chËm/#laydotim5(%d,%d,%d,%d,360)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Trang sau/#trangtiep1(%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim4(%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangtiep1(nIndex, nType, nSeries, nSeries2)
		local szTitle = "Mêi chän dßng Èn1:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng th©n ph¸p/#laydotim5(%d,%d,%d,%d,370)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Gi¶m thêi gian tróng ®éc/#laydotim5(%d,%d,%d,%d,380)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Kim/#laydotim5(%d,%d,%d,%d,390)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Thñy/#laydotim5(%d,%d,%d,%d,400)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Méc/#laydotim5(%d,%d,%d,%d,410)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Háa/#laydotim5(%d,%d,%d,%d,420)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Thæ/#laydotim5(%d,%d,%d,%d,430)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng VËt lý hÖ Néi c«ng/#laydotim5(%d,%d,%d,%d,440)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng B¨ng s¸t hÖ Néi c«ng/#laydotim5(%d,%d,%d,%d,450)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng Ho¶ s¸t hÖ Néi c«ng/#laydotim5(%d,%d,%d,%d,460)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng L«i s¸t hÖ Néi c«ng/#laydotim5(%d,%d,%d,%d,470)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng §éc hÖ Néi c«ng/#laydotim5(%d,%d,%d,%d,480)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim4(%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function laydotim5(nIndex, nType, nSeries, nSeries2, nPlopr)
		local szTitle = "Mêi chän dßng hiÖn 2:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng vËt lý hÖ Ngo¹i c«ng/#laydotim6(%d,%d,%d,%d,%d,10)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng c«ng kÝch chÝnh x¸c/#laydotim6(%d,%d,%d,%d,%d,20)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng tèc ®é xuÊt chiªu hÖ Ngo¹i c«ng/#laydotim6(%d,%d,%d,%d,%d,30)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Bá qua tèc ®é di chuyÓn cña ®èi ph­¬ng/#laydotim6(%d,%d,%d,%d,%d,40)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Kh«ng thÓ ph¸ hñy/#laydotim6(%d,%d,%d,%d,%d,50)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng phßng thñ vËt lý/#laydotim6(%d,%d,%d,%d,%d,60)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng tèc ®é di chuyÓn/#laydotim6(%d,%d,%d,%d,%d,70)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng ph¶n ®ßn cËn chiÕn/#laydotim6(%d,%d,%d,%d,%d,80)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Gi¶m thêi gian bÞ th­¬ng/#laydotim6(%d,%d,%d,%d,%d,90)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng ph¹m vi s¸t th­¬ng/#laydotim6(%d,%d,%d,%d,%d,100)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp tÊt c¶ vò khÝ/#laydotim6(%d,%d,%d,%d,%d,110)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Kh¸ng tÊt c¶/#laydotim6(%d,%d,%d,%d,%d,120)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Trang sau/#trangsau2(%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangsau2(nIndex, nType, nSeries, nSeries2, nPlopr)
		local szTitle = "Mêi chän dßng hiÖn 2:"
		local tbOpt = {}
		tinsert(tbOpt, format("Hót sinh lùc ®èi ph­¬ng/#laydotim6(%d,%d,%d,%d,%d,130)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Hót Néi lùc ®èi ph­¬ng/#laydotim6(%d,%d,%d,%d,%d,140)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Sinh lùc t¨ng/#laydotim6(%d,%d,%d,%d,%d,150)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Néi lùc t¨ng/#laydotim6(%d,%d,%d,%d,%d,160)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("ThÓ lùc t¨ng/#laydotim6(%d,%d,%d,%d,%d,170)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Mçi nöa gi©y Sinh lùc håi phôc/#laydotim6(%d,%d,%d,%d,%d,180)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Mçi n÷a gi©y Néi lùc håi phôc/#laydotim6(%d,%d,%d,%d,%d,190)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Mçi n÷a gi©y ThÓ lùc håi phôc/#laydotim6(%d,%d,%d,%d,%d,200)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Søc m¹nh t¨ng/#laydotim6(%d,%d,%d,%d,%d,210)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng VËt lý hÖ Ngo¹i c«ng/#laydotim6(%d,%d,%d,%d,%d,220)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng ®éc s¸t hÖ Ngo¹i c«ng/#laydotim6(%d,%d,%d,%d,%d,230)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng b¨ng s¸t hÖ Ngo¹i c«ng/#laydotim6(%d,%d,%d,%d,%d,240)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Trang sau/#trangke2(%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim5(%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangke2(nIndex, nType, nSeries, nSeries2, nPlopr)
		local szTitle = "Mêi chän dßng hiÖn 2:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng b¨ng háa hÖ Ngo¹i c«ng/#laydotim6(%d,%d,%d,%d,%d,250)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng b¨ng L«i hÖ Ngo¹i c«ng/#laydotim6(%d,%d,%d,%d,%d,260)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("ChuyÓn hãa s¸t th­¬ng thµnh Néi lùc/#laydotim6(%d,%d,%d,%d,%d,270)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Phßng thñ t¨ng/#laydotim6(%d,%d,%d,%d,%d,280)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Phßng ®éc t¨ng/#laydotim6(%d,%d,%d,%d,%d,290)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Phßng b¨ng t¨ng/#laydotim6(%d,%d,%d,%d,%d,300)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Phßng háa t¨ng/#laydotim6(%d,%d,%d,%d,%d,310)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Phßng L«i t¨ng/#laydotim6(%d,%d,%d,%d,%d,320)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng Ngo¹i c«ng/#laydotim6(%d,%d,%d,%d,%d,330)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Gi¶m cho¸ng/#laydotim6(%d,%d,%d,%d,%d,340)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng May m¾n/#laydotim6(%d,%d,%d,%d,%d,350)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Gi¶m ®éng t¸c lµm chËm/#laydotim6(%d,%d,%d,%d,%d,360)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Trang sau/#trangtiep2(%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim5(%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangtiep2(nIndex, nType, nSeries, nSeries2, nPlopr)
		local szTitle = "Mêi chän dßng hiÖn 2:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng th©n ph¸p/#laydotim6(%d,%d,%d,%d,%d,370)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Gi¶m thêi gian tróng ®éc/#laydotim6(%d,%d,%d,%d,%d,380)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Kim/#laydotim6(%d,%d,%d,%d,%d,390)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Thñy/#laydotim6(%d,%d,%d,%d,%d,400)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Méc/#laydotim6(%d,%d,%d,%d,%d,410)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Háa/#laydotim6(%d,%d,%d,%d,%d,420)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Thæ/#laydotim6(%d,%d,%d,%d,%d,430)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng VËt lý hÖ Néi c«ng/#laydotim6(%d,%d,%d,%d,%d,440)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng B¨ng s¸t hÖ Néi c«ng/#laydotim6(%d,%d,%d,%d,%d,450)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng Ho¶ s¸t hÖ Néi c«ng/#laydotim6(%d,%d,%d,%d,%d,460)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng L«i s¸t hÖ Néi c«ng/#laydotim6(%d,%d,%d,%d,%d,470)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng §éc hÖ Néi c«ng/#laydotim6(%d,%d,%d,%d,%d,480)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim5(%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2,nPlopr))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function laydotim6(nIndex, nType, nSeries, nSeries2,nPlopr, nPlopr1)
		local szTitle = "Mêi chän dßng Èn 2:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng vËt lý hÖ Ngo¹i c«ng/#laydotim7(%d,%d,%d,%d,%d,%d,10)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng c«ng kÝch chÝnh x¸c/#laydotim7(%d,%d,%d,%d,%d,%d,20)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng tèc ®é xuÊt chiªu hÖ Ngo¹i c«ng/#laydotim7(%d,%d,%d,%d,%d,%d,30)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Bá qua tèc ®é di chuyÓn cña ®èi ph­¬ng/#laydotim7(%d,%d,%d,%d,%d,%d,40)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Kh«ng thÓ ph¸ hñy/#laydotim7(%d,%d,%d,%d,%d,%d,50)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng phßng thñ vËt lý/#laydotim7(%d,%d,%d,%d,%d,%d,60)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng tèc ®é di chuyÓn/#laydotim7(%d,%d,%d,%d,%d,%d,70)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng ph¶n ®ßn cËn chiÕn/#laydotim7(%d,%d,%d,%d,%d,%d,80)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Gi¶m thêi gian bÞ th­¬ng/#laydotim7(%d,%d,%d,%d,%d,%d,90)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng ph¹m vi s¸t th­¬ng/#laydotim7(%d,%d,%d,%d,%d,%d,100)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp tÊt c¶ vò khÝ/#laydotim7(%d,%d,%d,%d,%d,%d,110)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Kh¸ng tÊt c¶/#laydotim7(%d,%d,%d,%d,%d,%d,120)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Trang sau/#trangsau3(%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangsau3(nIndex, nType, nSeries, nSeries2,nPlopr, nPlopr1)
		local szTitle = "Mêi chän dßng Èn 2:"
		local tbOpt = {}
		tinsert(tbOpt, format("Hót sinh lùc ®èi ph­¬ng/#laydotim7(%d,%d,%d,%d,%d,%d,130)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Hót Néi lùc ®èi ph­¬ng/#laydotim7(%d,%d,%d,%d,%d,%d,140)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Sinh lùc t¨ng/#laydotim7(%d,%d,%d,%d,%d,%d,150)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Néi lùc t¨ng/#laydotim7(%d,%d,%d,%d,%d,%d,160)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("ThÓ lùc t¨ng/#laydotim7(%d,%d,%d,%d,%d,%d,170)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Mçi nöa gi©y Sinh lùc håi phôc/#laydotim7(%d,%d,%d,%d,%d,%d,180)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Mçi n÷a gi©y Néi lùc håi phôc/#laydotim7(%d,%d,%d,%d,%d,%d,190)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Mçi n÷a gi©y ThÓ lùc håi phôc/#laydotim7(%d,%d,%d,%d,%d,%d,200)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Søc m¹nh t¨ng/#laydotim7(%d,%d,%d,%d,%d,%d,210)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng VËt lý hÖ Ngo¹i c«ng/#laydotim7(%d,%d,%d,%d,%d,%d,220)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng ®éc s¸t hÖ Ngo¹i c«ng/#laydotim7(%d,%d,%d,%d,%d,%d,230)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng b¨ng s¸t hÖ Ngo¹i c«ng/#laydotim7(%d,%d,%d,%d,%d,%d,240)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Trang sau/#trangke3(%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim6(%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangke3(nIndex, nType, nSeries, nSeries2,nPlopr, nPlopr1)
		local szTitle = "Mêi chän dßng Èn 2:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng b¨ng háa hÖ Ngo¹i c«ng/#laydotim7(%d,%d,%d,%d,%d,%d,250)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng b¨ng L«i hÖ Ngo¹i c«ng/#laydotim7(%d,%d,%d,%d,%d,%d,260)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("ChuyÓn hãa s¸t th­¬ng thµnh Néi lùc/#laydotim7(%d,%d,%d,%d,%d,%d,270)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Phßng thñ t¨ng/#laydotim7(%d,%d,%d,%d,%d,%d,280)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Phßng ®éc t¨ng/#laydotim7(%d,%d,%d,%d,%d,%d,290)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Phßng b¨ng t¨ng/#laydotim7(%d,%d,%d,%d,%d,%d,300)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Phßng háa t¨ng/#laydotim7(%d,%d,%d,%d,%d,%d,310)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Phßng L«i t¨ng/#laydotim7(%d,%d,%d,%d,%d,%d,320)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng Ngo¹i c«ng/#laydotim7(%d,%d,%d,%d,%d,%d,330)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Gi¶m cho¸ng/#laydotim7(%d,%d,%d,%d,%d,%d,340)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng May m¾n/#laydotim7(%d,%d,%d,%d,%d,%d,350)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Gi¶m ®éng t¸c lµm chËm/#laydotim7(%d,%d,%d,%d,%d,%d,360)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Trang sau/#trangtiep3(%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim6(%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangtiep3(nIndex, nType, nSeries, nSeries2,nPlopr, nPlopr1)
		local szTitle = "Mêi chän dßng Èn 2:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng th©n ph¸p/#laydotim7(%d,%d,%d,%d,%d,%d,370)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Gi¶m thêi gian tróng ®éc/#laydotim7(%d,%d,%d,%d,%d,%d,380)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Kim/#laydotim7(%d,%d,%d,%d,%d,%d,390)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Thñy/#laydotim7(%d,%d,%d,%d,%d,%d,400)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Méc/#laydotim7(%d,%d,%d,%d,%d,%d,410)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Háa/#laydotim7(%d,%d,%d,%d,%d,%d,420)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Thæ/#laydotim7(%d,%d,%d,%d,%d,%d,430)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng VËt lý hÖ Néi c«ng/#laydotim7(%d,%d,%d,%d,%d,%d,440)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng B¨ng s¸t hÖ Néi c«ng/#laydotim7(%d,%d,%d,%d,%d,%d,450)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng Ho¶ s¸t hÖ Néi c«ng/#laydotim7(%d,%d,%d,%d,%d,%d,460)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng L«i s¸t hÖ Néi c«ng/#laydotim7(%d,%d,%d,%d,%d,%d,470)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng §éc hÖ Néi c«ng/#laydotim7(%d,%d,%d,%d,%d,%d,480)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim6(%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function laydotim7(nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont)
		local szTitle = "Mêi chän dßng hiÖn 3:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng vËt lý hÖ Ngo¹i c«ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,10)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng c«ng kÝch chÝnh x¸c/#laydotim8(%d,%d,%d,%d,%d,%d,%d,20)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng tèc ®é xuÊt chiªu hÖ Ngo¹i c«ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,30)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Bá qua tèc ®é di chuyÓn cña ®èi ph­¬ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,40)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Kh«ng thÓ ph¸ hñy/#laydotim8(%d,%d,%d,%d,%d,%d,%d,50)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng phßng thñ vËt lý/#laydotim8(%d,%d,%d,%d,%d,%d,%d,60)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng tèc ®é di chuyÓn/#laydotim8(%d,%d,%d,%d,%d,%d,%d,70)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng ph¶n ®ßn cËn chiÕn/#laydotim8(%d,%d,%d,%d,%d,%d,%d,80)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Gi¶m thêi gian bÞ th­¬ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,90)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng ph¹m vi s¸t th­¬ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,100)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp tÊt c¶ vò khÝ/#laydotim8(%d,%d,%d,%d,%d,%d,%d,110)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Kh¸ng tÊt c¶/#laydotim8(%d,%d,%d,%d,%d,%d,%d,120)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Trang sau/#trangsau4(%d,%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangsau4(nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont)
		local szTitle = "Mêi chän dßng hiÖn 3:"
		local tbOpt = {}
		tinsert(tbOpt, format("Hót sinh lùc ®èi ph­¬ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,130)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Hót Néi lùc ®èi ph­¬ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,140)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Sinh lùc t¨ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,150)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Néi lùc t¨ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,160)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("ThÓ lùc t¨ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,170)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Mçi nöa gi©y Sinh lùc håi phôc/#laydotim8(%d,%d,%d,%d,%d,%d,%d,180)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Mçi n÷a gi©y Néi lùc håi phôc/#laydotim8(%d,%d,%d,%d,%d,%d,%d,190)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Mçi n÷a gi©y ThÓ lùc håi phôc/#laydotim8(%d,%d,%d,%d,%d,%d,%d,200)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Søc m¹nh t¨ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,210)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng VËt lý hÖ Ngo¹i c«ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,220)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng ®éc s¸t hÖ Ngo¹i c«ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,230)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng b¨ng s¸t hÖ Ngo¹i c«ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,240)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Trang sau/#trangke4(%d,%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim7(%d,%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangke4(nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont)
		local szTitle = "Mêi chän dßng hiÖn 3:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng b¨ng háa hÖ Ngo¹i c«ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,250)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng b¨ng L«i hÖ Ngo¹i c«ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,260)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("ChuyÓn hãa s¸t th­¬ng thµnh Néi lùc/#laydotim8(%d,%d,%d,%d,%d,%d,%d,270)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Phßng thñ t¨ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,280)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Phßng ®éc t¨ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,290)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Phßng b¨ng t¨ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,300)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Phßng háa t¨ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,310)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Phßng L«i t¨ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,320)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng Ngo¹i c«ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,330)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Gi¶m cho¸ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,340)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng May m¾n/#laydotim8(%d,%d,%d,%d,%d,%d,%d,350)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Gi¶m ®éng t¸c lµm chËm/#laydotim8(%d,%d,%d,%d,%d,%d,%d,360)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Trang sau/#trangtiep4(%d,%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim7(%d,%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangtiep4(nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont)
		local szTitle = "Mêi chän dßng hiÖn 3:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng th©n ph¸p/#laydotim8(%d,%d,%d,%d,%d,%d,%d,370)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Gi¶m thêi gian tróng ®éc/#laydotim8(%d,%d,%d,%d,%d,%d,%d,380)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Kim/#laydotim8(%d,%d,%d,%d,%d,%d,%d,390)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Thñy/#laydotim8(%d,%d,%d,%d,%d,%d,%d,400)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Méc/#laydotim8(%d,%d,%d,%d,%d,%d,%d,410)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Háa/#laydotim8(%d,%d,%d,%d,%d,%d,%d,420)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Thæ/#laydotim8(%d,%d,%d,%d,%d,%d,%d,430)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng VËt lý hÖ Néi c«ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,440)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng B¨ng s¸t hÖ Néi c«ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,450)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng Ho¶ s¸t hÖ Néi c«ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,460)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng L«i s¸t hÖ Néi c«ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,470)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng §éc hÖ Néi c«ng/#laydotim8(%d,%d,%d,%d,%d,%d,%d,480)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim7(%d,%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function laydotim8(nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1)
		local szTitle = "Mêi chän dßng Èn 3:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng vËt lý hÖ Ngo¹i c«ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,10)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng c«ng kÝch chÝnh x¸c/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,20)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng tèc ®é xuÊt chiªu hÖ Ngo¹i c«ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,30)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Bá qua tèc ®é di chuyÓn cña ®èi ph­¬ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,40)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Kh«ng thÓ ph¸ hñy/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,50)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng phßng thñ vËt lý/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,60)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng tèc ®é di chuyÓn/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,70)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng ph¶n ®ßn cËn chiÕn/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,80)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Gi¶m thêi gian bÞ th­¬ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,90)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng ph¹m vi s¸t th­¬ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,100)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp tÊt c¶ vò khÝ/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,110)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Kh¸ng tÊt c¶/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,120)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Trang sau/#trangsau5(%d,%d,%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangsau5(nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1)
		local szTitle = "Mêi chän dßng Èn 3:"
		local tbOpt = {}
		tinsert(tbOpt, format("Hót sinh lùc ®èi ph­¬ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,130)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Hót Néi lùc ®èi ph­¬ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,140)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Sinh lùc t¨ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,150)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Néi lùc t¨ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,160)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("ThÓ lùc t¨ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,170)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Mçi nöa gi©y Sinh lùc håi phôc/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,180)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Mçi n÷a gi©y Néi lùc håi phôc/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,190)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Mçi n÷a gi©y ThÓ lùc håi phôc/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,200)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Søc m¹nh t¨ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,210)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng VËt lý hÖ Ngo¹i c«ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,220)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng ®éc s¸t hÖ Ngo¹i c«ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,230)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng b¨ng s¸t hÖ Ngo¹i c«ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,240)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Trang sau/#trangke5(%d,%d,%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim8(%d,%d,%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangke5(nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1)
		local szTitle = "Mêi chän dßng Èn 3:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng b¨ng háa hÖ Ngo¹i c«ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,250)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng b¨ng L«i hÖ Ngo¹i c«ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,260)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("ChuyÓn hãa s¸t th­¬ng thµnh Néi lùc/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,270)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Phßng thñ t¨ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,280)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Phßng ®éc t¨ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,290)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Phßng b¨ng t¨ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,300)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Phßng háa t¨ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,310)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Phßng L«i t¨ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,320)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng Ngo¹i c«ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,330)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Gi¶m cho¸ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,340)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng May m¾n/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,350)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Gi¶m ®éng t¸c lµm chËm/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,360)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Trang sau/#trangtiep5(%d,%d,%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim8(%d,%d,%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	function trangtiep5(nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1)
		local szTitle = "Mêi chän dßng Èn 3:"
		local tbOpt = {}
		tinsert(tbOpt, format("T¨ng th©n ph¸p/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,370)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Gi¶m thêi gian tróng ®éc/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,380)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Kim/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,390)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Thñy/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,400)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Méc/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,410)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Háa/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,420)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng ®¼ng cÊp kü n¨ng hÖ Thæ/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,430)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng VËt lý hÖ Néi c«ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,440)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng B¨ng s¸t hÖ Néi c«ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,450)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng Ho¶ s¸t hÖ Néi c«ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,460)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng L«i s¸t hÖ Néi c«ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,470)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("T¨ng s¸t th­¬ng §éc hÖ Néi c«ng/#laydotim9(%d,%d,%d,%d,%d,%d,%d,%d,480)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, format("Trang tr­íc/#laydotim8(%d,%d,%d,%d,%d,%d,%d,%d)",nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1))
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
		Say(szTitle, getn(tbOpt), tbOpt)	
	end
	
	function laydotim9(nIndex, nType, nSeries, nSeries2, nPlopr, nPlopr1, nCont, nCont1, nCont2)
		local tbEquipSelect = %tbItemName[nType]["tbEquip"][nIndex]
		local tbOpt = {}
		AddQualityItem(2, tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries,0, nSeries2, nPlopr, nPlopr1, nCont, nCont1, nCont2)
	end
	
	