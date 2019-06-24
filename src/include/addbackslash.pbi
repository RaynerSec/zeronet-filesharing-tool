Procedure.s AddBackslash(path.s)
  
If Right(path,1)<> "\"
  path=path+"\"
EndIf

ProcedureReturn path

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP