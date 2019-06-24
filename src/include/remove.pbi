Procedure Remove()
  
  c=CountGadgetItems(#files)
    
For a = 0 To c-1
  
If GetGadgetItemState(#files,a) = #PB_ListIcon_Selected
  
  a$ = Adresses( GetGadgetItemText(#files,a) )
  
If MessageRequester("",ReplaceString(removesite$,"*",GetGadgetItemText(#files,a)), #PB_MessageRequester_YesNo) = #PB_MessageRequester_No
  ProcedureReturn
EndIf
  
  ct=CountString(a$, " ")
  
If ct>0
  
For b=1 To ct+1
  
  sitetodel$ = Trim ( StringField( a$ , b , " " ) )
  
If Len(sitetodel$) > 10
  
  DeleteDirectory( datafolder$ + sitetodel$, pattern$, #PB_FileSystem_Recursive)
  
  DeleteFile( mysites$ + sitetodel$ )
  
  DeleteSite( datafolder$ + sitesjson$, sitetodel$ )
  
If rem<>1
  
  RemoveGadgetItem( #files , a )
  rem=1
  
EndIf
  
  ;Break
  
EndIf

  ;RemoveGadgetItem( #files , a )

Next

  ProcedureReturn

EndIf
  
EndIf
  
Next
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP