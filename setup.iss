; Inno Setup skripti — ScrcpyConnect o'rnatuvchisi (Setup.exe)
; Bu skript GitHub Actions ichida avtomatik ishlatiladi.
; O'rnatuvchi: dasturni Program Files'ga joylaydi, Desktop'ga shortcut yaratadi.

#define MyAppName "Scrcpy Connect"
#define MyAppVersion "1.0"
#define MyAppPublisher "ScrcpyConnect"
#define MyAppExeName "ScrcpyConnect.exe"

[Setup]
AppId={{8F2A1C4E-7B3D-4A91-9C5E-1234567890AB}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=installer_output
OutputBaseFilename=ScrcpyConnect-Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest
ArchitecturesInstallIn64BitMode=x64compatible
; Tilni o'zbek/rus/ingliz qilib qo'yamiz (Inno Setup o'zbekchani standart qo'llamaydi,
; shu sababli rus va ingliz tillarini taklif qilamiz — interfeys allaqachon o'zbekcha)
SetupLogging=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "Ish stolida (Desktop) yorliq yaratish"; GroupDescription: "Qo'shimcha:"; Flags: checkedonce

[Files]
Source: "dist\ScrcpyConnect.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{#MyAppName} ni hozir ishga tushirish"; Flags: nowait postinstall skipifsilent
