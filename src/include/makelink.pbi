Procedure.s MakeLink(txt.s,url.s)
 
  l$ = ReplaceString(link$,"#",URLEncoder(url))
  
  l$ = ReplaceString(l$,"*",txt)
  
  ProcedureReturn l$
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = -
; EnableXP