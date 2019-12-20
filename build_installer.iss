; -- Example1.iss --
; Demonstrates copying 3 files and creating an icon.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!

[Setup]
AppName=MScan
AppId=MScan
AppCopyright=Copyright (C) 2019 MedStone BioTech. All Rights Reserved.
AppVersion=0.1
AppPublisher=MedStone BioTech
WizardStyle=modern
DefaultDirName={autopf}\MedStone\MScan
DefaultGroupName=MedStone
UninstallDisplayIcon={app}\medstone_mscan.exe
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output
OutputBaseFilename=MScan_Installer
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

[Files]
Source: ".\medstone_mscan\*"; DestDir: "{app}"; Excludes: ".\medstone\medstone_mscan.lic"; Flags: ignoreversion recursesubdirs
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

[Run]
Filename: "{sys}\pnputil.exe"; Parameters: "/add-driver ""{app}\driver\*.inf"" /install"; Flags: 64bit runhidden

[UninstallDelete]
Type: filesandordirs; Name: "{app}"
