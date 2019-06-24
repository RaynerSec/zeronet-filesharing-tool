Macro Timer()
  
If EventTimer()=1
  
If IsThread(thread)=0
  
If zipdone=1
  
  RemoveWindowTimer(0,0)

  ProcedureReturn 1
  
Else
  
  thread = CreateThread( @DownloadZip() , #Null )
  
EndIf
  
Else
  
  SetFrame()
  
EndIf

EndIf
  
EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP