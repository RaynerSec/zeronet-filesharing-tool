Procedure Main()
  
  NoAnotherInstance()
  CreateFiles(portable)

If IsZeroNetRunning( LCase(zeronetexe$) , zeronetfolder$+zeronetexe$)
  
  MessageRequester("",znalreadyrunning$)
  
  DeleteDirectory(temp$,pattern$,#PB_FileSystem_Recursive)
  
  End
    
EndIf

  process = RunProgram(zeronetfolder$+zeronetexe$,openbrowser$,"",#PB_Program_Open)
  
  w=800:h=450
  
If OpenWindow(#window,0,0,w,h,title$+" v"+version$,#PB_Window_ScreenCentered|#PB_Window_MinimizeGadget|#PB_Window_SystemMenu|#PB_Window_SizeGadget | #PB_Window_Invisible)
  
  WindowBounds(#window,w,h,#PB_Ignore,#PB_Ignore)
  
  Toolbar():Menu():Statusbar():Gadgets()
    
  ListSites():PopupMenu()
  
  AddKeyboardShortcut(#window,#PB_Shortcut_Delete,#remove)
  AddKeyboardShortcut(#window,#PB_Shortcut_Return,#enter)
  
  AddWindowTimer(#window,#timer,100)
  
  HideWindow(#window,0)
  
  SetWindowCallback(@Callback())
  
Repeat
  
Select WaitWindowEvent()
    
Case #PB_Event_Timer
  
  IsZeroNet():Status()
  
Case #PB_Event_SizeWindow
    
  w=WindowWidth(#window):h=WindowHeight(#window)
  ResizeGadget(#container,#PB_Ignore,#PB_Ignore,w,h-(sbh+tbh+mh))
  ResizeGadget(#files,#PB_Ignore,#PB_Ignore,w-4,h-(sbh+tbh+mh+4))
  
Case #PB_Event_Menu
  
Select EventMenu()
    
Case #enter
    
  c=CountGadgetItems(#files)
  
For a=0 To c-1
  
If GetGadgetItemState(#files,a) = #PB_ListIcon_Selected 
  
  addr$ = Trim( StringField(Adresses(GetGadgetItemText(#files,a)),1," ") )
  OpenURL(addr$)
  
  Break
  
EndIf
  
Next    
    
Case #popupcopylink
    
  CopyLink()  
    
Case #popupremove,#toolbarremove,#menuremove,#remove
  
  Remove()
    
Case #popupadd,#toolbaradd,#menuadd
  
  Add()
  
If IsWindow(#pleasewait):CloseWindow(#pleasewait):EndIf

  DisableGadget(#container,0)
  
  ClearMap(FileSizes()):ClearMap(MD5()):ClearList(CompressedFiles()):ClearMap( PrivateKey() )
  
Case #toolbarsettings , #menusettings
  
  Settings()
  
Case #toolbarabout , #menuabout
  
  About()
  
Case #toolbardonate , #menudonate
  
  Donate()
  
Case #toolbarupdate , #menuupdate
  
  Update()
  
Case #toolbarweb
  
  OpenURL ( webaddr$ )
    
Case #menuquit
  
  Quit()
  
EndSelect
    
Case #PB_Event_Gadget
  
Select EventGadget()
 
Case #hyperlink
    
  OpenURL ( Trim (RemoveString( GetGadgetText(#hyperlink), prefix$ )))
  
Case #files
  
  et=EventType()
    
Select et
    
Case 1

  DisplayPopupMenu(#popupmenu,WindowID(#window))
  
Case 2
  
  c=CountGadgetItems(#files)
  
For a=0 To c-1
  
If GetGadgetItemState(#files,a) = #PB_ListIcon_Selected 
  
  addr$ = Trim( StringField(Adresses(GetGadgetItemText(#files,a)),1," ") )
  OpenURL(addr$)
  
  Break
  
EndIf
  
Next
  
EndSelect

EndSelect
    
Case #PB_Event_CloseWindow
    
  Break
  
EndSelect
    
ForEver
  
EndIf

  Quit()

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP