@echo off
title Nyra OS
if exist .\SYSTEM\color1.clr color 4f && goto firstboot
if exist .\SYSTEM\color2.clr color 2f && goto firstboot
if exist .\SYSTEM\color3.clr color 1f && goto firstboot
if exist .\SYSTEM\color4.clr color 5f && goto firstboot
if exist .\SYSTEM\color5.clr color 8f && goto firstboot
if exist .\SYSTEM\color6.clr color f0 && goto firstboot
if exist .\SYSTEM\color7.clr color 6f && goto firstboot
if exist .\SYSTEM\color8.clr color 3f && goto firstboot
:firstboot
if exist .\SYSTEM\firstboot.setting goto firstboot2
if not exist .\SYSTEM\firstboot.setting goto loading
:loading
cls
echo Please wait, NyraOS is loading...
timeout /t 2 /NOBREAK >nul
echo NyraOS loaded! Initializing...
timeout /t 2 /NOBREAK >nul
if not exist .\SYSTEM\license.txt goto firststartup
if exist .\SYSTEM\license.txt echo License key found!
timeout /t 1 /NOBREAK >nul
goto menu
:firststartup
if exist .\SYSTEM\firstboot.setting goto firstboot2
if not exist .\SYSTEM\firstboot.setting goto falseversion
:falseversion
cls
echo Sorry, but your license file has been deleted!
echo NyraOS will now reset, to regenerate your 
echo license key. In the future, please do not 
echo delete your license.
echo If you paid for NyraOS, contact the seller and
echo demand for your money back! NyraOS is a
echo free-to-use batch OS! 
echo With love, 
echo Jessica Fawkes.
pause
goto resetaction
:firstboot2
cls
echo Welcome to Nyra OS, %USERNAME%. 
echo This project was developed by
echo Jessica Parnelli Fawkes, a
echo hobby programmer. She hopes you
echo enjoy her project, and asks 
echo for you to read the About page
echo located in Settings.
pause
goto removeboot
:removeboot
echo %RANDOM%-%RANDOM%-%RANDOM% is your license key. >> .\SYSTEM\license.setting
echo This is merely a random number to help ensure NyraOS integrity. >> .\SYSTEM\license.setting
if exist .\SYSTEM\firstboot.setting del .\SYSTEM\firstboot.setting && goto menu
if not exist.\SYSTEM\firstboot.setting goto menu
:menu
cls
echo Welcome to Nyra OS, %USERNAME%.
echo What would you like to do?
echo -------------------------------
echo 1) Applets
echo 2) Web Browser
echo 3) Settings
echo 4) Exit
echo -------------------------------
choice /c 1234>nul
if %errorlevel%==1 goto apps
if %errorlevel%==2 goto web
if %errorlevel%==3 goto settings
if %errorlevel%==4 exit
:web
cls
echo Would you like to open a preset tab
echo or just open the browser?
echo -----------------------------------
echo 1) Preset Tabs
echo 2) Browser
echo 3) Go Back
echo -----------------------------------
choice /c 123>nul
if %errorlevel%==1 goto presets
if %errorlevel%==2 goto browser
if %errorlevel%==3 goto menu
:browser
start iexplore.exe
goto menu
:presets
cls
echo Here are the current preset tabs:
echo ---------------------------------
echo 1) Google
echo 2) Bing
echo 3) Yahoo
echo 4) Bookmarks
echo 5) Go Back
echo ---------------------------------
choice /c 12345>nul
if %errorlevel%==1 start iexplore.exe "https://google.com" && goto menu
if %errorlevel%==2 start iexplore.exe "https://bing.com" && goto menu
if %errorlevel%==3 start iexplore.exe "https://yahoo.com" && goto menu
if %errorlevel%==4 goto bookmarks
if %errorlevel%==5 goto web
:bookmarks
cls
if exist \SYSTEM\bookmark1.setting goto bookmarkchoose
if not exist \SYSTEM\bookmark1.setting goto createbookmark
:addbookmark
cls
echo You do not have any bookmarks created, %USERNAME%.
echo Would you like to create one?
echo --------------------------------------------------
echo 1) Yes
echo 2) No
echo --------------------------------------------------
choice /c 12>nul
if %errorlevel%==1 goto generatebookmark
if %errorlevel%==2 goto presets
:generatebookmark
cls
echo What would 
:apps
cls
echo Here are the currently installed applets:
echo -----------------------------------------
echo 1) Calculator (x86) (TOOL)
echo 2) Tetris (GAME)
echo 3) Connect 4 (GAME)
echo 4) Snake (GAME)
echo 5) Media Player (TOOL)
echo 6) File Explorer (TOOL)
echo 7) External App (TOOL)
echo 8) Go Back
echo -----------------------------------------
choice /c 12345678>nul
if %errorlevel%==1 start .\SYSTEM\APPLETS\TOOL\calc.cmd && goto menu
if %errorlevel%==2 start .\SYSTEM\APPLETS\GAME\tetris.cmd && goto menu
if %errorlevel%==3 start .\SYSTEM\APPLETS\GAME\connect4.cmd && goto menu
if %errorlevel%==4 start .\SYSTEM\APPLETS\GAME\snake.cmd && goto menu
if %errorlevel%==5 start .\SYSTEM\APPLETS\TOOL\media.cmd && goto menu
if %errorlevel%==6 start .\SYSTEM\APPLETS\TOOL\files.cmd && goto menu
if %errorlevel%==7 start .\SYSTEM\APPLETS\TOOL\external.cmd && goto menu
if %errorlevel%==8 goto menu
:settings
cls
echo Welcome to the Settings page,
echo %USERNAME%. What would you
echo like to change?
echo -----------------------------
echo 1) About Nyra OS
echo 2) NyraOS Background Color
echo 3) Applets Background Color
echo 4) Future Updates
echo 5) NyraOS Website
echo 6) Go Back
echo 7) Reset Nyra OS
echo 8) View your License Key
echo -----------------------------
choice /c 123456789>nul
if %errorlevel%==1 goto about
if %errorlevel%==2 goto color
if %errorlevel%==3 goto appletcolor
if %errorlevel%==4 goto update
if %errorlevel%==5 goto website
if %errorlevel%==6 goto menu
if %errorlevel%==7 goto reset
if %errorlevel%==8 goto licensekey
:licensekey
cls
type .\SYSTEM\license.setting
pause
goto menu
:appletcolor
cls
echo Which color would you prefer?
echo This color will be set as the
echo default color for the 
echo included NyraOS applets.
echo -----------------------------
echo 1) Red
echo 2) Green
echo 3) Blue
echo 4) Purple
echo 5) Gray
echo 6) White (High Contrast)
echo 7) Yellow
echo 8) Aqua
echo 9) Go Back
echo -----------------------------
choice /c 123456789>nul
if %errorlevel%==1 goto color11
if %errorlevel%==2 goto color22
if %errorlevel%==3 goto color33
if %errorlevel%==4 goto color44
if %errorlevel%==5 goto color55
if %errorlevel%==6 goto color66
if %errorlevel%==7 goto color77
if %errorlevel%==8 goto color88
if %errorlevel%==9 goto settings
:color11
set color2=1
goto colorcheck2
:color22
set color2=2
goto colorcheck2
:color33
set color2=3
goto colorcheck2
:color44
set color2=4
goto colorcheck2
:color55
set color2=5
goto colorcheck2
:color66
set color2=6
goto colorcheck2
:color77
set color2=7
goto colorcheck2
:color88
set color2=8
goto colorcheck2
:colorcheck2
if exist .\SYSTEM\APPLETS\color1.clr del .\SYSTEM\APPLETS\color1.clr
if exist .\SYSTEM\APPLETS\color2.clr del .\SYSTEM\APPLETS\color2.clr
if exist .\SYSTEM\APPLETS\color3.clr del .\SYSTEM\APPLETS\color3.clr
if exist .\SYSTEM\APPLETS\color4.clr del .\SYSTEM\APPLETS\color4.clr
if exist .\SYSTEM\APPLETS\color5.clr del .\SYSTEM\APPLETS\color5.clr
if exist .\SYSTEM\APPLETS\color6.clr del .\SYSTEM\APPLETS\color6.clr
if exist .\SYSTEM\APPLETS\color7.clr del .\SYSTEM\APPLETS\color7.clr
if exist .\SYSTEM\APPLETS\color8.clr del .\SYSTEM\APPLETS\color8.clr
if %color2%==1 echo 4f >> .\SYSTEM\APPLETS\color1.clr && goto menu
if %color2%==2 echo 2f >> .\SYSTEM\APPLETS\color2.clr && goto menu
if %color2%==3 echo 1f >> .\SYSTEM\APPLETS\color3.clr && goto menu
if %color2%==4 echo 5f >> .\SYSTEM\APPLETS\color4.clr && goto menu
if %color2%==5 echo 8f >> .\SYSTEM\APPLETS\color5.clr && goto menu
if %color2%==6 echo f0 >> .\SYSTEM\APPLETS\color6.clr && goto menu
if %color2%==7 echo 6f >> .\SYSTEM\APPLETS\color7.clr && goto menu
if %color2%==8 echo 3f >> .\SYSTEM\APPLETS\color8.clr && goto menu
goto menu
:website
start iexplore "https://sites.google.com/view/elitetechnologiesweb/nyraos"
goto menu
:about
cls
echo Nyra OS:
echo Pure.
timeout /t 1 /NOBREAK >nul
echo Pretty.
timeout /t 1 /NOBREAK >nul
echo Powerful.
timeout /t 1 /NOBREAK >nul
echo This was what the creator,
echo Jessica Fawkes, had in mind
echo when she started designing
echo Nyra OS. 
timeout /t 3 /NOBREAK >nul
echo She wishes for you to have a
echo fun time using Nyra OS, 
echo and also to feel free in 
echo editing the code and addons.
timeout /t 3 /NOBREAK >nul
echo However, she warns you to add
echo a comment or notation in the 
echo script mentioning the project
echo origin and orignal programmer.
echo Please also document any edits
echo you make to the code in the 
echo section at the bottom.
echo With love,
echo Jessica P. Fawkes
pause
goto menu
:update
cls
echo These features are currrently
echo being developed. I don't know
echo when they will be released,
echo but sometime they will be.
echo The current version name is:
echo    Pellimore( version 3)
echo ---------------------------
echo -Custom text color
echo -Virus Scanner
echo -Custom Command Line
echo -Custom Bookmarks
echo -Choice for Web Browsers
echo -More Applets (As soon as I
echo  come up with more ideas)
pause
goto menu
:color
cls
echo Which color would you prefer?
echo This color will be set as the
echo default color.
echo -----------------------------
echo 1) Red
echo 2) Green
echo 3) Blue
echo 4) Purple
echo 5) Gray
echo 6) White (High Contrast)
echo 7) Yellow
echo 8) Aqua
echo 9) Go Back
echo -----------------------------
choice /c 123456789>nul
if %errorlevel%==1 goto color1
if %errorlevel%==2 goto color2
if %errorlevel%==3 goto color3
if %errorlevel%==4 goto color4
if %errorlevel%==5 goto color5
if %errorlevel%==6 goto color6
if %errorlevel%==7 goto color7
if %errorlevel%==8 goto color8
if %errorlevel%==9 goto settings
:color1
set color=1
goto colorcheck
:color2
set color=2
goto colorcheck
:color3
set color=3
goto colorcheck
:color4
set color=4
goto colorcheck
:color5
set color=5
goto colorcheck
:color6
set color=6
goto colorcheck
:color7
set color=7
goto colorcheck
:color8
set color=8
goto colorcheck
:colorcheck
if %color%==1 color 4f
if %color%==2 color 2f
if %color%==3 color 1f
if %color%==4 color 5f
if %color%==5 color 8f
if %color%==6 color f0
if %color%==7 color 6f
if %color%==8 color 3f
if exist .\SYSTEM\color1.clr del .\SYSTEM\color1.clr
if exist .\SYSTEM\color2.clr del .\SYSTEM\color2.clr
if exist .\SYSTEM\color3.clr del .\SYSTEM\color3.clr
if exist .\SYSTEM\color4.clr del .\SYSTEM\color4.clr
if exist .\SYSTEM\color5.clr del .\SYSTEM\color5.clr
if exist .\SYSTEM\color6.clr del .\SYSTEM\color6.clr
if exist .\SYSTEM\color7.clr del .\SYSTEM\color7.clr
if exist .\SYSTEM\color8.clr del .\SYSTEM\color8.clr
if %color%==1 echo 4f >> .\SYSTEM\color1.clr && goto menu
if %color%==2 echo 2f >> .\SYSTEM\color2.clr && goto menu
if %color%==3 echo 1f >> .\SYSTEM\color3.clr && goto menu
if %color%==4 echo 5f >> .\SYSTEM\color4.clr && goto menu
if %color%==5 echo 8f >> .\SYSTEM\color5.clr && goto menu
if %color%==6 echo f0 >> .\SYSTEM\color6.clr && goto menu
if %color%==7 echo 6f >> .\SYSTEM\color7.clr && goto menu
if %color%==8 echo 3f >> .\SYSTEM\color8.clr && goto menu
:reset
cls
echo Are you sure you want 
echo to reset NYRA OS?
echo ---------------------
echo 1) Yes
echo 2) No
echo ---------------------
choice /c 12>nul
if %errorlevel%==1 goto resetaction
if %errorlevel%==2 goto menu
:resetaction
if exist .\SYSTEM\color1.clr del .\SYSTEM\color1.clr
if exist .\SYSTEM\color2.clr del .\SYSTEM\color2.clr
if exist .\SYSTEM\color3.clr del .\SYSTEM\color3.clr
if exist .\SYSTEM\color4.clr del .\SYSTEM\color4.clr
if exist .\SYSTEM\color5.clr del .\SYSTEM\color5.clr
if exist .\SYSTEM\color6.clr del .\SYSTEM\color6.clr
if exist .\SYSTEM\color7.clr del .\SYSTEM\color7.clr
if exist .\SYSTEM\color8.clr del .\SYSTEM\color8.clr
if exist .\SYSTEM\APPLETS\color1.clr del .\SYSTEM\APPLETS\color1.clr
if exist .\SYSTEM\APPLETS\color2.clr del .\SYSTEM\APPLETS\color2.clr
if exist .\SYSTEM\APPLETS\color3.clr del .\SYSTEM\APPLETS\color3.clr
if exist .\SYSTEM\APPLETS\color4.clr del .\SYSTEM\APPLETS\color4.clr
if exist .\SYSTEM\APPLETS\color5.clr del .\SYSTEM\APPLETS\color5.clr
if exist .\SYSTEM\APPLETS\color6.clr del .\SYSTEM\APPLETS\color6.clr
if exist .\SYSTEM\APPLETS\color7.clr del .\SYSTEM\APPLETS\color7.clr
if exist .\SYSTEM\APPLETS\color8.clr del .\SYSTEM\APPLETS\color8.clr
if exist .\SYSTEM\license.txt del .\SYSTEM\license.txt
echo FIRSTBOOT >> .\SYSTEM\firstboot.setting
color
cls
echo Nyra OS has been reset. Goodbye, %USERNAME%.
pause
exit
::rem Please put your edit log here:
::rem To add more lines, type "::rem"
::rem -