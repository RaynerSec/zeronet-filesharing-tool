Procedure DownloadZeroNet()
 
  d$ = appdir$
  
  zip$ = d$ + GetFilePart(zdl$)
  
  InitNetwork()
    
  ReceiveHTTPFile(zdl$,zip$)
  
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

  DeleteFile(zip$)

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP