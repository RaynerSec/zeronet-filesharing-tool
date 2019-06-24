Global hMapFile = CreateFileMapping_(#INVALID_HANDLE_VALUE,#Null,#PAGE_READWRITE,0,256,"e30ce58b392723f9434d7736ca53cd43")
Global pBuf = MapViewOfFile_(hMapFile,#FILE_MAP_ALL_ACCESS,0,0,256)

Global NewMap MD5.s()
Global NewMap Sizes.s()
Global prefix$ = "http://127.0.0.1:43110/"
Global appdir$ = GetUserDirectory(#PB_Directory_ProgramData) + "ZeroNet Filesharing Tool\"
Global zndir$ = appdir$ + "ZeroNet-win-dist\"
Global zeronetcmd$ = zndir$ + "lib\ZeroNet.cmd"
Global znexe$ = zndir$ + "ZeroNet.exe"
Global zdl$ = "https://github.com/HelloZeroNet/ZeroNet-win/archive/dist/ZeroNet-win.zip"
Global sitedownload$ = "siteDownload"
Global datemask$ = "%yyyy-%mm-%dd %hh-%ii-%ss"
Global explorerexe$ = "explorer.exe"
Global explorersel$ = "/select,"
Global enterpass$="Please enter the correct password to continue."
Global passincorrect$="The password is incorrect"
Global downloading$=" Downloading part "
Global fail$="Unable to download the file. Please try again later."
Global alreadyrunning$ = "An instance of this application is already running"
Global znalreadyrunning$="An instance of ZeroNet is already running. Please close it first."
Global openbrowser$="--open_browser"
Global unpacking$="Unpacking"
Global pwused
Global pwhash$
Global ziphash$
Global numfiles
Global temp$
Global link$
Global prog
Global zipdone
Global count=1
Global error
Global sevenzippass$
Global unpacking

; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; EnableXP