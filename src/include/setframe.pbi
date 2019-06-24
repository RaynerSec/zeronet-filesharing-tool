Procedure SetFrame()
  
  Static frame 
 
  SetImageFrame(0, Frame)
  
  SetGadgetState(1, ImageID(0))
  
  frame+1
  
If Frame >= ImageFrameCount(0)
  
  Frame = 0
  
EndIf
  
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP