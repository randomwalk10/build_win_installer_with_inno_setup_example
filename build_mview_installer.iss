; -- build_installer.iss --
; Demonstrates how to build an installer for medstone_mview

; compile this file with Inno Setup 6.0.3

[Setup]
AppName=MView
AppId=MView
AppCopyright=Copyright (C) 2020 MedStone BioTech. All Rights Reserved.
AppVersion=1.0.0.0
AppPublisher=MedStone BioTech
WizardStyle=modern
DefaultDirName={autopf}\MedStone\MView
DefaultGroupName=MedStone
UninstallDisplayIcon={app}\medstone_mview.exe
Compression=lzma2
SolidCompression=yes
OutputDir=./Output
OutputBaseFilename=MView_Installer_V1.0.0.0
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
UsePreviousAppDir=yes

[Files]
Source: ".\medstone_mview\*"; DestDir: "{app}"; Excludes: "mview*.xml"; Flags: ignoreversion recursesubdirs
; Source: ".\app_files\Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Dirs]
Name: "{app}"; Permissions: users-full
Name: "{app}\data"; Permissions: users-full
Name: "{app}\log"; Permissions: users-full

[Icons]
Name: "{group}\MView"; Filename: "{app}\medstone_mview.exe"
Name: "{group}\RemoveMView"; Filename: "{uninstallexe}"
Name: "{autodesktop}\MView"; Filename: "{app}\medstone_mview.exe"

[Languages]
Name: "chs"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"
; Name: "eng"; MessagesFile: "compiler:default.isl"

[UninstallDelete]
Type: filesandordirs; Name: "{app}"
