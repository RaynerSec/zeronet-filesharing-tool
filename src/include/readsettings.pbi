Procedure.s ReadSettings(settingsini$, key$,def$="")
  
  OpenPreferences(settingsini$)
  s$=ReadPreferenceString(key$,def$)
  ClosePreferences()
  
  ProcedureReturn s$
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP