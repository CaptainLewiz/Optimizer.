@echo off
title ULTRA OPTIMIZER V1.0 - KERNEL LEVEL TWEAKS
color 0b
echo ==========================================
echo    INITIALIZING DEEP SYSTEM OPTIMIZATION
echo ==========================================
:: Run as Admin check
net session >nul 2>&1
if %errorLevel% == 0 ( echo [OK] Admin Rights Detected ) else ( echo [!] PLEASE RUN AS ADMIN! & pause & exit )

:: 1. DISABLE POWER THROTTLING (Stop CPU Parking)
echo [+] Disabling Power Throttling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f

:: 2. VRAM SPOOF (Intel GMM Hack)
:: Sets Dedicated Video Memory to 1GB to bypass game launchers
echo [+] Spoofing 1GB VRAM for Intel Graphics...
reg add "HKLM\SOFTWARE\Intel\GMM" /v "DedicatedSegmentSize" /t REG_DWORD /d 1024 /f

:: 3. NETWORK LATENCY (Lower Ping)
echo [+] Optimizing Network for Gaming...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f

:: 4. SYSTEM PRIORITY (Focus CPU on Game)
echo [+] Setting Win32 Priority Separation to 26 (Hex)...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f

:: 5. DEEP CLEAN (Free up 8GB RAM)
echo [+] Flushing Standby List and Temp Files...
del /q/f/s %TEMP%\*
del /q/f/s C:\Windows\Prefetch\*
ipconfig /flushdns

echo ==========================================
echo    TWEAKS APPLIED! RESTART YOUR PC.
echo ==========================================
pause