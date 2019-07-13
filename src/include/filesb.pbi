DataSection
  Sevenzipa:
  IncludeBinary "..\..\bin\7za.exe"
  Sevenzipb:
EndDataSection

DataSection
  loader:
  IncludeBinary "..\..\bin\images\loader.gif"
EndDataSection

CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
  
DataSection
  zeronetdla:
  IncludeBinary "..\..\bin\zn-downloader-x64.exe"
  zeronetdlb:
EndDataSection
  
CompilerElse
  
DataSection
  zeronetdla:
  IncludeBinary "..\..\bin\zn-downloader-x86.exe"
  zeronetdlb:
EndDataSection
  
CompilerEndIf
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP