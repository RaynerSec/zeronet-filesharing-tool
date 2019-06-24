Procedure OpenURL(addr.s)
  
If IsProgram(process)
  
If ProgramRunning(process)=0
  
  CloseProgram(process)
  
  process = RunProgram(zeronetfolder$+zeronetexe$,openbrowser$,"",#PB_Program_Open)
  
EndIf

Else
  
  process = RunProgram(zeronetfolder$+zeronetexe$,openbrowser$,"",#PB_Program_Open)
  
EndIf
  
  RunProgram(prefix$+addr)
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP