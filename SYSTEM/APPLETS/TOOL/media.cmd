@echo off
if exist .\SYSTEM\APPLETS\color1.clr color 4f
if exist .\SYSTEM\APPLETS\color2.clr color 2f
if exist .\SYSTEM\APPLETS\color3.clr color 1f
if exist .\SYSTEM\APPLETS\color4.clr color 5f
if exist .\SYSTEM\APPLETS\color5.clr color 8f
if exist .\SYSTEM\APPLETS\color6.clr color f0
if exist .\SYSTEM\APPLETS\color7.clr color 6f
if exist .\SYSTEM\APPLETS\color8.clr color 3f
:menu
cls
title Music Player
cd .\SYSTEM\MEDIA\MUSIC
cls
echo What do you want to play, %USERNAME%?
echo ===============================================
dir
echo ===============================================
echo Type 'nyra' to go back to Nyra OS, or 'help' to
echo open up how to work the applet. Please remember
echo to include the file extension! (.mp3/m4a)
echo Commands are case-sensitive (must be lowercase)
set /p musicplayback=
if %musicplayback%==nyra exit
if %musicplayback%==help goto help
if %musicplayback%==. goto error
if %musicplayback%==.. goto error
start %musicplayback%
goto menu
:error
cls
echo Sorry, but that function is not allowed.
echo Please try again.
pause
goto menu
:help
cls
echo To playback a file, simply type the name, 
echo as well as the extension. (With dot!)
echo Example: jessica_music.mp3
pause
goto menu