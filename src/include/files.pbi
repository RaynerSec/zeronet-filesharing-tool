IncludePath "..\..\bin"

DataSection
  quit:
  IncludeBinary "images\quit.png"
EndDataSection

DataSection
  copy:
  IncludeBinary "images\copy.png"
EndDataSection

DataSection
  aboutsm:
  IncludeBinary "images\about-16.png"
EndDataSection

DataSection
  aboutlg:
  IncludeBinary "images\about-24.png"
EndDataSection

DataSection
  donatesm:
  IncludeBinary "images\donate-16.png"
EndDataSection

DataSection
  donatelg:
  IncludeBinary "images\donate-24.png"
EndDataSection

DataSection
  settingssm:
  IncludeBinary "images\settings-16.png"
EndDataSection

DataSection
  settingslg:
  IncludeBinary "images\settings-24.png"
EndDataSection

DataSection
  updatesm:
  IncludeBinary "images\update-16.png"
EndDataSection

DataSection
  updatelg:
  IncludeBinary "images\update-24.png"
EndDataSection

DataSection
  websm:
  IncludeBinary "images\web-16.png"
EndDataSection

DataSection
  weblg:
  IncludeBinary "images\web-24.png"
EndDataSection

DataSection
  filesm:
  IncludeBinary "images\file-16.png"
EndDataSection

DataSection
  filelg:
  IncludeBinary "images\file-24.png"
EndDataSection

DataSection
  loader:
  IncludeBinary "images\loader.gif"
EndDataSection

DataSection
  removesm:
  IncludeBinary "images\remove-16.png"
EndDataSection

DataSection
  removelg:
  IncludeBinary "images\remove-24.png"
EndDataSection

DataSection
  icon:
  IncludeBinary "images\icon.png"
EndDataSection

DataSection
  bootstrapa:
  IncludeBinary "bootstrap.zip"
  bootstrapb:
EndDataSection

DataSection
  donatea:
  IncludeBinary "donate.html"
  donateb:
EndDataSection

DataSection
  createa:
  IncludeBinary "create.bat"
  createb:
EndDataSection

DataSection
  Sevenzipa:
  IncludeBinary "7za.exe"
  Sevenzipb:
EndDataSection

CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
  
DataSection
  zeronetdla:
  IncludeBinary "zn-downloader-x64.exe"
  zeronetdlb:
EndDataSection
  
DataSection
  Downloadera:
  IncludeBinary "downloader-x64.exe"
  Downloaderb:
EndDataSection

CompilerElse
  
DataSection
  zeronetdla:
  IncludeBinary "zn-downloader-x86.exe"
  zeronetdlb:
EndDataSection
  
DataSection
  Downloadera:
  IncludeBinary "downloader-x86.exe"
  Downloaderb:
EndDataSection
  
CompilerEndIf

DataSection
  htmla:
  IncludeBinary "pagea.html"
  htmlb:
EndDataSection

DataSection
  htmlba:
  IncludeBinary "pageb.html"
  htmlbb:
EndDataSection
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP