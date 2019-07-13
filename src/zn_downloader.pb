DataSection
  gatewaysa:
    IncludeBinary "gateways"
  gatewaysb:
EndDataSection

  UseMD5Fingerprint()

  Global NewList GateWays.s()
  
CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
  
  Global download$ = "QmXNHizy5cUWu5ydrTmaRaSgzXgEPUZj24QtQNdPPMkjD5"
  Global md5$="bf04780a88a28be1cc24878b348dd49a"
  Global size=19003316
  Global title$="Downloading - ZeroNet-win-dist-win64.zip"
  Global saveas$="ZeroNet-win-dist-win64.zip"
  
CompilerElse
  
  Global download$ = "QmdzqDRgUse8KqbYG9FaKDz9uEv523Vp5R2QEECbiCMjU9"
  Global md5$="292ce12d37f2f4cac3d2b61892d57ea7"
  Global size=16433052
  Global title$="Downloading - ZeroNet-win-dist.zip"
  Global saveas$="ZeroNet-win-dist.zip"
  
CompilerEndIf
    
  Global link$
  Global *mem
  Global ok
  
Macro DownloadProgress()
  
  p = HTTPProgress(down)
  
Select p
    
Case #PB_HTTP_Failed
  
  Failed()
   
Case #PB_HTTP_Success
  
  CloseWindow(0)
  *mem = FinishHTTP(down)
 
If Fingerprint(*mem, size, #PB_Cipher_MD5) = md5$
  
  Save()

Else
  
  MessageRequester("", "Integrity check failed")
  
EndIf
  
  Break
  
Default
  
  SetGadgetState(1,p)
  
EndSelect
  
EndMacro    
Macro Timer()
  
If EventTimer()=1
  
If ok=1
  
  RemoveWindowTimer(0,1)
  
  SetGadgetAttribute(1,#PB_ProgressBar_Maximum,size)
  
  down = ReceiveHTTPMemory( link$ , #PB_HTTP_Asynchronous )
  
  AddWindowTimer(0,2,5)
  
Else
  
If IsThread(t)
  KillThread(t)
EndIf

  NextElement(GateWays())
  t=CreateThread(@GetHeader(),UTF8(GateWays()))
    
EndIf 

ElseIf EventTimer()=2
  
  DownloadProgress()
  
EndIf
  
EndMacro

Procedure Failed()
  
If IsWindow(0)
  CloseWindow(0)
EndIf

  MessageRequester("","Download failed")
   
  End  
  
EndProcedure
Procedure Save()
      
  s$=saveas$
  
If s$
  
If CreateFile(0,s$)
  
  WriteData(0,*mem,size)
  CloseFile(0)
  
  End -1
 
EndIf

Else
  
  End
  
EndIf

  ProcedureReturn

EndProcedure
Procedure GetSize(l$)
    
  h$ = GetHTTPHeader(l$+download$)
  
  cl$="Content-Length:"
  
  pos = FindString(h$,cl$)
    
If pos
  
  h$ = StringField( Mid(h$,pos) , 1, Chr(10) )
  h$ = Trim( StringField( h$ , 2, ":" ) )
  
  v = Val(h$)
  
EndIf

  ProcedureReturn v
  
EndProcedure
Procedure GetHeader(*a)
    
If GetSize(PeekS(*a,-1,#PB_UTF8)) = size
  
  link$ = PeekS(*a,-1,#PB_UTF8) +download$
  ok=1
    
EndIf
  
  ProcedureReturn

EndProcedure  
Procedure Download()
  
  FirstElement(GateWays())
    
If OpenWindow(0, 0, 0, 360, 80, title$, #PB_Window_MinimizeGadget|#PB_Window_SystemMenu | #PB_Window_ScreenCentered)
  
  AddWindowTimer(0,1,1000)
  
  ProgressBarGadget(1, 20, 25, 320,  25, 0, 1)
  
Repeat
  
Select WaitWindowEvent()
    
Case #PB_Event_Timer
  
  Timer()

Case #PB_Event_CloseWindow
  
  End
  
EndSelect
    
ForEver      
    
EndIf

  ProcedureReturn

EndProcedure
Procedure Main()
  
  gw$=PeekS(?gatewaysa,?gatewaysb-?gatewaysa,#PB_UTF8)
  
  c=CountString(gw$,Chr(10))
  
For a=1 To c
  
  AddElement( GateWays() )
  GateWays() = StringField(gw$,a,Chr(10))
    
Next

  Download()
  
EndProcedure

OnErrorCall(@Failed())

If InitNetwork()
  
  Main()
  
Else
  
  MessageRequester("","Couldn't initiliaze the network.")
  End
  
EndIf
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = A5
; EnableThread
; EnableXP
; UseIcon = ..\bin\icon.ico
; Executable = downloader.exe
; CPU = 1