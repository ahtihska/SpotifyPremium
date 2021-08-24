@echo off
COLOR 0a
MODE con:cols=100 lines=20
TITLE Blocca ADS e Updates
taskkill /f /im Spotify.exe
xcopy /s "%~dp0chrome_elf.dll" "%appdata%\Spotify" /y
xcopy /s "%~dp0config.ini" "%appdata%\Spotify" /y
icacls "%localappdata%\Spotify\Update" /reset /T
del /s /q "%localappdata%\Spotify\Update"
mkdir "%localappdata%\Spotify\Update"
icacls "%localappdata%\Spotify\Update" /deny "%username%":W
if not exist "%appdata%\Spotify\" mkdir "%appdata%\Spotify"
del "%appdata%\Spotify\SpotifyMigrator.exe"
del "%appdata%\Spotify\SpotifyStartupTask.exe"
pause
exit