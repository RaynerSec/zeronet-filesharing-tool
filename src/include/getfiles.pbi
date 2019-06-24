Procedure GetFiles(directory.s, List LinkedList.s())
  
  directory=AddBackslash(directory)
  
If ExamineDirectory(0, directory, pattern$)  

While NextDirectoryEntry(0)
  
If DirectoryEntryType(0) = #PB_DirectoryEntry_File
  
  e$ = directory+DirectoryEntryName(0)
  
  AddElement(LinkedList())
  LinkedList() = e$
      
EndIf

Wend

  FinishDirectory(0)

EndIf
  
  ProcedureReturn 1

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = -
; EnableXP