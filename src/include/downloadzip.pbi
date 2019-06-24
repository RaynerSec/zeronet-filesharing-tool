Procedure DownloadZip()
  
  siteaddr$=link$
  
  siteaddr$ = RemoveString(siteaddr$,prefix$)
  siteaddr$ = Trim(siteaddr$, "/")
 
  zip$ = prefix$ + siteaddr$ + "\" + siteaddr$ + ".zip"
  
  DL(siteaddr$)
 
  dzip$ = temp$ + GetFilePart( zip$ )
    
If ReceiveHTTPFile(zip$ , dzip$ )
      
If FileFingerprint(dzip$,#PB_Cipher_MD5) = ziphash$
  
  content$ = GetZip( dzip$ )
  
  DeleteFile( dzip$ )
  
EndIf
  
EndIf

If content$=""
  
  zipdone=0
  
  ProcedureReturn
  
EndIf

  zipdone=1

  c = CountString(content$,#CRLF$)
  
If c
  
  pwused=Val(StringField(content$,1,#CRLF$))
  pwhash$=Trim(StringField(content$,2,#CRLF$))
  numfiles=Val(StringField(content$,3,#CRLF$))
  
  b=1
  
For a=1 To numfiles
  
  Sizes( Trim( StringField(content$,b+3,#CRLF$) )) = Trim( StringField(content$,b+4,#CRLF$) )
  MD5( Trim( StringField(content$,b+3,#CRLF$) )) = Trim( StringField(content$,b+5,#CRLF$) )
      
  b+3
  
Next

EndIf

  ProcedureReturn

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP