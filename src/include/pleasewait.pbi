Procedure PleaseWait()
  
  thread = CreateThread( @DownloadZip() , #Null )
  
  CatchImage(0,?loader)
  
If OpenWindow(0, 0, 0, 300, 140, "Downloader", #PB_Window_SystemMenu|#PB_Window_MinimizeGadget|#PB_Window_ScreenCentered)
  
  AddWindowTimer(0,1,GetImageFrameDelay(0))
  CreateStatusBar(2,WindowID(0))
  AddStatusBarField(240)
  
  StatusBarText(2, 0, "", #PB_StatusBar_BorderLess)
  ImageGadget(1, 50,-30-(StatusBarHeight(2)/2),200,200,ImageID(0))
  
Repeat
  
  Event = WindowEvent()
  
Select Event
    
Case #PB_Event_Timer
  
  Timer()

Case #PB_Event_CloseWindow
  
If IsProgram(prog)
If ProgramRunning(prog)
  KillProgram(prog)
EndIf
EndIf

If IsThread(thread)
  KillThread(thread)
EndIf

  Quit()
    
EndSelect

ForEver
  
EndIf

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP