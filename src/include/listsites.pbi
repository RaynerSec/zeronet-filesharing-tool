Procedure ListSites(siteaddr$="")
  
NewList MySites.s()
  
  GetFiles(mysites$,MySites())
  
ForEach MySites()
  
If FileExists(MySites())
  
  c=CountGadgetItems(#files)
  
  n$=ReadSettings(MySites(),setname$)
      
  AddGadgetItem(#files,c, n$ )
  
  s=Val(ReadSettings(MySites(),setsize$))
  
  d=Val(ReadSettings(MySites(),setdate$))
  
  SetGadgetItemText(#files,c,FormatByteSize(s),1)
    
  SetGadgetItemText(#files,c,FormatDate(datemask$,d),2)
  
  SetGadgetItemData(#files,c,s)
  
  filecount = Val(ReadSettings(MySites(),setfiles$))
  
  sa$=""
  
For a=1 To filecount
  
  sa$ = sa$ + " " + ReadSettings(MySites(),Str(a))
  
Next

  Adresses(n$)=GetFilePart(MySites())+ sa$

EndIf
  
Next

  FreeList(MySites())

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP