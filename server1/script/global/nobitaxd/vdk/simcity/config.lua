CHANCE_AUTO_ATTACK = 1    -- 1/8000 co hoi chuyen sang chien dau
CHANCE_JOIN_FIGHT = 1     -- 1/3000 co hoi tham gia danh nhau khi di ngang qua dam danh nhau
CHANCE_ATTACK_PLAYER = 1  -- 1/3000 co hoi danh nguoi neu den gan nguoi choi dang chien dau

STARTUP_AUTOADD_THANHTHI = 1 -- tu dong moi nhan si tren tat ca ban do
THANHTHI_SIZE = 300   		 -- so luong nhan si trong thanh thi
THON_SIZE = 50               -- so luong bot trong THON nho (it hon thanh, chong ket/chay 1 cho)
THANHTHI_QUAI = 0			 -- co cho phep quai nhan tu dong xuat hien trong thanh thi hay khong
LUYENCONG_AUTOADD = 1		 -- tu dong them nhan si luyen cong vao map 9x
THANHTHI_MIN_REFILL = 10     -- [FIX] neu so bot con lai tren map < nguong nay thi tu dong bu them (truoc day chi bu khi map = 0 bot -> bot hao dan theo thoi gian khong bao gio hoi phuc)
TONGKIM_HAUDOANH_MIN_REFILL = 10   -- [FIX] tuong tu THANHTHI_MIN_REFILL nhung cho quan tiep vien Tong Kim/Phong Hoa Lien Thanh (plugins/pchientranh.lua taoHauDoanh)
THANHTHI_REFILL_INTERVAL_TICKS = 90*18   -- [FIX] chu ky quet dinh ky de bu bot (~90 giay/lan), doc lap voi su kien vao/ra map

RADIUS_FIGHT_PLAYER = 20     -- tam quet+tan cong player 
RADIUS_FIGHT_NPC = 8         -- tam quet NPC chung quanh va tan cong
RADIUS_FIGHT_SCAN = 8        -- tam quet dam danh nhau chung quanh de tham gia


CHANCE_CHAT = 10               -- 10/1000 co hoi noi chuyen moi giay
CHANCE_DROP_MONEY = 0 		   -- 1/10000 co hoi lam rot tien khi di chuyen


TIME_FIGHTING = { -- khoang thoi gian danh nhau  (45-120giay)
	minTs = 6000,
	maxTs = 6000
}

TIME_RESTING = { -- nghi ngoi, khong danh nhau lai trong vong thoi gian nay
	minTs = 0,
	maxTs = 1
}

-- TONG KIM setup
TONGKIM_SPAWN_MINSTAY = 0         -- thoi gian toi thieu o lai dai doanh truoc khi xong len
TONGKIM_SPAWN_MAXSTAY = 1        -- thoi gian toi da co the nup trong dai doanh


-- PARAM setup
PARAM_LIST_ID = 1                  -- param to store fighter id
PARAM_CHILD_ID = 2                 -- param to store child id
PARAM_TYPE = 3                     -- param to store type
REFRESH_RATE = 18                  -- refresh rate
BOT_VS_BOT = 1                     -- bot ngoai thanh TU tim+danh bot khac camp (BAT KE PK-mode/vi tri player). 0=tat
BOT_COMBAT_RADIUS = 20             -- tam quet bot combat

-- CHILD SIM CITIZEN/KEOXE setup
DISTANCE_CAN_CONTINUE = 5          -- start next position if within 3 points from destination
DISTANCE_CAN_SPIN = 2              -- when spinning make sure the check is tighter
SPINNING_WAIT_TIME = 0             -- wait time to correct position
CHAR_SPACING = 1                   -- spacing between fighter characters
DISTANCE_FOLLOW_PLAYER = 28        -- chay theo nguoi choi neu cach xa
DISTANCE_SUPPORT_PLAYER = 8        -- neu gan nguoi choi khoang cach 12 thi chuyen sang chien dau
DISTANCE_FOLLOW_PLAYER_TOOFAR = 30 -- neu qua xa nguoi choi vi chay nhanh thi phai bien hinh theo
DISTANCE_VISION = 15               -- qua 15 = phai respawn vi no se quay ve cho cu

LIFE_RESTORE_PERCENT = 5       -- phan tram life se duoc hoi lai moi 1s

-- [FIX] cac hang so nay da duoc code trong components/sim.core.lua, sim.fun.lua
-- tham chieu toi nhung bi thieu trong config.lua -> tinh nang "hoi mau rieng cho
-- simbot", "phat hien bot bi ket", "thu lai respawn" hoat dong sai/vo hieu hoa
-- am tham (vi cac bien nil se khien dieu kien check bi fail hoac dung fallback mac dinh).
SIMBOT_HEAL_PERCENT = 5                        -- % life hoi lai moi lan cho simbot (rieng, khac LIFE_RESTORE_PERCENT)
SIMBOT_HEAL_INTERVAL = 10 * 18 / REFRESH_RATE  -- chu ky hoi mau (~10 giay)
SIMBOT_STUCK_ENABLED = 1                       -- BAT tinh nang phat hien+cuu bot bi ket 1 cho (truoc day bi thieu -> tat am tham)
SIMBOT_STUCK_CHECK_TICKS = 30 * 18 / REFRESH_RATE  -- chu ky kiem tra bot co bi ket khong (~30 giay)
SIMBOT_STUCK_MAX_RETRIES = 2                   -- so lan thu resetPos truoc khi respawn han bot bi ket
SIMBOT_RESPAWN_RETRY_TICKS = 5 * 18 / REFRESH_RATE  -- khoang cach giua cac lan thu respawn lai (~5 giay)
SIMBOT_RESPAWN_MAX_RETRIES = 3                 -- so lan thu respawn lai truoc khi xoa han fighter (RetrySpawn)
SIMBOT_POPULATION_CHECK_TICKS = 60 * 18        -- (du phong, xem ghi chu ben duoi ve THANHTHI_REFILL_INTERVAL_TICKS)

ENABLE_BANNGUAMIXDEV = 0	   -- sua lai thanh 1 neu xai ban mix dev vi bi mat ban ngua

-- SIMCITY V3: he so gia ban cua tat ca SIMBOT ngoi ban.
-- Can vdk.so V4 co ho tro SetBotStallTier. Gia tri 50 = gia goc x50.
BOT_STALL_PRICE_MULTIPLIER = 50
