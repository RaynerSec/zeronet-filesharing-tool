Procedure CopyLink()
  
  c=CountGadgetItems(#files)
  
For a=0 To c-1
  
If GetGadgetItemState(#files,a) = #PB_ListIcon_Selected 
  
  addr$ = Trim ( StringField ( Adresses ( GetGadgetItemText( #files ,a ) ) , 1 , " " ) )
  
  SetClipboardText( prefix$ + addr$ )
  
  Break
  
EndIf
  
Next
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP