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
  
  zeronetfolder$ = d$ + zeronetwindist$
 
  RenameFile( temp$ + zeronetwindist$, d$ + zeronetwindist$ )
      
  DeleteFile( temp$ + zeronetwindistexe$ )
  
  sevenzipexe$ = temp$ + sevenzipexe$
  
  DeleteDirectory(temp$ + zeronetwindist$, pattern$, #PB_FileSystem_Recursive)
  
  zeronetfolder$ = AddBackslash(zeronetfolder$)
  
  datafolder$ = zeronetfolder$ + dt$
  
  datafolder$ = AddBackslash( datafolder$ )
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP