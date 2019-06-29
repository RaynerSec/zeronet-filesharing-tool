#define MyAppName "ZeroNet Filesharing Tool"
#define MyAppVersion "1.0.1"
#define MyAppPublisher "Fatih Kodak"
#define MyAppURL "http://127.0.0.1:43110/17SWVnHoujG92yYGSZvCzPgZEpGVfRF8wi"
#define MyAppExeName "ZeroNet-Filesharing-Tool.exe"

[Setup]

AppId={{1B4FE384-4E5D-41D6-A1F2-9DEEC411B1A1}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=..\LICENSE
OutputBaseFilename=ZeroNet-Filesharing-Tool-(Installer)
PrivilegesRequired=admin
VersionInfoVersion=1.0.1.0
ArchitecturesInstallIn64BitMode=x64

[Languages]

Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "de"; MessagesFile: "compiler:Languages\German.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]

Source: "ZeroNet-Filesharing-Tool-x64.exe"; DestDir: "{app}"; DestName: "ZeroNet-Filesharing-Tool.exe"; Check: Is64BitInstallMode

Source: "ZeroNet-Filesharing-Tool.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: solidbreak

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
