Procedure ShowMsg()
  
If IsWindow(#window)=0
  ProcedureReturn
EndIf
  
  DisableWindow(#window,1)
  
If OpenWindow(#PB_Any, 0, 0, 240, 120, "",  #PB_Window_ScreenCentered,WindowID(#window))
  
  TextGadget(#PB_Any,10,10,220,40,znkeeprunning$)
  
  cb = CheckBoxGadget(#PB_Any,20,50,200,20,donotshow$)
  ok = ButtonGadget(#PB_Any,80,80,80,25,ok$)
  
Repeat
  
  Event = WaitWindowEvent()
    
If Event = #PB_Event_Gadget And EventGadget()=ok
  
  WSettings( sethidemsg$ , Str ( GetGadgetState(cb) ) )
  Break
  
EndIf

ForEver
  
EndIf

End 
  
  
EndProcedure
Procedure Quit()
  
If Val ( RSettings( sethidemsg$ , zero$ )) = 0
  
If IsZeroNetRunning( LCase(zeronetexe$) , "", 1) <> 0
  
  Delay(500)
  
  ShowMsg()

EndIf

EndIf

If IsWindow(#window)
  
  CloseWindow(#window)
  
EndIf
  
  DeleteDirectory(temp$,pattern$,#PB_FileSystem_Recursive)
  
  End
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = 9
; EnableXP