Procedure CreateTempFiles()
  
  t$=GetTemporaryDirectory()
  temp$ = Space(1024)
  GetTempFileName_(t$,"", #Null, temp$)
  
  DeleteFile(temp$)
  CreateDirectory(temp$)
  temp$=AddBackslash(temp$)
  
  CreateFile(0, temp$+zeronetdownloader$)
  WriteData(0,?zeronetdla,?zeronetdlb-?zeronetdla)
  CloseFile(0)

  ProcedureReturn
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP