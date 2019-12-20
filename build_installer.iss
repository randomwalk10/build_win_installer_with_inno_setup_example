; -- Example1.iss --
; Demonstrates copying 3 files and creating an icon.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!

[Setup]
AppName=MScan
AppVersion=0.1
WizardStyle=modern
DefaultDirName={autopf}\MedStone\MScan
DefaultGroupName=MedStone
UninstallDisplayIcon={app}\medstone_mscan.exe
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output
OutputBaseFilename=MScan_Installer

[Files]
; Source: ".\app_files\MyProg.exe"; DestDir: "{app}"
; Source: ".\app_files\MyProg.chm"; DestDir: "{app}"
Source: ".\medstone_mscan\*"; DestDir: "{app}"; Excludes: ".\medstone\medstone_mscan.lic"; Flags: ignoreversion recursesubdirs
Source: ".\app_files\Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Dirs]
Name: {app}; Permissions: users-full

[Icons]
Name: "{group}\MScan"; Filename: "{app}\medstone_mscan.exe"
Name: "{group}\Uninstall MScan"; Filename: "{uninstallexe}"
Name: "{autodesktop}\MScan"; Filename: "{app}\medstone_mscan.exe"
Name: "{autostartup}\MScan"; Filename: "{app}\medstone_mscan.exe"
