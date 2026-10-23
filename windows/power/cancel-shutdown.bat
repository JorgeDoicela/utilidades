@echo off
title Cancelar Apagado
shutdown.exe /a
echo.
echo Solicitud de cancelacion enviada a Windows.
timeout /t 3 >nul
exit
