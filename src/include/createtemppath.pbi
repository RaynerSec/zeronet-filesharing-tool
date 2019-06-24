Procedure.s CreateTempPath()
  
  path$ = Space(10240)
  
  GetTempFileName_(GetTemporaryDirectory(),@"dl",0,path$)
  
  DeleteFile(path$)
  
  CreateDirectory(path$)
  
  ProcedureReturn path$
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP