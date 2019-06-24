Procedure SetSiteTitle(file$,t$)
  
If FileExists(file$) = 1
  
  *json = FileGetContents(file$)
  
If CatchJSON(1, *json, MemorySize(*json))
  
  ObjectValue = JSONValue(1)

If ExamineJSONMembers(ObjectValue)
    
While NextJSONMember(ObjectValue)

  site$ = JSONMemberKey(ObjectValue)
      
If site$=ttl$
      
  o=JSONMemberValue(ObjectValue)
                      
  SetJSONString(o,t$) 
        
EndIf
        
Wend
    
EndIf
  
  SaveJSON( 1, file$ , #PB_JSON_PrettyPrint  )
  
EndIf
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP