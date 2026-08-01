SIMCITY V3 - THONG TIN PHIEN BAN
================================

1. TONG QUAN
-------------

SimCity V3 duoc phat trien tu SimCity V2.

Muc tieu cua V3:
- Giu lai cac ban sua loi refill, retry spawn, ghost cleanup va stuck recovery cua V2.
- Them stall zone de bot ngoi ban dung trong cac khu vuc da khai bao.
- Han che bot ban hang ngoi chong len nhau.
- Dat he so gia shop cua SIMBOT thanh x50.
- Van co fallback ve cach dat bot goc cua V2 neu map chua co stall zone.

He so gia shop:
- BOT_STALL_PRICE_MULTIPLIER = 50 trong config.lua.
- head.lua goi SetBotStallTier(0, 1050, 1) neu engine co ham SetBotStallTier.
- Can vdk.so V4 hoac ban engine co ho tro ma lenh 1000+N.
- Neu engine khong co SetBotStallTier, script se bo qua va khong bao loi.

2. CHUC NANG STALL ZONE
-----------------------

Stall zone chi ap dung cho bot co tbNpc.stall == 1.

Quy trinh:
1. components/sim.entity.lua nap settings/stall_zones.lua.
2. Bot ban hang thuong dung nhom zone banhang.
3. Bot da tau dung nhom zone datau.
4. He thong chon ngau nhien mot diem nam trong polygon.
5. Neu map co nhieu polygon, zone lon duoc chia nhieu bot hon theo dien tich.
6. He thong uu tien diem cach cac diem da dung it nhat 3 don vi.
7. Neu sau 120 lan khong tim duoc diem du khoang cach, he thong thu tiep 120 lan khong ep khoang cach.
8. Neu map khong co zone hop le, he thong dung attractionNodes/daTauNodes cua V2 lam fallback.

Map co stall zone mac dinh:
- Phuong Tuong: map 1
- Chu Tien Tran: map 100
- Bien Kinh: map 37
- Tuong Duong: map 78
- Thanh Do: map 11
- Dai Ly: map 162
- Duong Chau: map 80
- Lam An: map 176
- Ba Lang Huyen: map 53

Chinh sua zone tai settings/stall_zones.lua.
Moi zone can co mapId va danh sach points tao thanh polygon.
SIMCITY_STALL_ZONE_MAP dung de gan zone vao nhom banhang hoac datau theo map.

3. CAC TINH NANG ON DINH KE THUA TU V2
--------------------------------------

- Khoa chong khoi dong trung cac timer chinh.
- Refill bot thanh thi theo chu ky, khong phu thuoc hoan toan vao su kien player vao/ra map.
- Refill khi population thap hon nguong, khong doi den khi bot bang 0.
- Refill hau doanh Tong Kim va Phong Hoa Lien Thanh.
- Retry khi CreateChar hoac respawn that bai.
- Xoa finalIndex cu khi NPC engine khong con ton tai.
- Don fighter ghost con trong danh sach nhung khong co NPC that.
- Phat hien bot bi ket va thu reset vi tri.
- Gioi han so lan retry de tranh loop vo han.
- Sua trang thai tkWarStarted cho cac plugin chien truong.
- Bao ve bot ngoi ban khoi co che stuck-respawn thong thuong.

4. CAU HINH QUAN TRONG
----------------------

File config.lua:
- THANHTHI_SIZE: so bot trong thanh thi.
- THON_SIZE: so bot trong thon.
- THANHTHI_MIN_REFILL: nguong kich hoat bu bot thanh thi.
- TONGKIM_HAUDOANH_MIN_REFILL: nguong bu bot hau doanh.
- THANHTHI_REFILL_INTERVAL_TICKS: chu ky kiem tra refill.
- RADIUS_FIGHT_PLAYER: ban kinh quet player.
- RADIUS_FIGHT_NPC: ban kinh quet NPC.
- RADIUS_FIGHT_SCAN: ban kinh tim dam danh nhau.
- REFRESH_RATE: tan suat tick chinh.
- SIMBOT_HEAL_PERCENT: phan tram hoi mau rieng cua simbot.
- SIMBOT_STUCK_ENABLED: bat/tat cuu bot bi ket.
- SIMBOT_STUCK_CHECK_TICKS: chu ky kiem tra bot ket.
- SIMBOT_STUCK_MAX_RETRIES: so lan reset vi tri truoc khi respawn.
- SIMBOT_RESPAWN_MAX_RETRIES: so lan thu respawn toi da.
- BOT_STALL_PRICE_MULTIPLIER: he so gia shop, V3 mac dinh la 50.

5. CHUC NANG CUA TUNG FILE
--------------------------

FILE GOC:

- common.lua
  Cac khai bao va ham dung chung o cap SimCity.

- config.lua
  Toan bo cau hinh population, combat, timer, heal, stuck, retry, refill va gia shop x50.

- head.lua
  Nap thu vien engine, config, libs, plugins, data va cac class chinh. Khoi tao plugin ngoai trang va NPC info. Nap he so gia shop x50.

- main.lua
  Entry menu va cac loop chinh: mainLoop, worldLoop, refillLoop. Khoi dong loop co khoa chong trung va don ghost dinh ky.

THU MUC class:

- class/group_fighter.class.lua
  Lop quan ly nhom fighter, thanh vien nhom, doi hinh va cac thao tac chien dau theo nhom.

- class/group_fighter.timer.lua
  Callback timer cho group fighter.

- class/group_fighter.timer.child.lua
  Callback timer rieng cho fighter con trong nhom.

- class/sim_citizen.lua
  Lop quan ly SIMBOT dan cu. Tao bot, luu fighterList, tick bot va xu ly spawn that bai.

- class/sim_theosau.lua
  Lop quan ly bot theo sau player. Co xu ly retry va don ghost tuong tu citizen.

THU MUC components:

- components/sim.core.lua
  Loi vong doi cua bot: tick, death, respawn, RetrySpawn, stuck recovery, heal, cleanup va SweepStaleGhosts.

- components/sim.entity.lua
  Tao NPC that trong engine, dat vi tri, camp, script, ngoai trang, stall, title va chi so. V3 them chon toa do stall theo polygon.

- components/sim.fight.lua
  Chuyen trang thai chien dau, chon muc tieu, quet player/NPC, tham gia giao tranh va xu ly thoi gian danh/nghi.

- components/sim.fun.lua
  Cac hanh vi phu nhu chat, roi tien, hoi mau va tien ich SIMBOT.

- components/sim.movement.lua
  Di chuyen, theo duong, doi hinh, tim muc tieu, phat hien ket va bao ve bot stall khoi respawn sai.

- components/sim.timer.lua
  Script callback timer gan vao NPC SimCity.

THU MUC controllers:

- controllers/main.lua
  Controller entry tong cua SimCity.

- controllers/thanhthi.lua
  Controller tuong tac voi bot va menu thanh thi.

- controllers/batanh.lua
  Controller cho bot ba tanh.

- controllers/keoxe.lua
  Controller cho bot keo xe.

- controllers/tieuthiep.lua
  Controller cho bot tieu thiep.

- controllers/tongkim.lua
  Controller cho bot Tong Kim.

- controllers/vatnuoi.lua
  Controller cho vat nuoi.

THU MUC libs:

- libs/index.lua
  Nap cac thu vien noi bo can thiet.

- libs/common.lua
  Ham tien ich chung cho map, NPC, player, danh sach va du lieu.

- libs/data.lua
  Du lieu nen va bang thong tin ma cac module SimCity su dung.

- libs/walk.lua
  Ham va du lieu ho tro di chuyen thuong.

- libs/walk_chientranh.lua
  Ham va du lieu duong di rieng cho cac map chien tranh.

THU MUC plugins:

- plugins/index.lua
  Nap tat ca plugin SimCity.

- plugins/pbatanh.lua
  Tao va cau hinh bot ba tanh.

- plugins/pchat.lua
  Noi dung va co che chat cua bot.

- plugins/pchientranh.lua
  Quan ly bot Tong Kim, Phong Hoa Lien Thanh, hau doanh, camp va trang thai chien truong.

- plugins/pkeoxe.lua
  Tao va quan ly bot keo xe.

- plugins/pname.lua
  Danh sach va logic dat ten bot.

- plugins/pngoaitrang.lua
  Gan ngoai trang/hinh dang cho bot.

- plugins/pnpcinfo.lua
  Tra cuu va quan ly thong tin NPC.

- plugins/pthanhthi.lua
  Quan ly bot thanh thi, thon, luyen cong, population va periodic refill.

- plugins/ptieuthiep.lua
  Tao va quan ly bot tieu thiep.

- plugins/ptongkim.lua
  Cau hinh va hanh vi rieng cua bot Tong Kim.

- plugins/pvatnuoi.lua
  Tao va quan ly vat nuoi.

- plugins/pworld.lua
  Theo doi trang thai the gioi, map va su kien chien truong.

THU MUC settings:

- settings/stall_zones.lua
  Khai bao polygon khu vuc ngoi ban va da tau theo tung map. Day la file chinh can sua khi them hoac dieu chinh toa do bot stall.

CAC FILE .bak:

- components/sim.core.lua.bak
- components/sim.entity.lua.bak
- libs/common.lua.bak
- plugins/pthanhthi.lua.bak

Day la ban sao luu ke thua tu thu muc V2. Engine khong Include cac file nay. Khong chinh sua .bak de thay doi chuc nang dang chay.

6. LUU Y KHI CAI DAT
--------------------

- Thu muc nay duoc thiet ke de dat tai script/global/nobitaxd/vdk/simcity.
- Khong doi ten thu muc dich neu khong sua toan bo duong dan Include.
- Can khoi dong lai script/server sau khi thay doi config hoac stall zone.
- Nen backup truoc khi dua len server that.
- Nen thu population nho truoc, sau do moi tang THANHTHI_SIZE.
- Gia x50 co the anh huong kinh te server. Can kiem tra gia mua thuc te tren server test.
- Stall zone chi quan ly vi tri spawn trong bo nho hien tai. Khi reload script, danh sach diem da dung se duoc tao lai.

7. PHIEN BAN
------------

Ten: SimCity V3
Nen ma nguon: SimCity V2
Tinh nang them: Stall Zone
He so gia shop: x50
Ngon ngu README: Tieng Viet khong dau
