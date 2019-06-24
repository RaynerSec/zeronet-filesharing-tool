Macro Statusbar()
  
  CreateStatusBar(#statusbar,WindowID(#window))
  AddStatusBarField(500)
  StatusBarText(#statusbar, 0, " ", #PB_StatusBar_BorderLess)
  
EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP