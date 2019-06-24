Procedure IsZeroNet()
  
Static no

If no=1
  
  ProcedureReturn
  
EndIf
  
If IsZeroNetRunning( LCase(zeronetexe$) , "", 1) = 0
  
If MessageRequester("",znclosed$,#PB_MessageRequester_YesNo) = #PB_MessageRequester_No
  
  no=1
    
Else
  
If IsProgram(process)
  CloseProgram(process)
EndIf

  process = RunProgram(zeronetfolder$+zeronetexe$,openbrowser$,"",#PB_Program_Open)
  
  zeronetprocessid=ProgramID(process)
  
EndIf
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP