@echo off
title Vega IRON Rooting tool ver 2.0
:START
echo			Vega IRON Rooting tool ver 2.0
echo	���� �� �ؾߵ� �۾�
echo	1. USB ����� ��� üũ
echo	2. USB driver intsall
echo.
echo			Infomation
echo	Superuser ���� :
echo	 SuperSU 1.41 / Superuser(CWM) 1.0.1.8 / Superuser(ChainsDD) 3.1.3
echo	���� �߿��� ���� : 
echo	 SKTelecom 1.44 / Olleh 1.27 / U+ 1.32
echo	ADBdriverinstaller ��ó http://adbdriver.com/downloads/
echo	CWM ��ó http://cafe.naver.com/skydevelopers/257564
echo	���� : �簻
echo.
echo			 M e n u
echo	SKT/KT ���� (U+ ���� ����)
echo	1. ADB driver install ^& rooting
echo	2. Rooting
echo	SKT/KT/U+ ��� ��� ����
echo	3. Kernel tampered cnt reset
echo	4. ���� �� �ø���
echo	5. Vega IRON Rooting tool ����
echo.
set /p mode= ���Ͻô� ������ �Է� �� ����Ű�� �������� : 
if /i "%mode%" == "1" goto driver
if /i "%mode%" == "2" goto rooting
if /i "%mode%" == "3" goto cnt
if /i "%mode%" == "4" goto rom_up
if /i "%mode%" == "5" goto exit
cls
:driver
echo			Superuser install choice
echo	1. SuperSU
echo	2. Superuser(CWM)
echo	3. Superuser(ChainsDD)
set /p Su1= ���Ͻô� ���þ��� ���� �� ����Ű�� �������� : 
echo ��ġ�� ��ٸ��� ��....
adb wait-for-device
echo reboot bootloader
adb reboot bootloader
echo CWM booting
fastboot boot recovery.img
echo boot complete
echo install zip from sideload�� �������ּ���.
echo �����ϼ����� �ƹ�Ű�� �����ּ���.
pause
echo AdbDriverInstaller.exe�� ����˴ϴ�.
AdbDriverInstaller.exe
echo install �����ּ���.
echo ��� â �� ��� ��� �����ּ���.
echo ��ġ�� �Ϸ� �Ǿ����� �ƹ�Ű�� �����ּ���.
pause
echo ADBdriverinstaller�� ����ǰ� rooting�� �����մϴ�.
taskkill /f /im AdbDriverInstaller.exe
if /i "%Su1%" == "1" adb sideload UPDATE-SuperSU-v1.41.zip 
if /i "%Su1%" == "2" adb sideload superuser.zip
if /i "%Su1%" == "3" adb sideload Superuser-3.1.3-arm-signed.zip
echo �÷����� �Ϸ�Ǹ� �ƹ�Ű�� �����ּ���.
pause
echo 
echo ADB Driver �� rooting�� �Ϸ� �Ǿ����ϴ�.
echo.
adb kill-server
echo 1. �ʱ�޴��� ���ư��� 
echo 2. �����ϱ�
set /p exitmenu= ���Ͻô� ������ �Է� �� ����Ű�� �������� : 
if /i "%exitmenu%" == "1" goto START
if /i "%exitmenu%" == "2" goto exit
cls
:rooting
echo			Superuser install choice
echo	1. SuperSU
echo	2. Superuser(CWM)
echo	3. Superuser(ChainsDD)
set /p Su2= ��ġ�� ���ϴ� ���þ��� ���� �� ����Ű�� �������� : 
echo ��ġ�� ��ٸ��� ��....
adb wait-for-device
echo reboot bootloader
adb reboot bootloader
echo CWM booting
fastboot boot recovery.img
echo boot complete
echo install zip from sideload�� �������ּ���.
echo �����ϼ����� �ƹ�Ű�� �����ּ���.
pause
echo rooting... 
if /i "%Su2%" == "1" adb sideload UPDATE-SuperSU-v1.41.zip 
if /i "%Su2%" == "2" adb sideload superuser.zip
if /i "%Su2%" == "3" adb sideload Superuser-3.1.3-arm-signed.zip
echo �÷����� �Ϸ�Ǹ� �ƹ�Ű�� �����ּ���.
pause
echo reboot ��...
adb reboot
echo Rooting�� �Ϸ� �Ǿ����ϴ�.
echo.
adb kill-server
echo 1. �ʱ�޴��� ���ư��� 
echo 2. �����ϱ�
set /p exitmenu= ���Ͻô� ������ �Է� �� ����Ű�� �������� : 
if /i "%exitmenu%" == "1" goto START
if /i "%exitmenu%" == "2" goto exit
cls
:cnt
echo rawdata.img�� sdcard�� �����մϴ�.
adb push rawdata.img /sdcard/
echo aboot.img�� sdcard�� �����մϴ�.
adb push aboot.img /sdcard/
echo adb shell�� ��Ʈ ���� ��� ���ּ���
echo adb shell�� ��Ʈ ������ �ִٸ� ��� ���� �˴ϴ�.
echo rawdata.img�� dev/block/mmcblk0p12�� ����˴ϴ�
adb shell su -c dd of=/dev/block/mmcblk0p12 if=/sdcard/rawdata.img
echo rawdata.img�� dev/block/mmcblk0p12�� ����Ǿ����ϴ�.
echo aboot.img�� dev/block/mmcblk0p5�� ����˴ϴ�.
adb shell su -c dd of=/dev/block/mmcblk0p5 if=/sdcard/aboot.img
echo aboot.img�� dev/block/mmcblk0p5�� ����Ǿ����ϴ�.
echo reboot
adb reboot
echo Kernel tampered cnt reset complete
adb kill-server
echo 1. �ʱ�޴��� ���ư��� 
echo 2. �����ϱ�
set /p exitmenu= ���Ͻô� ������ �Է� �� ����Ű�� �������� : 
if /i "%exitmenu%" == "1" goto START
if /i "%exitmenu%" == "2" goto exit
cls
:rom_up
echo			Operator selection
echo	1. SKTelecom
echo	2. Olleh
echo	3. U+
set /p Telecom= �ش� ��Ż縦 �Է� �� ����Ű�� �������� :
echo ��ġ�� ��ٸ��� ��....
adb wait-for-device
echo reboot recovery...
adb reboot recovery
echo access recovery mode!
echo apply update from ADB�� �������ּ���.
echo �����ϼ����� �ƹ�Ű�� �����ּ���.
pause
echo Rom Upload... 
if /i "%Telecom%" == "1" adb sideload IM-A870S_S0218144_Update.zip
if /i "%Telecom%" == "2" adb sideload IM-A870K_S0839127_Update.zip
if /i "%Telecom%" == "3" adb sideload IM-A870L_S1235132_Update.zip
echo �÷����� �Ϸ�Ǹ� �ƹ�Ű�� �����ּ���.
pause
echo reboot ��...
adb reboot
echo ���� �� ���ε尡 �Ϸ� �Ǿ����ϴ�.
echo.
adb kill-server
echo 1. �ʱ�޴��� ���ư��� 
echo 2. �����ϱ�
set /p exitmenu= ���Ͻô� ������ �Է� �� ����Ű�� �������� : 
if /i "%exitmenu%" == "1" goto START
if /i "%exitmenu%" == "2" goto exit
cls
:exit