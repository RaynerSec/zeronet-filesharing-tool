Procedure.s CreateSite(name.s,fsize,datum)
  
  s$=PeekS(?createa,?createb-?createa,#PB_UTF8)
    
  sp$ = GetShortPath(zeronetfolder$+zeronetcmd$)
  
  s$ = ReplaceString(s$,"*",sp$)
  
  CreateFile(0, temp$+createbat$):WriteStringFormat(0,#PB_Ascii):WriteString(0,s$):CloseFile(0)
  
  CreateFile(0, temp$+yestxt$):WriteStringFormat(0,#PB_Ascii):WriteString(0,yes$):CloseFile(0)
  
  p=RunProgram(temp$+createbat$,"",temp$,#PB_Program_Open|#PB_Program_Hide)
  
Repeat
  
  WindowEvent()
  
If ProgramRunning(p)=0
  
  Break
  
EndIf
  
ForEver

If ReadFile(0, temp$+restxt$)
  
Repeat
  
s$ = ReadString(0)

If FindString(s$,privkeystring$)
  
  privkey$ = Trim(StringField(s$,2,":"))
  
EndIf

If FindString(s$,siteaddrstring$)
  
  siteaddress$ = Trim(StringField(s$,2,":"))
    
EndIf

Until Eof(0)
  
  CloseFile(0)
  
EndIf

  DeleteFile(temp$+restxt$)
  DeleteFile(temp$+yestxt$)
  DeleteFile(temp$+createbat$)
  
If siteaddress$ <> "" And privkey$ <> ""
  
  PrivateKey(siteaddress$)=privkey$
  
  WriteSettings(mysites$+siteaddress$,setname$,name)
  WriteSettings(mysites$+siteaddress$,setsize$,Str(fsize))
  WriteSettings(mysites$+siteaddress$,setdate$,Str(datum))
  
 
  ProcedureReturn siteaddress$
  
Else
  
  MessageRequester(error$,fail$,#PB_MessageRequester_Error)
  
EndIf

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP