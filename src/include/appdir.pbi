  h$ = "f48ce5cbc481d1b8246826019cf54451"

  hMapFileb = CreateFileMapping_(#INVALID_HANDLE_VALUE,#Null,#PAGE_READWRITE,0,2000,h$)
  pBufb = MapViewOfFile_(hMapFileb,#FILE_MAP_ALL_ACCESS,0,0,2000)

  appdir$ = Trim(PeekS(pBufb,-1,#PB_UTF8))
    
If FindString(appdir$,h$)
  
  appdir$ = Trim(RemoveString(appdir$,h$))
  
Else
  
  appdir$ = GetUserDirectory(#PB_Directory_ProgramData) + "ZeroNet Filesharing Tool\"
  
EndIf
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; EnableXP