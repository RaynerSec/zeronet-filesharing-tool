Procedure Unpack(zipfile$, dest$)

If OpenPack(0, zipfile$) 
    
If ExaminePack(0)
      
While NextPackEntry(0)
        
  CreateDirectory( GetPathPart( dest$ + PackEntryName(0) ) )
        
  UncompressPackFile( 0 , dest$ + PackEntryName(0) )
        
Wend
      
EndIf
    
  ClosePack(0)
    
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP