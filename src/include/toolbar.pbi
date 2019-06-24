Macro Toolbar()
  
  CreateToolBar(#toolbar,WindowID(#window),#PB_ToolBar_Large | #PB_ToolBar_Text )
  
  ToolBarImageButton(#toolbaradd, ImageID(#imgadd), #PB_ToolBar_Normal,add$)
  ToolBarSeparator()
  ToolBarImageButton(#toolbarremove, ImageID(#imgremove), #PB_ToolBar_Normal,remove$)
  ToolBarSeparator()
  ToolBarImageButton(#toolbarsettings, ImageID(#imgsettings), #PB_ToolBar_Normal,settings$)
  ToolBarSeparator()
  ToolBarImageButton(#toolbarupdate, ImageID(#imgupdate), #PB_ToolBar_Normal,update$)
  ToolBarSeparator()
  ToolBarImageButton(#toolbarweb, ImageID(#imgweb), #PB_ToolBar_Normal,website$)
  ToolBarSeparator()
  ToolBarImageButton(#toolbarabout, ImageID(#imgabout), #PB_ToolBar_Normal,about$)
  ToolBarSeparator()
  ToolBarImageButton(#toolbardonate, ImageID(#imgdonate), #PB_ToolBar_Normal,donate$)
  ToolBarSeparator()
  
  
EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP