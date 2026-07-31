Include("\\script\\global\\nobitaxd\\vdk\\simcity\\head.lua")
--Include("\\script\\global\\nobitaxd\\vdk\\simcity\\controllers\\thanhthi.lua")
function main()
	SimCityThanhThi:mainMenu()
	return 1
end

-- Main loop
function mainLoop(nParam)
    SimCitizen:ATick()
	SimTheoSau:ATick()
	--SimCityKeoXe:ATick()
    AddTimer(REFRESH_RATE, "mainLoop", 0)
    -- SimCitizen:FastCastTick()   -- [2026-06-27 TAT: fast-cast + SetNpcFightTarget ghi de target engine-AI moi 0.7s -> pha bot-vs-bot da chay hom qua. Tra ve engine-AI tu nhien.
end 

function worldLoop(nParam)
	SimCityWorld:ATick(20)
    AddTimer(REFRESH_RATE*3, "worldLoop", 0)
end 

function SimCity_StartLoops()
    if SIMCITY_LOOP_STARTED == 1 then return 1 end
    SIMCITY_LOOP_STARTED = 1
    AddTimer(REFRESH_RATE, "mainLoop", 0)
    AddTimer(REFRESH_RATE*3, "worldLoop", 0)
    print("[SIMLIFE] loops started")
    return 1
end

-- [2026-06-27] fast-cast goi tu mainLoop (xem ham mainLoop) -> bo timer rieng (ko on dinh)
