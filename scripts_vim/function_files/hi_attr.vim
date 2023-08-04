function! Echo_hi_attr_testing()
	echo "---- FoldColumn fg ----"
	echo "attr: " synIDattr(hlID("FoldColumn"), "fg")
	echo "trans: " synIDattr(synIDtrans(hlID("FoldColumn")), "fg")

	echo "----- Linked group CursorLineSign, --> SignColumn ----"  
	echo "attr: " synIDattr(hlID("CursorLineSign"), "bg")
	echo "trans: " synIDattr(synIDtrans(hlID("CursorLineSign")), "bg")

	echo "--- Special Key ---"
	echo "attr: " synIDattr(hlID("SpecialKey"), "bg")
	echo "trans: " synIDattr(synIDtrans(hlID("SpecialKey")), "bg")
endfunction
