Procedure DownloadZeroNet(l$)
  
  Static t
  
  t+1
  
If t>2
  ProcedureReturn
EndIf

  d$ = appdir$
     
  zip$ = d$ + GetFilePart(GetURLPart(l$, #PB_URL_Path))
  
  InitNetwork()
    
If ReceiveHTTPFile(l$,zip$)
  
If OpenPack(0, zip$) 
        
If ExaminePack(0)
      
While NextPackEntry(0)
    
  file$ = d$ + PackEntryName(0)
  
  file$ = ReplaceString( file$ , "/", "\")
 
  CreateDirectory(GetPathPart(file$))
  
  UncompressPackFile(0, file$)
    
Wend
  
EndIf

  ClosePack(0)
  
EndIf

Else
  
  DownloadZeroNet(zdlm$)
  
EndIf

  DeleteFile(zip$)

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP