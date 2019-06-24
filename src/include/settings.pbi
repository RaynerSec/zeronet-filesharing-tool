Procedure Settings()
  
  w=260:h=120
  
If OpenWindow(#windowsettings,0,0,w,h,settings$,#PB_Window_WindowCentered|#PB_Window_SystemMenu,WindowID(#window))
  
  hec = CheckBoxGadget(#PB_Any, 15,10,w-30,25, hideencdialog$)
  ndl = CheckBoxGadget(#PB_Any, 15,40,w-30,25, nodownloader$)
  
  SetGadgetState( hec, Val ( RSettings( sethideenc$ , zero$ )) )
  SetGadgetState( ndl, Val ( RSettings( setnodl$ , zero$ )) )
  
  ok = ButtonGadget(#PB_Any, w/2-40, 75, 80 , 25 , ok$)
  
  AddKeyboardShortcut(#windowsettings,#PB_Shortcut_Return,#enter)
  AddKeyboardShortcut(#windowsettings,#PB_Shortcut_Escape,#escape)
  
  DisableWindow(#window,1)
  
Repeat
  
  we = WaitWindowEvent()
  
Select we
    
Case #PB_Event_Menu
  
If EventMenu()=#escape
  
  CloseWindow(#windowsettings)
  Break
  
EndIf

If EventMenu()=#enter
  
  WSettings( sethideenc$ , Str ( GetGadgetState(hec) ) )
  WSettings( setnodl$ , Str ( GetGadgetState(ndl) ) )
  CloseWindow(#windowsettings)
  Break
  
EndIf

Case #PB_Event_Gadget
  
Select EventGadget()
    
Case ok
    
  WSettings( sethideenc$ , Str ( GetGadgetState(hec) ) )
  WSettings( setnodl$ , Str ( GetGadgetState(ndl) ) )
  CloseWindow(#windowsettings)
  Break
  
EndSelect
    
Case #PB_Event_CloseWindow
  
  CloseWindow(#windowsettings)
  Break
  
EndSelect

ForEver

  DisableWindow(#window,0)

EndIf
    
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP