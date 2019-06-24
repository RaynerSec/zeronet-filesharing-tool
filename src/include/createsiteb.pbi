Procedure.s CreateSiteB(filetoadd$)
 
  s$=PeekS(?createa,?createb-?createa,#PB_UTF8)
    
  sp$ = GetShortPath(zeronetfolder$+zeronetcmd$)
  
  s$ = ReplaceString(s$,"*",sp$)
  
  CreateFile(1, temp$+createbat$):WriteStringFormat(1,#PB_Ascii):WriteString(1,s$):CloseFile(1)
  CreateFile(1, temp$+yestxt$):WriteStringFormat(1,#PB_Ascii):WriteString(1,yes$):CloseFile(1)
  
  p=RunProgram(temp$+createbat$,"",temp$,#PB_Program_Open|#PB_Program_Hide)
  
Repeat
  
  WindowEvent()
  
If ProgramRunning(p)=0
  
  Break
  
EndIf
  
ForEver

If ReadFile(1, temp$+restxt$)
  
Repeat
  
s$ = ReadString(1)

If FindString(s$,privkeystring$)
  
  privkey$ = Trim(StringField(s$,2,":"))
  
EndIf

If FindString(s$,siteaddrstring$)
  
  siteaddress$ = Trim(StringField(s$,2,":"))
    
EndIf

Until Eof(1)
  
  CloseFile(1)
  
EndIf

  DeleteFile(temp$+restxt$)
  DeleteFile(temp$+yestxt$)
  DeleteFile(temp$+createbat$)
  
If siteaddress$ <> "" And privkey$ <> ""
  
  RenameFile(filetoadd$, Addbackslash(datafolder$+siteaddress$) + GetFilePart(filetoadd$))
  
  PrivateKey(siteaddress$)=privkey$
  
  ProcedureReturn siteaddress$
  
Else
  
  MessageRequester(error$,fail$,#PB_MessageRequester_Error)
  
EndIf

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP