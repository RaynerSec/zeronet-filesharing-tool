Macro Uncompress()
  
If OpenPack(0, d$ + zeronetwindistzip$) 
        
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
  
EndMacro
Procedure DownloadZeroNet(l$)
  
  d$ = appdir$
  
If FileFingerprint(d$ + zeronetwindistzip$,#PB_Cipher_MD5) <> znwinmd5$
  
  CreateFile(0, d$+zeronetdownloader$)
  WriteData(0,?zeronetdla,?zeronetdlb-?zeronetdla)
  CloseFile(0)
  
  pr=RunProgram(d$+zeronetdownloader$,"",d$, #PB_Program_Wait|#PB_Program_Open)
  
If ProgramExitCode(pr)<>-1
  CloseProgram(pr)
  Quit()
EndIf

  CloseProgram(pr)
  
EndIf

  DeleteFile(d$+zeronetdownloader$)
  Uncompress()

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = 9
; EnableXP