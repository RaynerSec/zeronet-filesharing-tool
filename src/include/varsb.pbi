Global hMapFile = CreateFileMapping_(#INVALID_HANDLE_VALUE,#Null,#PAGE_READWRITE,0,256,"e30ce58b392723f9434d7736ca53cd43")
Global pBuf = MapViewOfFile_(hMapFile,#FILE_MAP_ALL_ACCESS,0,0,256)

Global appdir$

IncludeFile "appdir.pbi"
  
Global NewMap MD5.s()
Global NewMap Sizes.s()
Global prefix$ = "http://127.0.0.1:43110/"

CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
  
  Global zndir$ = appdir$ + "ZeroNet-win-dist-win64\"
  Global zeronetwindistzip$="ZeroNet-win-dist-win64.zip"
  Global znwinmd5$="bf04780a88a28be1cc24878b348dd49a"
  Global zeronetwindist$="ZeroNet-win-dist-win64"
  
CompilerElse
  
  Global zndir$ = appdir$ + "ZeroNet-win-dist\"
  Global zeronetwindist$="ZeroNet-win-dist"
  Global zeronetwindistzip$="ZeroNet-win-dist.zip"
  Global znwinmd5$="292ce12d37f2f4cac3d2b61892d57ea7"
  
CompilerEndIf


Global zeronetcmd$ = zndir$ + "lib\ZeroNet.cmd"
Global znexe$ = zndir$ + "ZeroNet.exe"
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

Global zeronetdownloader$="zeronet-downloader.exe"
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP