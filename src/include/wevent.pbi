Procedure WEvent(progress=0)
  
  Static frame 
 
If WindowEvent() = #PB_Event_Timer And EventTimer() = #timergif
  
  SetImageFrame(#imgloader, Frame)
  
  SetGadgetState(#loader, ImageID(#imgloader))
  
  frame+1
  
If Frame >= ImageFrameCount(#imgloader)
  
  Frame = 0
  
EndIf
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP