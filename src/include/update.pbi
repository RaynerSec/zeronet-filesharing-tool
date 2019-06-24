Procedure Update()
  
If InitNetwork()
  
  t$ = GetTemporaryDirectory()
  t$ = AddBackslash(t$)
  
  *download = ReceiveHTTPMemory(updateurl$)
  
  
If *download
    
  a=1
  
Repeat
  
  tmp$=t$+Str(a)
  
If IsFolder(tmp$)<>1
  
  Break
  
EndIf

  a+1
  
ForEver

If CreateDirectory(tmp$)
  
  fn$ = GetFilePart(updateurl$)
  p$ = AddBackslash(tmp$)
  
 
  f$=p$+fn$
  
If CreateFile(0,f$)
  
  s=MemorySize(*download)
  WriteData(0,*download,s)
  CloseFile(0)
  
If OpenPack(0, f$,#PB_PackerPlugin_Zip ) 
  
If ExaminePack(0)
  
  NextPackEntry(0)
  UncompressPackFile(0, p$ + PackEntryName(0))
  
  
If OpenFile(0, p$ + PackEntryName(0))
  
  s$ = ReadString(0,#PB_UTF8)
  CloseFile(0)
  
  r = FindString(s$,hash$)
    
If r
  
  g=1
  
  ver$ = Trim(Left(RemoveString(s$,hash$),32))
  
If ver$=version$
  
  MessageRequester(update$,noupdates$,#PB_MessageRequester_Info)
  
Else
  
  r=MessageRequester(update$,updateavailable$,#PB_MessageRequester_Info|#PB_MessageRequester_YesNo)
    
If r = #PB_MessageRequester_Yes
  
  OpenURL(url$)
    
EndIf
  
EndIf
  
EndIf
  
EndIf
  
EndIf

  ClosePack(0)
  
EndIf

  DeleteDirectory(tmp$,"*.*")

EndIf
    
EndIf

EndIf
  
EndIf

If g<>1
  
  MessageRequester(update$,updatefail$,#PB_MessageRequester_Error)
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP