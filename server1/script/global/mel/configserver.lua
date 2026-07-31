----------------------------------------------------------------------------------------------------
--                                         Config Server                                          --
--                                    Vâ L©m TruyÒn Kú Offline                                    --
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--                                           TÝnh N¨ng                                            --
----------------------------------------------------------------------------------------------------
--[START Khëi §Çu] 
	--[CÊp §é T¹o Nh©n VËt]
		CapKhiLoginVaoServer = 1 --CÊp §é T¹o Nh©n VËt [0: §ãng, 1: Më]
			-- 0: §ãng, 1: Më
		CapDo = 10 --CÊp khi khëi t¹o nh©n vËt lÇn ®Çu 
			-- §¨ng nhËp lÇn ®Çu sÏ nhËn cÊp CapDo
		Cfg_NhanTanThu = 1 -- [0: §ãng, 1: Më]
	--[Giíi H¹n IP]
		GioiHanLoginIP = 0 -- Giíi H¹n IP [0: §ãng, 1: Më]
		SoLuongAccGioiHan = 8 --Sè l­îng IP tèi ®a cã thÓ Login/m¸y
			--Tèi ®a 8 Acc

	--[Thö NghiÖm M¸y Chñ]
		ThuNghiemMayChu = 0 -- Thö NghiÖm M¸y Chñ [0: §ãng, 1: Më]
		-- TÝnh n¨ng Thñ NghiÖm t¹i NPC L·nh Ng¹o ThÇn ë Héi Qu¸n Vâ L©m (NhËn tÊt c¶ ®å vµ vËt phÈm)
		-- Bao gåm Cöa hµng Thö NghiÖm vµ TuyÖt §Ønh
--[STOP]--
----------------------------------------------------------------------------------------------------
--[START NhiÖm Vô]--
	--[NhiÖm Vô Mçi Ngµy]
		NhiemVuMoiNgay = 1 -- NhiÖm Vô Mçi Ngµy [0: §ãng, 1: Më]
	--[NhiÖm Vô Hoµng Kim Long Ngò]
		NPCLongNgu = 1 -- NhiÖm Vô Hoµng Kim Long Ngò [0: §ãng, 1: Më]
		--ChØ lµm ë Ba L¨ng HuyÖn			
--[STOP]
----------------------------------------------------------------------------------------------------
--[START Sö dông VËt PhÈm]
	--[Giíi h¹n sö dông]
		GioiHanTTK = 200 --Giíi h¹n sö dông TÈy Tñy Kinh
		GioiHanVLMT = 200 --Giíi h¹n sö dông Vâ L©m MËt TÞch
--[STOP]
----------------------------------------------------------------------------------------------------
--[START NPC]
	--[Npc TiÒn Trang]
		NPCTienTrang = 1 -- Npc TiÒn Trang [0: §ãng, 1: Më] 
		--nÕu më Long Ngò
--[STOP]		
----------------------------------------------------------------------------------------------------
--[START TÝnh N¨ng]
	--[§æi TiÒn TÖ t¹i TiÒn Trang]
		DoiTienTe = 0 -- §æi TiÒn TÖ t¹i TiÒn Trang [0: §ãng, 1: Më]
		-- §æi TiÒn TÖ t¹i TiÒn Trang (TiÒn V¹n <=> TiÒn §ång) - Kh«ng nªn bËt ®Ó tr¶i nghiÖm game tèt h¬n
	--[S­ ®å thiÕp]
			SuDoThiep = 0 -- TÝnh n¨ng S­ §å [0: §ãng, 1: Më]
	--[§å TÝm]
		DucVatPham = 1 -- BËt t¾t ®óc vËt phÈm [0: §ãng, 1: Më]
		AllowCheTaoDoTim = 1 -- BËt t¾t chÕ ®å tÝm [0: §ãng, 1: Më]
	--[Kú Tr©n C¸c]
		OpenShopKTC = 1 -- BËt t¾t Kú Tr©n C¸c [0: §ãng, 1: Më]
--[STOP]		
----------------------------------------------------------------------------------------------------
--[START HÖ Thèng Kü N¨ng]
	--[Gia nhËp m«n ph¸i]
		HoTroKyNangGiaNhapPhai = 1 --Hç trî Kü N¨ng 10-60 khi gia nhËp m«n ph¸i [0: §ãng, 1: Më]
	--[Kü N¨ng 120]
		HocKyNang120 = 1 -- Kü N¨ng 120 [0: §ãng, 1: Më]
--[STOP]

--[START Héi Qu¸n Vâ L©m]
	NPCAutoChat = 1 -- NPC tù ®éng nãi chuyÖn t¸n gÉu - 0: §ãng, 1: Më	
	Cfg_DoiTenNhanVat = 1 -- §æi tªn Nh©n VËt - 0: §ãng, 1: Më
	--[§å Xanh - Thanh Thñy TiÓu Tiªn]
	Cfg_HoanDoiVuKhiXanh = 1 -- Ho¸n ®æi vò khÝ xanh cÊp 10 - 0: §ãng, 1: Më
	Cfg_CheTaoTrangBiXanh = 1 -- ChÕ t¹o ®å xanh - 0: §ãng, 1: Më
	
	--[TuyÖt §Ønh Vò §Õ]
		Cfg_TrungSinh = 1 -- Trïng sinh Nh©n VËt - 0: §ãng, 1: Më
		Cfg_TuyetDinhTrangBi = 1 -- N©ng cÊp trang bÞ [0: §ãng, 1: Më]
			-- N©ng cÊp TuyÖt §Ønh Trang BÞ: NhÉn, MÆt N¹, Phi Phong, Trang Søc, Ên, Trang bÞ HKMP Max
		Cfg_TuyetDinhVuKhi = 1 -- N©ng cÊp Vò KhÝ [0: §ãng, 1: Më]
			-- TuyÖt §Ønh Vò KhÝ (Bao gåm rít nguyªn liÖu vµ n©ng cÊp)
	--[Boss TuyÖt §Ønh Vò §Õ]
		Cfg_BossTuyetDinhVuDe = 1 -- Th¸ch ®Êu TuyÖt §Ønh Vò §Õ - 0: §ãng, 1: Më
		KinhNghiemGietBossTuyetDinhVuDe = 50000000 --Kinh nghiÖm giÕt Vò §Õ
		KinhNghiemNguoiChoiDungXungQuanhVuDe = 10000000 --Kinh nghiÖm ng­êi ch¬i xung quanh
		TyLeRotTranBangChiBao = 100 -- TØ lÖ rít TrÊn Bang Chi B¶o%
--[STOP]
----------------------------------------------------------------------------------------------------
--[START VËt PhÈm - Trang BÞ]
Cfg_VoLamLenh = 1 -- §æi Vâ L©m LÖnh - 0: §ãng, 1: Më
Cfg_PhongHoaLenh = 1 -- §æi Phong Háa LÖnh - 0: §ãng, 1: Më
Cfg_HoangKimLenh = 1 -- §æi Hoµng Kim LÖnh - 0: §ãng, 1: Më
Cfg_TrangBiKimQuang = 1 -- §æi Set Kim Quang - 0: §ãng, 1: Më

----------------------------------------------------------------------------------------------------
--[HÖ Thèng N©ng CÊp]
Cfg_NangCapAn = 1 -- N©ng cÊp Ên - 0: §ãng, 1: Më
Cfg_NangCapTrangSuc = 1 -- N©ng cÊp Trang Søc - 0: §ãng, 1: Më
Cfg_NangCapNgua = 1 -- N©ng cÊp Ngùa - 0: §ãng, 1: Më
Cfg_NangCapMatNa = 1 -- N©ng cÊp MÆt N¹ - 0: §ãng, 1: Më
Cfg_NangCapPhiPhong = 1 -- N©ng cÊp Phi Phong - 0: §ãng, 1: Më

----------------------------------------------------------------------------------------------------
--[HÖ Thèng Cöa Hµng]
Cfg_CuaHangTienVan = 1 -- Cöa hµng TiÒn V¹n - Ng©n Linh Nhi - 0: §ãng, 1: Më
Cfg_CuaHangPhucDuyen = 1 -- Cöa hµng Phóc Duyªn - Hång Duyªn Muéi - 0: §ãng, 1: Më
Cfg_CuaHangVinhDu = 1 -- Cöa hµng Vinh Dù - Ngù Vinh ThÇn - 0: §ãng, 1: Më
Cfg_CuaHangTongKim = 1 -- Cöa hµng Tèng Kim - ThiÕt HuyÕt T­íng - 0: §ãng, 1: Më
Cfg_CuaHangNgua = 1 -- Cöa hµng Ngùa - ThiÕt M· Hïng - 0: §ãng, 1: Më
Cfg_CuaHangVuKhi10 = 1 -- Cöa hµng Vò KhÝ cÊp 10 t¹i Thî RÌn - 0: §ãng, 1: Më
Cfg_CuaHangBiKip = 1 -- Cõa hµng BÝ KÝp - V¹n Ph¸p V« Danh - 0: §ãng, 1: Më

----------------------------------------------------------------------------------------------------
--[BÇu Cua - NPC Lôc Linh Tiªn Sinh t¹i Héi Qu¸n Vâ L©m]
ThoiGianBatDauBauCua = 1000
ThoiGianKetThucBauCua = 2200
ThoiGianBatDauBauCuaText = "TÝnh n¨ng ch­a ®­îc khai më. Vui lßng quay l¹i sau"
ThoiGianKetThucBauCuaText = 12
--[STOP]
----------------------------------------------------------------------------------------------------
--                                            Ho¹t §éng                                           --
----------------------------------------------------------------------------------------------------
--[START Ho¹t §éng]
	--[D· TÈu]
		NPCDaTau = 1 -- BËt t¾t Npc D· TÈu [0: §ãng, 1: Më]
		So_Lan_Da_Tau_Trong_Ngay = 40 -- Giíi h¹n nhiÖm vô D· TÈu trong ngµy
		Dang_Cap_Lam_Co_The_Lam_NV_Da_Tau = 90 -- CÊp ®é yªu cÇu cho phÐp lµm nhiÖm vô D· TÈu
		DaTauDoChiMatChi = 1 -- 0: D· TÈu nguyªn b¶n, 1: D· TÈu chØ lµm nhiÖm vô §å ChÝ vµ MËt ChÝ
		PhanThuongTienVan = 0.15 --TØ lÖ phÇn th­ëng tiÒn v¹n
		PhanThuongKinhNghiem = 2 -- TØ lÖ phÇn th­ëng kinh nghiÖm 
		HoanThanhDaTau = 1 -- Hoµn thµnh nhanh D· TÈu 0: §ãng, 1: Më
		SoTienHoanThanhDaTau = 50 -- Sè tiÒn hoµn thµnh D· TÈu (v¹n l­îng)

----------------------------------------------------------------------------------------------------
--[Phong L¨ng §é]
	PhongLangDo = 1 -- BËt t¾t Phong L¨ng §é [0: §ãng, 1: Më]
	-- B¾t ®Çu b¸o danh mçi giê lóc phót thø 45. VÝ dô: 1:45, 2:45, 3:45, ..., 22:45, 23:45
	SoLanDiThuyenPLDTrongNgay = 3 -- Giíi h¹n sè lÇn ®i Phong L¨ng §é trong ngµy
	ThoiGianBaoDanhPLD = 5 -- Thêi gian b¸o danh PLD
	ThoiGianDiThuyenPLD = 15 -- Thêi gian ®i thuyÒn

----------------------------------------------------------------------------------------------------
--[NhÝp ThÝ TrÇn]
	NPCNhipThiTran = 1 --BËt t¾t Npc san Boss S¸t Thñ 0: §ãng, 1: Më
	--[Boss S¸t Thñ]
	SoLuongBossSatThuTrongNgay = 15 -- Sè l­îng nhiÖm vô hoµn thµnh trong ngµy
	--[V­ît ¶i]
	SoNguoiThapNhatThamGiaVuotAi = 1 --Sè ng­êi tèi thiÓu tham gia v­ît ¶i
	SoLanVuotAiTrongNgay = 2 -- Giíi h¹n sè lÇn ®i V­ît ¶i trong ngµy

----------------------------------------------------------------------------------------------------
--[Viem §Õ]
	CFG_ViemDe = 1 -- BËt t¾t ViÕm §Õ [0: §ãng, 1: Më]
----------------------------------------------------------------------------------------------------
--[Tèng Kim]
	ThamGiaTongKim = 1 -- BËt t¾t Tèng Kim [0: §ãng, 1: Më]
	SoLanThamGiaTongKimTrongNgay = 3 -- Giíi h¹n sè lÇn ®i Tèng Kim trong ngµy
	ThoiGianOpenTK = {0100, 0300, 0500, 0700, 0900, 1100, 1300, 1500, 1700, 1900, 2100, 2300} --B¸o danh giê lÎ]
	ThoiGianBaoDanhTK = 2 -- Thêi gian b¸o danh (Phót)
	ThoiGianChienDauTK = 40 -- Thêi gian chiÕn ®Êu (Phót)
	SoDiemToiDaMoiTran = 200000 -- Sè ®iÓm tèi ®a mçi trËn khi ®¸nh ng­êi ch¬i
	GioiHanChenhLechTK = 8 -- Chªnh lÖch ng­êi ch¬i mçi bªn
	KiemTraIpChongBoostDiemTongKim = 1 -- Tèng Kim cïng IP chØ vµo ®­îc mét bªn - 0: §ãng, 1: Më
	KhongCoNguoiDanhLenDiemTongKim = 1 -- §¸nh NPC lªn ®iÓm Tèng Kim - 0: §ãng, 1: Më

----------------------------------------------------------------------------------------------------
--[Phong Háa Liªn Thµnh]
	HoatDongPHLT = 1 -- BËt t¾t Phong Háa Liªn Thµnh [0: §ãng, 1: Më]
	SoLanThamGiaPHLTTrongNgay = 3 -- Giíi h¹n sè lÇn ®i Phong Háa Liªn Thµnh trong ngµy
	ThoiGianOpenPHLT = {0200, 0400, 0600, 0800, 1000, 1200, 1400, 1600, 1800, 2000, 2200}--B¸o danh giê ch½n
	ThoiGianBaoDanhPHLT = 2 -- Thêi gian b¸o danh (Phót)
	ThoiGianThuThanhPHLT = 40 -- Thêi gian thñ thµnh (Phót)

----------------------------------------------------------------------------------------------------
--[TriÖu håi Boss Hoµng Kim ]
	--[Thiªn C¬ L·o Nh©n]
		Cfg_TrieuHoiBossHoangKim = 1 -- TriÖu håi Boss TiÓu & Boss §¹i - 0: §ãng, 1: Më
	--[Boss TiÓu Hoµng Kim]
		KinhNghiemGietBossTieu = 2000000 -- Kinh nghiÖm khi giÕt boss tiÓu

	--[Boss §¹i Hoµng Kim]
		SoLuongBossHoangKimGoiRa = 20  --Sè l­îng Boss Hoµng Kim gäi ra mçi lÇn, tèi ®a lµ 20
		KinhNghiemGietBoss = 10000000 -- Kinh nghiÖm khi giÕt boss
		KinhNghiemNguoiChoiDungXungQuanh = 5000000 -- Kinh nghiÖm ng­êi xung quanh nhËn
		TyLeRotDoPho = 0 -- TØ lÖ rít ®æ phæ (%)
		TyLeRotTrangBiHoangKim = 30 -- TØ lÖ rít trang bÞ hoµng kim (%)
--[STOP]
----------------------------------------------------------------------------------------------------