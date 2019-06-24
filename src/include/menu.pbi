Macro Menu()
  
 CreateImageMenu( #menu , WindowID(0) , #PB_Menu_ModernLook )
 
 MenuTitle( menufile$ )
 MenuItem( #menuadd, add$ , ImageID (#imgaddsm) )
 MenuItem( #menuremove, remove$ , ImageID (#imgremovesm) )
 MenuBar()
 MenuItem( #menusettings, settings$ , ImageID (#imgsettingssm) )
 MenuBar()
 MenuItem( #menuquit, quit$ , ImageID (#imgquit) )
   
 MenuTitle( "?" )
 MenuItem( #menuupdate, update$ , ImageID (#imgupdatesm) )
 MenuItem( #menuadd, website$ , ImageID (#imgwebsm) )
 MenuItem( #menuabout, about$ , ImageID (#imgaboutsm) )
 MenuBar()
 MenuItem( #menudonate, donate$ , ImageID (#imgdonatesm) )
 
EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP