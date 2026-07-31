function main(itemIdx)
	local nCount = 100
	local nItemIndex = AddStackItem(nCount, 6, 1, 30596, 1, 0, 0)
	if not nItemIndex or nItemIndex <= 0 then
		Msg2Player("Kh«ng cã chç trèng hµnh trang ®Ó nhËn TuyÖt ThÕ Hoµn MÖnh §¬n.")
		return 1
	end
	Msg2Player("NhËn ®­îc 100 TuyÖt ThÕ Hoµn MÖnh §¬n.")
	return 1
end
