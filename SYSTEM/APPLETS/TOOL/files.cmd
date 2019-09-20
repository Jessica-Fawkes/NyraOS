@echo off
if exist .\SYSTEM\APPLETS\color1.clr color 4f
if exist .\SYSTEM\APPLETS\color2.clr color 2f
if exist .\SYSTEM\APPLETS\color3.clr color 1f
if exist .\SYSTEM\APPLETS\color4.clr color 5f
if exist .\SYSTEM\APPLETS\color5.clr color 8f
if exist .\SYSTEM\APPLETS\color6.clr color f0
if exist .\SYSTEM\APPLETS\color7.clr color 6f
if exist .\SYSTEM\APPLETS\color8.clr color 3f
:fileExplorersetup
pushd C:\
set dir=C:\
:explorermenu
title NyraOS File Manager
cls
echo ---------------------------------------
echo Welcome, %USERNAME%. 
echo You are currently in: %dir%
dir
echo ----------------------
echo Choose your action.
echo 1) Go To A Folder Here
echo 2) Open A File Here
echo 3) Create A File Here
echo 4) Create A Folder Here
echo 5) Rename a Folder/File
echo 6) Delete a Folder/File
echo 7) Exit
echo 8) About File Explorer
echo ----------------------------------------
choice /c 12345678>nul
if %errorlevel%==1 goto pathset 
if %errorlevel%==2 goto openfile
if %errorlevel%==3 goto mkfile
if %errorlevel%==4 goto mkfolder
if %errorlevel%==5 goto rename
if %errorlevel%==6 goto delete
if %errorlevel%==7 exit
if %errorlevel%--8 goto about
goto explorermenu
:pathset
cls
echo ---------------------------------
dir
echo ---------------------------------
echo Please enter the name of the 
echo folder you would like to open:
echo An example is like below:
echo "%DRIVELETTER%\Users\%USERNAME%\
echo ---------------------------------
set /p dirchange=
pushd "%dirchange%"
set dir="%dirchange%"
goto explorermenu
:openfile
echo --------------------------------------------------------
dir
echo --------------------------------------------------------
echo Please type the name of the file you would like to open. 
echo Include the file extension! An example is like below:
echo "jessicafawkesdocument.txt"
echo ---------------------------------------------------------
set /p filetoopen=
start "%filetoopen%"
cls 
goto explorermenu
:mkfile
echo ---------------------------
echo Please type the name of the 
echo file you want to make. An
echo example is shown below:
echo   "jessicafawkesdocument"
echo ---------------------------
set /p filename=
cls
echo ---------------------------------------------------
echo Please set the file type. Examples are shown below:
echo Text files: .txt, .rtf, .docx, .md
echo Blank Photo: .jpg, .png, .bmp, .tiff
echo Blank Music: .mp3, .m4a, .ogg, .wav
echo ---------------------------------------------------
set /p fileextension=
nul>"%filename%.%fileextension%"
cls
if exist .\%filename%.%fileextension% goto creationerror
echo The file has been created, %USERNAME%.
pause
goto explorermenu
:mkfolder
cls
echo ----------------------------------------
echo Please type the name of the new folder.
echo An example is shown below:
echo "JessicaDocumentFolder"
echo ----------------------------------------
set /p foldername=
mkdir "%foldername%"
if exist .\"%foldername%" goto creationerror
echo The folder has been created, %USERNAME%.
pause
goto explorermenu
:explorertomenu
cls
popd
goto explorertomenu
:creationerror
cls
echo Sorry, but it would appear the
echo file/folder already exists. 
echo Please try entering a 
echo different name for the object.
pause
goto explorermenu
:cderror
cls
echo There was an error in changing
echo folders. Maybe the folder does
echo not exist.
pause
popd>nul
goto explorermenu
:about
cls
echo File Explorer Version:
echo Compatible with 
echo Nyra OS v3 Pellimore
echo and higher.
pause
goto explorermenu