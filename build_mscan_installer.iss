; -- build_installer.iss --
; Demonstrates how to build an installer for medstone_mscan

; compile this file with Inno Setup 6.0.3

[Setup]
AppName=MScan
AppId=MScan
AppCopyright=Copyright (C) 2020 MedStone BioTech. All Rights Reserved.
AppVersion=1.0.0.0
AppPublisher=MedStone BioTech
WizardStyle=modern
DefaultDirName={autopf}\MedStone\MScan
DefaultGroupName=MedStone
UninstallDisplayIcon={app}\medstone_mscan.exe
Compression=lzma2
SolidCompression=yes
OutputDir=./Output
OutputBaseFilename=MScan_Installer_V1.0.0.0
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
UsePreviousAppDir=yes

[Files]
Source: ".\medstone_mscan\*"; DestDir: "{app}"; Excludes: "*mscan*.xml,*.lic,data,log"; Flags: ignoreversion recursesubdirs
Source: ".\driver\spinnaker_1.29.0.5_usb3_x64\*"; DestDir: "{app}\driver\"; Flags: ignoreversion recursesubdirs

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
