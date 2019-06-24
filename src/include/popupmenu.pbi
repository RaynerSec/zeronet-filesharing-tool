Macro PopupMenu()
  
  CreatePopupImageMenu(#popupmenu)
  MenuItem(#popupadd,add$,ImageID(#imgaddsm))
  MenuItem(#popupremove,remove$,ImageID(#imgremovesm))
  MenuItem(#popupcopylink,copylink$,ImageID(#imgcopy))
  
EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = -
; EnableXP