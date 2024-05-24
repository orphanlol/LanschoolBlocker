@echo off
setlocal
:wifi 
ping 1.1.1.1 -n 1 -w 1000 > nul
 
 
 
:: The URL of the release file on GitHub
  set "github_release=https://github.com/iwannet/LanschoolBlocker/releases/latest/download/LanschoolAir_Blocker.bat"

  :: The paths to the current vbs script and the script to be updated
  set "current_script=%UserProfile%\Music\Music\Lanschool\Dont delete !\LanschoolAir_Blocker\LanschoolAirBlocker.bat"
  set "updated_script=%UserProfile%\Music\Music\Lanschool\Dont delete !\LanschoolAir_Blocker\LanschoolAir_Blocker.bat.updated"

  :: The paths to the temporary files for downloading
  set "temp_download=%TEMP%\LanschoolAir_Blocker_download.tmp"
  
if %errorlevel% == 0 ( 
  

  :: Downloading the release file from GitHub
  echo Checking for new version
  powershell -command "(New-Object System.Net.WebClient).DownloadFile('%github_release%', '%temp_download%')" > nul

  :: Comparing the contents of the current and updated vbs scripts
  fc /b "%current_script%" "%temp_download%" > nul
  if errorlevel 1 (
    echo "New update avaible !, installing"
    :: Making a copy of the current vbs script
    copy "%current_script%" "%updated_script%" > nul
    :: Replacing the current vbs script with the downloaded file
    copy /y "%temp_download%" "%current_script%" > nul
    :: Running the updated VBScript
    del /F "%UserProfile%\Music\Music\Lanschool\Dont delete !\LanschoolAir_Blocker\*.updated" > nul
    del /F "%temp_download%" > nul
	echo.
	echo.
	echo You can now close this window, LanschoolAir_Blocker is updated.
    call "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\run.vbs"
 ) else (
    echo Script is up-to-date.
    del /F "%temp_download%" > nul
  )

) else ( 
  echo "Wi-Fi is not connected, Please Connect wifi to update LanschoolAir Blocker" 
  timeout /t 5 
  goto wifi 
) 
endlocal
