@echo off


call :ShowMessage "LanschoolAir_Blocker started successfully. Credits to iwannet, Check my website: www.iwannet.cc" 

for /l %%i in (1,1,2147483647) do (
    

	
	taskkill /im LSAirClient.exe /f 
	taskkill /im LSAirClientUI.exe /f 
	taskkill /im student.exe /f
	timeout /t 1
	
)


:ShowMessage
echo MSGBOX "%~1" > %temp%\TEMPmessage.vbs
cscript //nologo %temp%\TEMPmessage.vbs
del %temp%\TEMPmessage.vbs
goto :EOF

 

