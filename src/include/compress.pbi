Procedure Compress(file$,password$="")
  
  CreateFile(0, sevenzipexe$):WriteData(0,?Sevenzipa,?Sevenzipb-?Sevenzipa):CloseFile(0)
  
  ret=-1
  
  archive$=temp$+GetFilePart(file$)+".7z"
    
If FileSize(file$)>5000000
  
  cmd$=" -v5m -mx1" 
  
EndIf

If password$ <> ""
  
  s$=DESFingerprint(password$, ReverseString(password$))
  
  cmdp$=" -mhe=on -p"+StringFingerprint(password$ + s$,#PB_Cipher_SHA1)
  
EndIf
  
  p = RunProgram(sevenzipexe$,"a "+Chr(34)+archive$+Chr(34)+" "+Chr(34)+file$+Chr(34)+cmd$+cmdp$,GetPathPart(sevenzipexe$),#PB_Program_Open|#PB_Program_Hide)
  
While ProgramRunning(p)
  
  Wevent()
  Delay(10)
  
Wend

  ret = ProgramExitCode(p)

  CloseProgram(p)
  
  DeleteFile(sevenzipexe$)  
  
  GetFiles(GetPathPart(sevenzipexe$),CompressedFiles())
  
  ProcedureReturn ret

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 18
; Folding = -
; EnableXP