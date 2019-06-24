Macro Gadgets()
  
  tbh = ToolBarHeight(#toolbar)
  sbh=StatusBarHeight(#statusbar)
  mh = MenuHeight()
  
  ContainerGadget(#container,0,tbh,w,h-(sbh+tbh+mh))
  
  ListIconGadget(#files,2,2,w-4,h-(4+tbh+sbh+mh),name$,450,#PB_ListIcon_FullRowSelect|#PB_ListIcon_MultiSelect)
  AddGadgetColumn(#files,1,size$,100)
  AddGadgetColumn(#files,2,dateadded$,200)
  
  HyperLinkGadget(#hyperlink,5,5,450,sbh,"",RGB(255,0,0))
    
  SetParent_(GadgetID(#hyperlink), StatusBarID(#statusbar))
  
  HideGadget(#hyperlink,1)
  
EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = -
; EnableXP