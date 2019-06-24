Procedure SortListIcon(column)
  
Static lc,lf

If column=lc
  
  flag = #PB_Sort_Descending
  
If lf = #PB_Sort_Descending
  
  flag = #PB_Sort_Ascending
  
Else
  
  flag = #PB_Sort_Descending
  
EndIf
  
Else
  
  flag = #PB_Sort_Ascending
  
EndIf
  
Structure LIcon
  
  name.s
  size.s
  s.i
  date.s
  
EndStructure

NewList L.Licon()
  
  ;Debug column
  
c=CountGadgetItems(#files)

For a=0 To c-1
  
  AddElement(L())
  L()\name = GetGadgetItemText(#files,a,0)
  L()\size = GetGadgetItemText(#files,a,1)
  L()\s = GetGadgetItemData(#files,a)
  L()\date = GetGadgetItemText(#files,a,2)
 
Next

Select column
    
Case 0
  
  SortStructuredList( L() , flag , OffsetOf(Licon\name) , TypeOf(Licon\name))  
  
Case 1
  
  SortStructuredList( L() , flag , OffsetOf(Licon\s) , TypeOf(Licon\s)) 
  
Case 2
  
  SortStructuredList( L() , flag , OffsetOf(Licon\date) , TypeOf(Licon\date)) 
  
EndSelect

  ClearGadgetItems(#files)

ForEach L()
  
  AddGadgetItem(#files,i,L()\name)
  SetGadgetItemText(#files,i,L()\size,1)
  SetGadgetItemText(#files,i,L()\date,2)
  SetGadgetItemData(#files,i,L()\s)
  
  i+1
  
Next

  lc=column
  lf=flag
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP