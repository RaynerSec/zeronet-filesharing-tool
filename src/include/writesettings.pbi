Procedure WriteSettings(settingsini$,key$,value$)
  
If FileExists(settingsini$)
  OpenPreferences(settingsini$)
Else
  CreatePreferences(settingsini$)
EndIf
  
  WritePreferenceString(key$,value$)
  ClosePreferences()
  
  ProcedureReturn
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP