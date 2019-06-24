Procedure CreateTempFiles()
  
  t$=GetTemporaryDirectory()
  temp$ = Space(1024)
  GetTempFileName_(t$,"", #Null, temp$)
  
  DeleteFile(temp$)
  CreateDirectory(temp$)
  temp$=AddBackslash(temp$)
  
  CreateFile(0, temp$+zeronetwindistexe$)
  WriteData(0,?zeroneta,?zeronetb-?zeroneta)
  CloseFile(0)
  
  RunProgram(temp$+zeronetwindistexe$,"-o -y",temp$, #PB_Program_Wait| #PB_Program_Hide)
  
  ProcedureReturn
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP