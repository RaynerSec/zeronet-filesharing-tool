Procedure GetJsonMemberKeys(ObjectValue)
  
If ExamineJSONMembers(ObjectValue)

While NextJSONMember(ObjectValue)
  
Select JSONType(ObjectValue)
    
Case #PB_JSON_String

  Debug GetJSONString(ObjectValue)
  
Case #PB_JSON_Number 

  Debug GetJSONInteger(ObjectValue)
  
Case #PB_JSON_Boolean 
  
  GetJSONBoolean(ObjectValue)
  
Case #PB_JSON_Object 
  
  o=JSONMemberValue(ObjectValue)
  GetJsonMemberKeys(o)
  
EndSelect
    
  AddElement(Sites())
  Sites() = JSONMemberKey(ObjectValue) ;  + " = " + GetJSONString(JSONMemberValue(ObjectValue))
  
Wend

EndIf
 
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP