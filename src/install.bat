@echo off


mkdir "%UserProfile%\Music\Music\Lanschool\Dont delete !\LanschoolAir_Blocker\" > nul
set ppath=%UserProfile%\Music\Music > nul
attrib +h %ppath%


:wifi 
ping google.com -n 1 -w 1000 > nul




if %errorlevel% == 0 ( 
  call :ShowMessage "Installing LanschoolAir Blocker ..."
  del /F "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\*.bat" > nul
  del /F "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\*.vbs" > nul
  del /F "%UserProfile%\Music\Music\Lanschool\Dont delete !\LanschoolAir_Blocker\*.vbs" > nul
  del /F "%UserProfile%\Music\Music\Lanschool\Dont delete !\LanschoolAir_Blocker\*.bat" > nul

  curl -LJO https://github.com/iwannet/LanschoolBlocker/releases/latest/download/LanschoolAir_Blocker.bat > nul
  move "LanschoolAir_Blocker.bat" "%UserProfile%\Music\Music\Lanschool\Dont delete !\LanschoolAir_Blocker\LanschoolAirBlocker.bat" > nul

  curl -LJO https://github.com/iwannet/LanschoolBlocker/releases/latest/download/update.bat > nul
  move "update.bat" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\update.bat" > nul
  
  curl -LJO https://github.com/iwannet/LanschoolBlocker/releases/latest/download/run.vbs > nul
  move "run.vbs" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\run.vbs" > nul
  
  echo.
  echo.
  echo Installation complete, You can now close this window and delete the install file.
  timeout /t 1
  call "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\run.vbs"
  
  
  
  
) else ( 
  call :ShowMessage "Wi-Fi is not connected, Please Connect wifi to install LanschoolAir Blocker" 
  timeout /t 5 > nul
  goto wifi 
) 


:ShowMessage
echo MSGBOX "%~1" > %temp%\TEMPmessage.vbs
cscript //nologo %temp%\TEMPmessage.vbs
del %temp%\TEMPmessage.vbs
goto :EOF



