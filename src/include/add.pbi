Procedure AppendToFile(filename$,string$)
  
  OpenFile(0, filename$)
  length=Lof(0)
  FileSeek(0, length)
  WriteString(0,RSet(string$,100),#PB_UTF8)
  CloseFile(0)
  
EndProcedure
Procedure GetMD5(*f)
  
  filemd5$=FileFingerprint( PeekS(*f,-1), #PB_Cipher_MD5)
  fileinfomd5$= "<p> MD5: " + FileFingerprint( PeekS(*f,-1), #PB_Cipher_MD5) + "</p>"
  
EndProcedure

Macro SiteSign()
 
  p=RunProgram(zeronetfolder$+zeronetcmd$, sitesign$ + " " + r$ + " " + PrivateKey(r$), "" ,#PB_Program_Hide|#PB_Program_Open)
  
  While ProgramRunning(p):WEvent():Delay(10):Wend
  
  CloseProgram(p)
  
EndMacro
Macro SitePublish()
  
  p=RunProgram(zeronetfolder$+zeronetcmd$, sitepublish$ + " " + r$, "" ,#PB_Program_Hide|#PB_Program_Open)
  
  While ProgramRunning(p):WEvent():Delay(10):Wend
  
  CloseProgram(p)
  
  
EndMacro
Macro SiteSignAndPublish()
  
  p=RunProgram(zeronetfolder$+zeronetcmd$, sitesign$ + " " + s$ + " " + PrivateKey(s$), "" ,#PB_Program_Hide|#PB_Program_Open)
  
While ProgramRunning(p):WEvent():Delay(1):Wend

  CloseProgram(p)

  p=RunProgram(zeronetfolder$+zeronetcmd$, sitepublish$ + " "+s$,"",#PB_Program_Hide|#PB_Program_Open)

While ProgramRunning(p):WEvent():Delay(1):Wend

  CloseProgram(p)
  
EndMacro
Macro Password()
  
If Val ( RSettings( sethideenc$ , zero$ )) = 0
  
If MessageRequester("",questionencrypt$,#PB_MessageRequester_YesNo) = #PB_MessageRequester_Yes
  
  pw$=InputRequester(choosepass$,"","",#PB_InputRequester_Password)
  
If pw$=""
  
  ProcedureReturn
  
EndIf

  pwused=1
  
  pwhash$=StringFingerprint(pw$ + DESFingerprint(pw$, ReverseString(pw$)),#PB_Cipher_MD5)

  
EndIf

EndIf

EndMacro
Macro CmpFiles()
  
  HideGadget(#loader, 1) : HideGadget(#progress, 0)
  
  SetGadgetAttribute(#progress,#PB_ProgressBar_Maximum, ListSize( CompressedFiles() ))
      
NewList Links.s()  

  ClearList( DownloadLinks() )

ForEach CompressedFiles()

  filename$ = GetFilePart(CompressedFiles())
  
  MD5( filename$ ) = FileFingerprint( CompressedFiles() , #PB_Cipher_MD5 )
  FileSizes( filename$ ) = Str ( FileSize( CompressedFiles() ) )
  
  
  r$ = CreateSiteB( CompressedFiles() )
  
  WriteSettings( mysites$ + s$ , Str(a) , r$ )
  
  DeleteFile(Addbackslash(datafolder$+r$)+indexhtml$)
  
  CreateFile(1,Addbackslash(datafolder$+r$)+indexhtml$)
  
  string$ = PeekS(?htmlba,?htmlbb-?htmlba,#PB_UTF8)
    
  AddElement( DownloadLinks() )
  
  DownloadLinks() = prefix$ + r$ + "/" + filename$
    
  dllink$ = prefix$ + r$ + "/"; + indexhtml$
  
  string$=ReplaceString( string$ , "**" , ReplaceString(link$,"*",filename$) )
  
  string$=ReplaceString( string$ , "#" , filename$ )

  WriteStringFormat(1,#PB_Ascii):WriteString(1,string$)
  
  CloseFile(1)
  
  a$ = a$ + r$ + " "
  
  SetSiteTitle( Addbackslash( datafolder$+r$ ) + contentjson$,filename$)
  
  SiteSign()
  SitePublish()
    
  dlink$ = ReplaceString( link$ , "*", filename$ )
      
  dlink$ = ReplaceString( dlink$ , "#" , dllink$ )
  
  AddElement(Links())

  Links() = MakeLink(filename$,dllink$)
 
  a+1
  
  citem+1
  SetGadgetState(#progress,citem)
  
Next

ForEach Links()
  
  l$ = l$ + Links() + Chr(10)
  
Next

  FreeList(Links())
      
EndMacro
Macro CreateMainSite()
  
  d=Date()

  s$=CreateSite(n$,s,d)
  
  df$ = Addbackslash ( datafolder$ + s$ )
  
  i$ = df$ + indexhtml$
  
  dllinksfile$ = df$ + s$
  
  zipfile$ = df$ + bootstrapzip$ 
    
  FilePutContents( df$ + n$+" - "+downloaderexe$ , ?Downloadera , ?Downloaderb - ?Downloadera )
  
  AppendToFile(df$ + n$+" - "+downloaderexe$, StringFingerprint(prefix$+s$,#PB_Cipher_MD5))
  
  AppendToFile(df$ + n$+" - "+downloaderexe$, prefix$+s$)
  
  FilePutContents( zipfile$ , ?bootstrapa , ?bootstrapb - ?bootstrapa )
  
  Unpack( zipfile$, df$ )
  
  DeleteFile( zipfile$ )
  
  SetSiteTitle( df$ + contentjson$,n$)
  
EndMacro
Macro MakeIndexHtml()
  
  content$=PeekS(?htmla,?htmlb-?htmla,#PB_UTF8)
  
  SortList(CompressedFiles(), #PB_Sort_Ascending)
  
  WriteSettings(mysites$+s$,setfiles$,Str(ListSize(CompressedFiles())))
  
  a=1
    
  CmpFiles()

  Adresses(GetFilePart(f$))=s$+" "+a$
  
If IsThread(threadmd5)
  
While IsThread(threadmd5)
  
  WEvent()
  Delay(10)
    
Wend
  
EndIf

  content$=ReplaceString(content$,"*****",fileinfo$ + fileinfomd5$)
  
If Val ( RSettings( setnodl$ , zero$ )) = 1
      
  content$ = RemoveString(content$, "<a class=" + Chr(34) + "btn btn-primary" + Chr(34) + " href=" + Chr(34) + "****" + Chr(34) + ">Downloader</a>")
    
Else
  
  content$=ReplaceString(content$,"****",URLEncoder(n$+" - "+downloaderexe$))
  
EndIf
  
  content$=ReplaceString(content$,"***",GetFilePart(f$))
  
  content$=ReplaceString(content$,"**",l$)
  
  content$=ReplaceString(content$,"*",n$)

  WriteStringFormat(0,#PB_Ascii):WriteString(0,content$):CloseFile(0)
  
EndMacro
Macro MakeDlLinksFile()
      
  CreateFile(0, dllinksfile$)
  
  WriteStringN(0, Str( pwused ) )
  WriteStringN(0, pwhash$ )
  WriteStringN(0, Str( ListSize( DownloadLinks() ) ) )
  
ForEach DownloadLinks()
  
  WriteStringN(0, DownloadLinks() )
  WriteStringN(0, FileSizes( GetFilePart(DownloadLinks())) )
  WriteStringN(0, MD5( GetFilePart(DownloadLinks())) )
  
Next

  CloseFile(0)
  
  zhf$= AddBackslash(GetPathPart(dllinksfile$)) + ziphash$
  
  m$=FileFingerprint(dllinksfile$, #PB_Cipher_MD5)
    
  CreateFile(0, zhf$ )
  WriteString(0, m$)
  CloseFile(0)
      
If CreatePack(0, dllinksfile$ + zip$)
  
  AddPackFile(0, dllinksfile$, GetFilePart( dllinksfile$ ) )
  AddPackFile(0, zhf$, GetFilePart( zhf$ ) )
  ClosePack(0)
  
EndIf

  AppendToFile(df$ + n$+" - "+downloaderexe$, FileFingerprint(dllinksfile$ + zip$,#PB_Cipher_MD5))
  
If Val ( RSettings( setnodl$ , zero$ )) = 1
  DeleteFile(df$ + n$+" - "+downloaderexe$) 
EndIf
  
  DeleteFile(dllinksfile$) 
  DeleteFile(zhf$) 
  
EndMacro
Macro KillZeroNet()
  
If zeronetprocessid
  
  TerminateProcess_(OpenProcess_(#PROCESS_ALL_ACCESS,0,zeronetprocessid),1)
  
EndIf
  
If IsProgram(process)
  
If ProgramRunning(process)
  
  KillProgram(process)
  
EndIf

  CloseProgram(process)

EndIf
  
EndMacro
Macro LaunchZeroNet()

  process = RunProgram(zeronetfolder$+zeronetexe$,openbrowser$,"",#PB_Program_Open)
  zeronetprocessid=ProgramID(process)
  
EndMacro
  
Procedure Add()
  
  pwused=0
  fileinfomd5$=""
  
  ClearMap(FileSizes()):ClearMap(MD5()):ClearList(CompressedFiles())
  
  f$=OpenFileRequester(choose$,"",pattern$,0)
  
If f$
  
  fileinfo$ = "<p>"+size$+": "+FormatByteSize(FileSize(f$))+"</p>" + "<p>"+dateadded$+": "+FormatDate("%yyyy-%mm-%dd" ,Date())+"</p>"
      
  c$ = LCase( GetFilePart(f$))
  
For a=0 To CountGadgetItems(#files)
  
  t$ = LCase(GetGadgetItemText(#files,a))
  
If t$ = c$
    
  MessageRequester("",ReplaceString(alreadyadded$, "*",GetGadgetItemText(#files,a)))
  ProcedureReturn
  
EndIf
  
Next
  
  KillZeroNet()
  
  threadmd5 = CreateThread(@GetMD5(), @f$)
  
  s=FileSize(f$):n$=GetFilePart(f$)
  
If s>0
    
  Password()

  DisableGadget(#container,1)
  
  OpenWindow(#pleasewait,0,0,ImageWidth(#imgloader),ImageHeight(#imgloader)-100,pleasewait$,#PB_Window_WindowCentered,WindowID(#window))
  
  ImageGadget(#loader,0,-50,ImageWidth(#imgloader),ImageHeight(#imgloader),ImageID(#imgloader))
  
  AddWindowTimer(#pleasewait, #timergif, GetImageFrameDelay(#imgloader))
  
  ProgressBarGadget(#progress, 25, 35, 150, 30, 0, 1)
  
  HideGadget(#progress,1)
  
If Compress(f$,pw$)<>0
  
  MessageRequester(error$,fail$,#PB_MessageRequester_Error)
  
EndIf
  
  CreateMainSite()
  
If FileExists(i$)
  
  DeleteFile(i$)
  
If CreateFile(0,i$)
  
  MakeIndexHtml():MakeDlLinksFile():SiteSignAndPublish()
  
EndIf
  
EndIf
  
If s$
      
  AddGadgetItem(#files,-1,GetFilePart(f$))
  
  p=CountGadgetItems(#files)-1
  
  SetGadgetItemText(#files,p,FormatByteSize(s),1)
  SetGadgetItemText(#files,p,FormatDate(datemask$,d),2)
  
  SetGadgetItemData(#files,p,s)
  
EndIf
  
EndIf

  LaunchZeroNet()

EndIf



EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = AA+
; EnableXP