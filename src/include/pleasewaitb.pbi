Procedure PleaseWaitB()
  
  thread=CreateThread(@DownloadLinksAndUnpack(),#Null)
  
  AddWindowTimer(0, 1, 100)
  HideGadget(1,1)
  
  ProgressBarGadget(3,30,40,240,30,0,numfiles)
  
  StatusBarText(2, 0, downloading$+" 1 of "+Str(numfiles), #PB_StatusBar_BorderLess)
  
Repeat
  
Select WindowEvent()
    
Case #PB_Event_CloseWindow
  
If IsProgram(prog)
If ProgramRunning(prog)
  KillProgram(prog)
EndIf
EndIf

If IsThread(thread)
  KillThread(thread)
EndIf
    
Case #PB_Event_Timer
  
If unpacking=1
  
  StatusBarText(2, 0, unpacking$, #PB_StatusBar_BorderLess)
  unpacking=2
  
EndIf
  
If count<=numfiles
  
If count<>lc
  
  StatusBarText(2, 0, downloading$+Str(count)+" of "+Str(numfiles), #PB_StatusBar_BorderLess)
  SetGadgetState(3,count)
  lc=count
  
EndIf
    
EndIf
  
If IsThread(thread)=0
  
  Break
  
EndIf
  
EndSelect

ForEver
 
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP