Procedure Password()
  
If pwused=1
  
  HideWindow(0,1)
  pw$=InputRequester("", enterpass$,"",#PB_InputRequester_Password)
  
If pw$
  
  s$=DESFingerprint(pw$, ReverseString(pw$))
  
If StringFingerprint(pw$ + s$, #PB_Cipher_MD5) = pwhash$
  
  sevenzippass$=" -p"+StringFingerprint(pw$ + s$,#PB_Cipher_SHA1)
  ProcedureReturn
  
Else
  
  MessageRequester("",passincorrect$)
  Quit()
  
EndIf
  
EndIf

  HideWindow(0,0)

EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 13
; Folding = -
; EnableXP