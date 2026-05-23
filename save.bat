@echo off
:: ================================================
:: save.bat — быстрое сохранение прогресса на GitHub
:: Использование: save.bat "описание изменений"
:: ================================================

set GIT=C:\PortableGit\bin\git.exe

if "%~1"=="" (
    set MSG=Update %DATE% %TIME%
) else (
    set MSG=%~1
)

"%GIT%" -C "%~dp0" add -A
"%GIT%" -C "%~dp0" commit -m "%MSG%"
"%GIT%" -C "%~dp0" push origin main

echo.
echo === Сохранено на GitHub! ===
echo https://github.com/phala392-byte/deltapaw
pause
