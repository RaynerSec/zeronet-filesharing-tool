Procedure Status()
  
  Static l$
  
  c=CountGadgetItems(#files)
  
  t$=" "
  
If c>0
  
For a=0 To c-1
  
If GetGadgetItemState(#files,a) = #PB_ListIcon_Selected 
  
  t$ = " " + prefix$ + StringField( Adresses ( GetGadgetItemText(#files,a)) , 1, " ")
  
If t$<>l$
  
  SetGadgetText(#hyperlink,t$)
  HideGadget(#hyperlink,0)
  
EndIf
  
  l$=t$
  
  ProcedureReturn
  
EndIf

Next

EndIf

If t$<>l$
  
  HideGadget(#hyperlink,1)
  
EndIf

  l$=t$

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP