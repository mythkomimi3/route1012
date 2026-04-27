@echo off
chcp 65001 > nul
setlocal

set "FOLDER=C:\Users\mythk\OneDrive\Desktop\Route101"

echo Route101 フォルダを監視中...
echo index.html 以外の .html ファイルが保存されると index.html に自動変換します。
echo 終了するには Ctrl+C を押してください。
echo.

:loop
for %%f in ("%FOLDER%\*.html") do (
    if /i not "%%~nxf"=="index.html" (
        powershell -Command "Rename-Item -Path '%%f' -NewName 'index.html' -Force"
        echo 変換完了: %%~nxf -^> index.html
    )
)
timeout /t 3 /nobreak > nul
goto loop