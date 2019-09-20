@echo off
if exist .\SYSTEM\APPLETS\color1.clr color 4f
if exist .\SYSTEM\APPLETS\color2.clr color 2f
if exist .\SYSTEM\APPLETS\color3.clr color 1f
if exist .\SYSTEM\APPLETS\color4.clr color 5f
if exist .\SYSTEM\APPLETS\color5.clr color 8f
if exist .\SYSTEM\APPLETS\color6.clr color f0
if exist .\SYSTEM\APPLETS\color7.clr color 6f
if exist .\SYSTEM\APPLETS\color8.clr color 3f
title Calculator (x86)
cls
goto main
:main
cls
echo What Would You Like To Calculate?
echo ---------------------------------
echo 1) Add
echo 2) Subtract
echo 3) Multiply
echo 4) Divide
echo 5) Exit
echo ---------------------------------
choice /c 12345>nul
if %errorlevel%==1 goto add
if %errorlevel%==2 goto subtract
if %errorlevel%==3 goto multiply
if %errorlevel%==4 goto divide
if %errorlevel%==5 exit
:add
cls
echo Please Enter The First Number You Want To Add:
echo --------------------------------------------------
set /p add1=">>>:"
cls
echo Please Enter The Second Number You Want To Add:
echo --------------------------------------------------
set /p add2=">>>:"
goto addresult
:subtract
cls
echo Please Enter The First Number You Want To Subtract:
echo --------------------------------------------------
set /p subtract1=">>>:"
cls
echo Please Enter The Second Number You Want To Subtract:
echo --------------------------------------------------
set /p subtract2=">>>:"
goto subresult
:multiply
cls
echo Please Enter The First Number You Want To Multiply:
echo --------------------------------------------------
set /p multiply1=">>>:"
cls
echo Please Enter The Second Number You Want To Multiply:
echo --------------------------------------------------
set /p multiply2=">>>:"
goto mulresult
:divide
cls
echo Please Enter The First Number You Want To Divide:
echo --------------------------------------------------
set /p divide1=">>>:"
cls
echo Please Enter The Second Number You Want To Divide:
echo --------------------------------------------------
set /p divide2=">>>:"
goto divresult
:addresult
set /a result= %add1% + %add2%
cls
echo The Answer Is: %result%
pause
goto main
:subresult
set /a result= %subtract1% - %subtract2%
cls
echo The Answer Is: %result%
pause
goto main
:mulresult
set /a result= %multiply1% * %multiply2%
cls
echo The Answer Is: %result%
pause
goto main
:divresult
set /a result= %divide1% / %divide2%
cls
echo The Answer Is: %result%
pause
goto main