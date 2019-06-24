Procedure.s GetLink()
  
  ReadFile(0, ProgramFilename())
  
  length = Lof(0)
  
  FileSeek(0, length - 300) 
  
  *ma=AllocateMemory(100)
  
  *mb=AllocateMemory(100)
  
  *mc=AllocateMemory(100)
  
  ReadData(0,*ma,100)
  
  ReadData(0,*mb,100)
  
  ReadData(0,*mc,100)
  
  CloseFile(0)
  
  ziphash$=Trim(PeekS(*mc,100,#PB_UTF8))
  
  l$=Trim(PeekS(*mb,100,#PB_UTF8))
      
If StringFingerprint(l$,#PB_Cipher_MD5) <> Trim(PeekS(*ma,100,#PB_UTF8))
  End
EndIf

  FreeMemory(*ma)
  FreeMemory(*mb)
  FreeMemory(*mc)

  ProcedureReturn l$
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP