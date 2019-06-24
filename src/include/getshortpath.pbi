Procedure.s GetShortPath(long.s)
  
  short.s=Space(10240)
  
  GetShortPathName_(long,short,10240)
  
  ProcedureReturn short
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = -
; EnableXP