@echo off
title Temporizador de Apagado - Windows
cls
echo ======================================================
echo             TEMPORIZADOR DE APAGADO
echo ======================================================
echo.
echo  1. Programar apagado en minutos
echo  2. Programar apagado en horas
echo  3. Cancelar apagado activo
echo  4. Salir
echo.
set /p opcion="Seleccione una opcion (1-4): "

if "%opcion%"=="1" goto minutos
if "%opcion%"=="2" goto horas
if "%opcion%"=="3" goto cancelar
if "%opcion%"=="4" goto fin
goto fin

:minutos
set /p min="Minutos hasta el apagado: "
set /a seg=%min%*60
shutdown.exe /s /t %seg%
echo.
echo Apagado programado en %min% minutos (%seg% segundos).
pause
goto fin

:horas
set /p hr="Horas hasta el apagado: "
set /a seg=%hr%*3600
shutdown.exe /s /t %seg%
echo.
echo Apagado programado en %hr% horas (%seg% segundos).
pause
goto fin

:cancelar
shutdown.exe /a
echo.
echo Apagado programado cancelado exitosamente.
pause
goto fin

:fin
exit
