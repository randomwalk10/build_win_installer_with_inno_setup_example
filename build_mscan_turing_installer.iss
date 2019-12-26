; -- build_installer.iss --
; Demonstrates how to build an installer for medstone_mscan

; compile this file with Inno Setup 6.0.3

[Setup]
AppName=MScan
AppId=MScan
AppCopyright=Copyright (C) 2019 MedStone BioTech. All Rights Reserved.
AppVersion=1.0
AppPublisher=MedStone BioTech
WizardStyle=modern
DefaultDirName={autopf}\MedStone\MScan
DefaultGroupName=MedStone
UninstallDisplayIcon={app}\medstone_mscan.exe
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output
; OutputBaseFilename=MScan_Installer_V1.0_Pascal
OutputBaseFilename=MScan_Installer_V1.0_Turing
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
UsePreviousAppDir=yes

[Files]
; Source: ".\medstone_mscan_pascal\*"; DestDir: "{app}"; Excludes: ".\medstone_mscan_pascal\medstone_mscan.lic"; Flags: ignoreversion recursesubdirs
Source: ".\medstone_mscan_turing\*"; DestDir: "{app}"; Excludes: ".\medstone_mscan_turing\medstone_mscan.lic"; Flags: ignoreversion recursesubdirs
Source: ".\driver\*"; DestDir: "{app}\driver\"; Flags: ignoreversion recursesubdirs
; Source: ".\app_files\Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Dirs]
Name: "{app}"; Permissions: users-full
Name: "{app}\data"; Permissions: users-full
Name: "{app}\log"; Permissions: users-full
Name: "{app}\driver"; Permissions: users-full

[Icons]
Name: "{group}\MScan"; Filename: "{app}\medstone_mscan.exe"
Name: "{group}\RemoveMscan"; Filename: "{uninstallexe}"
Name: "{autodesktop}\MScan"; Filename: "{app}\medstone_mscan.exe"

[Languages]
Name: "chs"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"
; Name: "eng"; MessagesFile: "compiler:default.isl"

[Run]
Filename: "{sys}\pnputil.exe"; Parameters: "/add-driver ""{app}\driver\*.inf"" /install"; Flags: 64bit runhidden

[UninstallDelete]
Type: filesandordirs; Name: "{app}"
