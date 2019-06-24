Procedure.s CreateFiles()
  
  d$ = GetUserDirectory(#PB_Directory_ProgramData)
  
  d$ + title$
 
  d$ = AddBackslash( d$ )
  
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