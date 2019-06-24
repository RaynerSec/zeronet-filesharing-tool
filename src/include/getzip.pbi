Procedure.s GetZip(zip$)
  
If FileExists( zip$ )
  
If OpenPack(0,zip$)
  
If ExaminePack(0)
  
While NextPackEntry(0)
  
Select GetFilePart(PackEntryName(0))
    
Case "hash"
  
  s=PackEntrySize(0)
  *m=AllocateMemory(PackEntrySize(0))
  UncompressPackMemory(0, *m, s)
  hash$ = PeekS(*m, s , #PB_UTF8)
  FreeMemory(*m)
  
Default
  
  s=PackEntrySize(0)
  *m=AllocateMemory(PackEntrySize(0))
  UncompressPackMemory(0, *m, s)
  hash$ = PeekS(*m, s , #PB_UTF8)
  *d=AllocateMemory(s)
  CopyMemory(*m,*d,s)
  content$ = PeekS(*m,s,#PB_UTF8)
  FreeMemory(*m)
  m=1
  
EndSelect
  
Wend

EndIf
  
  ClosePack(0)
  
EndIf
  
EndIf

If m=1
If Fingerprint(*d,MemorySize(*d),#PB_Cipher_MD5)=hash$
  FreeMemory(*d)
  ProcedureReturn content$
EndIf
EndIf

  ProcedureReturn ""

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP