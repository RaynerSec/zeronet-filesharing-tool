Procedure Main()
  
  NoAnotherInstance()
  
If IsZeroNetRunning( GetFilePart(LCase(znexe$)) , LCase(znexe$), 0)
  MessageRequester("",znalreadyrunning$)
  End
EndIf

If InitNetwork()=0
  End
EndIf

  CreateDirectory(appdir$)
  link$ = GetLink()

If FindString(link$,prefix$)=0
  End
EndIf

If FileExists(zeronetcmd$)=0
  
  DownloadZeroNet(zdl$)
  
EndIf

  RunProgram(znexe$, openbrowser$+" "+Chr(34)+Chr(34),"")
  
  temp$ = CreateTempPath()
  
  temp$ = AddBackslash(temp$)
    
If PleaseWait() = 1 
  
  Password()
  PleaseWaitB()
  
EndIf

If error
  
  MessageRequester("",fail$)
  
EndIf

  Quit()

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP