Procedure DL(siteaddr$)
  
  prog = RunProgram( zeronetcmd$, sitedownload$+" " + siteaddr$ , "" , #PB_Program_Hide | #PB_Program_Open )
  
While ProgramRunning(prog)
  
  Delay(100)
  
Wend
  
  CloseProgram(prog)
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP