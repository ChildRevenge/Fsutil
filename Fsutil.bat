@echo off
cls
setlocal enabledelayedexpansion
set folderPath=%appdata%\SS\Fsutils
if exist "%folderPath%" (
    rd /s /q "%folderPath%"
)
mkdir %appdata%\SS\Fsutils\Macros 2>nul
mkdir %appdata%\SS\Fsutils\Extra 2>nul
mkdir %appdata%\SS\Fsutils\EXE 2>nul
mkdir %appdata%\SS\Fsutils\DLL 2>nul
mkdir %appdata%\SS\Fsutils\PFs 2>nul
mkdir %appdata%\SS\Fsutils\JAR 2>nul
mkdir %appdata%\SS\Fsutils\BAT 2>nul
mkdir %appdata%\SS\Fsutils\CrashDump 2>nul
mkdir %appdata%\SS\Fsutils\Archives 2>nul
mkdir %appdata%\SS\Fsutils 2>nul
echo %d%Running Fsutil Commands. . .
timeout /t 2 /nobreak >nul
fsutil usn readjournal c: csv >> %appdata%\SS\Fsutils\FsutilJournal.txt
set Fsutil="%appdata%\SS\Fsutils\FsutilJournal.txt"
findstr /i /c:"AppCrash" "%Fsutil%" >> %appdata%\SS\Fsutils\Crashdump\AppCrash
findstr /i /c:".exe" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\EXE\DeletedExes.txt
findstr /i /c:".exe" "%Fsutil%" | findstr /i /c:"0x00080000" >> %appdata%\SS\Fsutils\EXE\ObjectIDChange.txt
findstr /i /c:".exe" "%Fsutil%" | findstr /i /c:"0x00001000" >> %appdata%\SS\Fsutils\EXE\RenamedExes.txt
findstr /i /c:".dll" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\DLL\DeletedDLLs.txt
findstr /i /c:".dll" "%FsutiL%" | findstr /i /c:".lnk" >> %appdata%\SS\Fsutils\DLL\LNKDLL.txt
findstr /i /c:".dll" "%Fsutil%" >> %appdata%\SS\Fsutils\DLL\AllDLL.txt
findstr /i /c:".mcf" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Macros\glorious.txt
findstr /i /c:".cuecfg" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Macros\corsair.txt
findstr /i /c:".db" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Macros\logitech.txt
findstr /i /c:".com" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Macros\Macroswitcher.txt
findstr /i /c:".crdownload" "%Fsutil%" >> %appdata%\SS\Fsutils\Extra\DownloadCache.txt
findstr /i /c:".evtx" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Extra\DeletedEventLog.txt
findstr /i /c:"?" "%Fsutil%" >> %appdata%\SS\Fsutils\Extra\EmptyCharacter.txt
findstr /i /c:"jnativehook" "%Fsutil%" >> %appdata%\SS\Fsutils\Extra\Jnat.txt
findstr /i /c:"0x00080000" "%Fsutil%" | findstr /i /c:"0x00000005" >> %appdata%\SS\Fsutils\Extra\DataTruncation.txt
findstr /i /c:".jar" "%Fsutil%" | findstr /i /c:"0x00001000" >> %appdata%\SS\Fsutils\JAR\RenamedJars.txt
findstr /i /c:".jar" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\JAR\DeletedJars.txt
findstr /i /c:".jar" "%Fsutil%" | findstr /i /c:"0x00000020" >> %appdata%\SS\Fsutils\JAR\AllJars.txt
findstr /i /C:"0x00000004" "%Fsutil%" | findstr /i /C:"0x00000102" | findstr /i /C:"jar_cache" | findstr /i /C:".timestamp" >> %appdata%\SS\Fsutils\JAR\JarCache.txt
findstr /i /c:"Data Truncation" "%Fsutil%" | findstr /i /c:".jar" >> %appdata%\SS\Fsutils\JAR\JarDataTruncation.txt
findstr /i /c:".pf" "%Fsutil%" | findstr /i /c:"0x00001000" >> %appdata%\SS\Fsutils\PFs\RenamedPF.txt
findstr /i /c:".pf" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\PFs\DeletedPF.txt
findstr /i /c:".pf" "%Fsutil%" | findstr /i /c:"0x00008000" >> %appdata%\SS\Fsutils\PFs\Prefetch.txt
findstr /i /c:".bat" "%Fsutil%" | findstr /i /c:"0x00001000" >> %appdata%\SS\Fsutils\BAT\RenamedBats.txt
findstr /i /c:".bat" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\BAT\DeletedBats.txt
findstr /i /c:".dmp" "%Fsutil%" | findstr /i /c:".exe" >> %appdata%\SS\Fsutils\CrashDump\CrashDmp.txt
findstr /i /c:".exe.log" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\CrashDump\DeletedAppCrash.txt
findstr /i /c:".rar" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Archives\DeletedRar.txt
findstr /i /c:".zip" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Archives\DeletedZip.txt
findstr /i /c:".7z" "%Fsutil%" | findstr /i /c:"0x80000200" >>  %appdata%\SS\Fsutils\Archives\Deleted7z.txt
findstr /i /c:".tar" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Archives\DeletedTar.txt
findstr /i /c:".gz" "%Fsutil%" | findstr /i /c:"0x80000200" >>  %appdata%\SS\Fsutils\Archives\DeletedGz.txt
start "" %appdata%\SS\Fsutils
exit /b