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
Procedure.s CreateFiles(p)
      
  hMapFileb = CreateFileMapping_(#INVALID_HANDLE_VALUE,#Null,#PAGE_READWRITE,0,2000,hashb$)
  pBufb = MapViewOfFile_(hMapFileb,#FILE_MAP_ALL_ACCESS,0,0,2000)
  
If p=1
  
  d$ = GetPathPart(ProgramFilename())
  d$ = AddBackslash( d$ ):d$ + dt$:d$ = AddBackslash( d$ )
    
  PokeS( pBufb, hashb$ + " " + LSet(d$,1000),-1,#PB_UTF8)
  
Else
  
  d$ = GetUserDirectory(#PB_Directory_ProgramData)
  d$ = AddBackslash( d$ ):d$ + title$:d$ = AddBackslash( d$ )
 
EndIf
  
  settingsfile$ = d$ + settingsfile$
  
  mysites$=AddBackslash( d$ + sites$ )
  
  CreateDirectory( d$ )
  
  CreateDirectory( mysites$ )
  
  CreateTempFiles()
     
  
If FileFingerprint(d$ + zeronetwindistzip$,#PB_Cipher_MD5) <> znwinmd5$
  
  pr=RunProgram(temp$+zeronetdownloader$,"",temp$, #PB_Program_Wait|#PB_Program_Open)
  
If ProgramExitCode(pr)<>-1
  CloseProgram(pr)
  Quit()
EndIf

  CloseProgram(pr)
  
  RenameFile( temp$ + zeronetwindistzip$, d$ + zeronetwindistzip$ )
  
EndIf

  DeleteFile(temp$+zeronetdownloader$)

  Uncompress()
 
  zeronetfolder$ = d$ + zeronetwindist$
 
  RenameFile( temp$ + zeronetwindist$, d$ + zeronetwindist$ )
  
  RenameFile( temp$ + zeronetwindist$, d$ + zeronetwindist$ )
  
  sevenzipexe$ = temp$ + sevenzipexe$
  
  DeleteDirectory(temp$ + zeronetwindist$, pattern$, #PB_FileSystem_Recursive)
  
  zeronetfolder$ = AddBackslash(zeronetfolder$)
  
  datafolder$ = zeronetfolder$ + dt$
  
  datafolder$ = AddBackslash( datafolder$ )
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = 9
; EnableXP