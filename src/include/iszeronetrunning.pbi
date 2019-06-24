Procedure IsZeroNetRunning(FileName.s , full.s, skip=0)
  
  Protected snap.l , Proc32.PROCESSENTRY32 , dll_kernel32.l
  
  FileName = GetFilePart( FileName )
  dll_kernel32 = OpenLibrary (#PB_Any, "kernel32.dll")
  
If dll_kernel32
  
  snap = CallFunction (dll_kernel32, "CreateToolhelp32Snapshot",$2, 0)
  
If snap
  
  Proc32\dwSize = SizeOf (PROCESSENTRY32)
  
If CallFunction (dll_kernel32, "Process32First", snap, @Proc32) 
  
While CallFunction (dll_kernel32, "Process32Next", snap, @Proc32)
  
If LCase(PeekS (@Proc32\szExeFile,-1,#PB_UTF8)) = FileName
  
If skip=0
  
If Trim ( LCase (ProcessNameFromID(Proc32\th32ProcessID) ) ) <> Trim (LCase( full ))
    
  r=1
  
Else
  
  zeronetprocessid = Proc32\th32ProcessID
  
EndIf

Else
  
  r=1
  
EndIf

  CloseHandle_ (snap)
  CloseLibrary (dll_kernel32)
  
  ProcedureReturn r
  
EndIf

Wend

EndIf   

  CloseHandle_ (snap)
  
EndIf

  CloseLibrary (dll_kernel32)
  
EndIf

  ProcedureReturn 0

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP