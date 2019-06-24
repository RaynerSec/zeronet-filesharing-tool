Procedure DeleteSite(file$,sitetodel$)
  
If FileExists(file$) = 1
  
  *json = FileGetContents(file$)
  
If CatchJSON(1, *json, MemorySize(*json))
  
  RemoveJSONMember(JSONValue(1), sitetodel$)
  SaveJSON(1, file$,#PB_JSON_PrettyPrint)
  
EndIf

  FreeMemory(*json)

EndIf

  ProcedureReturn
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = -
; EnableXP