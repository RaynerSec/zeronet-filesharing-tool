UseZipPacker():UseGIFImageDecoder():UseMD5Fingerprint():UseSHA1Fingerprint()

IncludeFile "include\filesb.pbi"
IncludeFile "include\varsb.pbi"
IncludeFile "include\addbackslash.pbi"
IncludeFile "include\fileexists.pbi"
IncludeFile "include\downloadzeronet.pbi"
IncludeFile "include\quitb.pbi"
IncludeFile "include\createtemppath.pbi"
IncludeFile "include\getzip.pbi"
IncludeFile "include\dl.pbi"
IncludeFile "include\downloadzip.pbi"
IncludeFile "include\downloadlinksandunpack.pbi"
IncludeFile "include\setframe.pbi"
IncludeFile "include\timer.pbi"
IncludeFile "include\pleasewait.pbi"
IncludeFile "include\password.pbi"
IncludeFile "include\pleasewaitb.pbi"
IncludeFile "include\getlink.pbi"
IncludeFile "include\processnamefromid.pbi"
IncludeFile "include\iszeronetrunning.pbi"
IncludeFile "include\noanotherinstance.pbi"
IncludeFile "include\errorhandler.pbi"
IncludeFile "include\mainb.pbi"

OnErrorCall(@ErrorHandler())
Main()
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; EnableThread
; EnableXP
; UseIcon = ..\bin\icon.ico
; Executable = ..\bin\downloader.exe
; CPU = 1
; CompileSourceDirectory