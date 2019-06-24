Procedure WSettings(key$,value$)
  
If FileExists(settingsfile$)
  OpenPreferences(settingsfile$)
Else
  CreatePreferences(settingsfile$)
EndIf
  
  WritePreferenceString(key$,value$)
  ClosePreferences()
  
  ProcedureReturn
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP