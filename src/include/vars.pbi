Global hMapFile = CreateFileMapping_(#INVALID_HANDLE_VALUE,#Null,#PAGE_READWRITE,0,256,"5316e3333b20094848125aad8abedd8e")
Global pBuf = MapViewOfFile_(hMapFile,#FILE_MAP_ALL_ACCESS,0,0,256)

Global NewMap MD5.s()

Global NewMap FileSizes.s()

Global NewMap PrivateKey.s()

Global NewMap Adresses.s()

Global NewList CompressedFiles.s()

Global NewList DownloadLinks.s()

Global process

Global pwused

Global zeronetprocessid

Global prefix$="http://127.0.0.1:43110/"

Global zeronetfolder$
Global datafolder$
Global mysites$

Global pattern$="*.*"

Global datemask$="%yyyy-%mm-%dd %hh:%ii"

Global title$="ZeroNet Filesharing Tool"

Global version$="1.0.2"

Global indexhtml$="index.html"

Global updated$="2019-07-13"
Global copyright$="Copyright (c) 2019 Fatih Kodak"

Global webaddr$="17SWVnHoujG92yYGSZvCzPgZEpGVfRF8wi"

Global hash$="346671e6ee687e6ba79f8bef4937418c"
Global hashb$="f48ce5cbc481d1b8246826019cf54451"

Global updateurl$=prefix$+webaddr$+"/znfs/downloads/v.zip"

Global noupdates$="You already have the newest version."
Global updateavailable$="A newer version is available."+Chr(10)+Chr(10)+"Download now?"
Global updatefail$="Update check failed"

Global link$="<p> <a href='#'>*</a> </p>"

Global name$="Name"
Global size$="Size"
Global dateadded$="Date added"

Global about$="About"
Global add$="Add file"
Global copylink$="Copy link"
Global remove$="Remove"
Global settings$="Settings"
Global download$="Download"
Global donate$="Donate"

Global update$="Update"
Global website$="Website"
Global quit$="Quit"

Global ok$="OK"

Global donatetext$ = title$ + " is free - Please donate to support the development!"

Global questionencrypt$ = "Do you want to encrypt this file?"

Global menufile$ = "File"

Global pleasewait$ = "Please wait"

Global choose$ = "Choose a file..."
Global choosepass$ = "Choose password..."

Global zeronetexe$ = "ZeroNet.exe"

Global openbrowser$ = "--open_browser "+Chr(34)+Chr(34)

Global zero$="0"

Global zeronetcmd$="lib\ZeroNet.cmd"

Global zeronetdownloader$="zeronet-downloader.exe"

Global sevenzipexe$="7za.exe"

Global settingsfile$="settings.ini"

Global setname$="name"
Global setsize$="size"
Global setdate$="date"
Global setfiles$="files"

Global sethidemsg$="hidemsg"
Global sethideenc$="hideenc"

Global dt$="data"
Global own$="own"
Global sites$="sites"
Global sitesjson$="sites.json"
Global contentjson$="content.json"

Global ttl$="title"

Global temp$

Global zip$=".zip"

Global ziphash$="hash"

Global yes$="yes"

Global privkeystring$="Site private key:"
Global siteaddrstring$="Site address:"

Global sitesign$="siteSign"
Global sitepublish$="sitePublish"
Global sitedownload$="siteDownload"

Global createbat$="create.bat"
Global restxt$="res.txt"
Global yestxt$="yes.txt"
Global bootstrapzip$="bootstrap.zip"

Global downloaderexe$ = "Downloader.exe"

Global fail$="Failed"

Global filemd5$
Global fileinfomd5$

Global donotshow$="Do not show this message again"

Global removesite$= "Are you sure to remove '*' ?"

Global hideencdialog$ = "Hide encryption dialog"
Global nodownloader$ = "Do not add a downloader to my sites"

Global alreadyadded$ = "A file named '*' has already been added"
Global alreadyrunning$ = "An instance of this application is already running"
Global znalreadyrunning$ = "An instance of ZeroNet is already running. Please close it and restart this application."
Global znclosed$="Zeronet has been closed. "+Chr(10)+Chr(10)+"Do you want to relaunch it?"
Global znkeeprunning$="Zeronet will keep running in the background, if you don't want this please close it manually."

CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
  
  Global zeronetwindistzip$="ZeroNet-win-dist-win64.zip"
  Global znwinmd5$="bf04780a88a28be1cc24878b348dd49a"
  Global zeronetwindist$="ZeroNet-win-dist-win64"
  
CompilerElse
  
  Global zeronetwindist$="ZeroNet-win-dist"
  Global zeronetwindistzip$="ZeroNet-win-dist.zip"
  Global znwinmd5$="292ce12d37f2f4cac3d2b61892d57ea7"
  
CompilerEndIf
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = -
; EnableXP