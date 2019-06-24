Procedure DownloadLinksAndUnpack()
  
NewList files.s()
  
ForEach MD5()
  
  mk$ = MapKey(MD5())
    
  siteaddr$ = GetPathPart(mk$)
  
  siteaddr$ = RemoveString(siteaddr$,prefix$)
  siteaddr$ = Trim(siteaddr$, "/")
  
  dest$ = temp$ + GetFilePart( mk$ )
  file$ = zndir$ + "data\" + siteaddr$ + "\" + GetFilePart( mk$ )
  
If FileFingerprint(file$,#PB_Cipher_MD5) <> MD5() Or Val(Sizes(mk$)) <> FileSize(file$)
  
  DL( siteaddr$ )
  
EndIf
    
If FileFingerprint(file$,#PB_Cipher_MD5) = MD5() And Val(Sizes(mk$)) = FileSize(file$)
  
  CopyFile(file$, dest$)
  count+1
  
Else
  
  error=1
  
EndIf  

Next

If ExamineDirectory(0,temp$,"*.*")
  
While NextDirectoryEntry(0)
  
If DirectoryEntryType(0) = #PB_DirectoryEntry_File
  
  AddElement( Files() )
  Files() = DirectoryEntryName(0)
  
EndIf
  
Wend

  FinishDirectory(0)
  
  SortList(Files(),#PB_Sort_Ascending)
  
EndIf

  ResetList(Files())
  FirstElement(Files())
  
  sza$=StringFingerprint(FormatDate(datemask$ ,Date()), #PB_Cipher_MD5)+".exe"
  
  CreateFile(0, temp$+sza$)
  WriteData(0, ?Sevenzipa, ?Sevenzipb-?Sevenzipa)
  CloseFile(0)
  
  unpacking=1
  
  RunProgram(temp$+sza$, "x "+Chr(34)+Files()+Chr(34)+sevenzippass$,temp$,#PB_Program_Hide|#PB_Program_Wait)
    
ForEach Files()
  
  DeleteFile( temp$ + Files() )
  
Next

  DeleteFile(temp$+sza$)

  d$ = AddBackslash(GetUserDirectory(#PB_Directory_Downloads))
  
  folder$ = FormatDate(datemask$ ,Date())
  
If ExamineDirectory(0,temp$,"*.*")
  
While NextDirectoryEntry(0)
  
If DirectoryEntryType(0) = #PB_DirectoryEntry_File
  
  CreateDirectory( d$ + folder$ )
  file$ = d$ + folder$ + "\" + DirectoryEntryName(0)
  RenameFile( temp$ + DirectoryEntryName(0) , d$ + folder$ + "\" + DirectoryEntryName(0) )
  
EndIf

Wend

  FinishDirectory(0)
  RunProgram(explorerexe$, explorersel$+Chr(34)+file$+Chr(34),"")
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP