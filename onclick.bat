@echo off
title Aktivasi Microsoft Office 365 Tanpa Software - BagiTekno&cls&echo =====================================================================================&echo #Project: Aktivasi Microsoft Office 365 FREE tanpa software&echo =====================================================================================&echo.&echo.&echo Memulai proses aktivasi, silahkan tunggu...&echo.&echo.&(if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16")&(if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16")&(for /f %%x in ('dir /b ..\root\Licenses16\ProPlus*VL_KMS*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)
:ucpkey
cscript //nologo ospp.vbs /dstatus | find /i "Last 5 characters of installed product key" > temp.txt || goto skunpkey
set /P bpkey= < temp.txt
set pkeyt=%bpkey:~-5%
echo Menghapus product key %pkeyt%, silahkan tunggu...&echo.&echo.
cscript //nologo ospp.vbs /unpkey:%pkeyt% >nul&goto ucpkey
:skunpkey
echo.&echo =====================================================================================&echo Mengaktivasi Office 365 anda, silahkan tunggu...&cscript //nologo slmgr.vbs /ckms >nul&cscript //nologo ospp.vbs /setprt:1688 >nul&cscript //nologo ospp.vbs /unpkey:6F7TH >nul&set i=1&cscript //nologo ospp.vbs /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH >nul||goto notsupported
:skms
if %i% GTR 10 (goto busy) else if %i% EQU 1 (set KMS=e8.us.to) else if %i% EQU 2 (set KMS=e9.us.to) else if %i% EQU 3 (set KMS=kms7.MSGuides.com) else if %i% EQU 4 (set KMS=kms8.MSGuides.com) else if %i% EQU 5 (set KMS=kms9.MSGuides.com) else if %i% GTR 5 (goto ato)
cscript //nologo ospp.vbs /sethst:%KMS% >nul
:ato
echo =====================================================================================&echo.&echo.&cscript //nologo ospp.vbs /act | find /i "successful" && (echo.&echo =====================================================================================&echo.&echo.&echo Dukung kami dengan donasi via saweria.co/bagitekno agar cara ini bisa terus digunakan.&echo.&echo =====================================================================================& if errorlevel 2 exit) || (echo Sepertinya butuh waktu lebih, silahkan tunggu... & echo. & echo. & set /a i+=1 & goto skms)&explorer "https://saweria.co/bagitekno"&goto halt
:notsupported
echo =====================================================================================&echo.&echo Maaf, Office 365 anda tidak support. Solusinya, ikuti panduan pada artikel yang terbuka di browser.&echo.&explorer "https://www.bagitekno.net/office/solusi-jika-office-tidak-support-aktivasi-pakai-cmd.html"&goto halt
:busy
echo =====================================================================================&echo.&echo Server sedang sibuk, sedang mencoba lagi, silahkan tunggu...&echo.&set /a i=1&goto skms
:halt
del temp.txt&cd %~dp0&del %0 >nul&pause >nul
