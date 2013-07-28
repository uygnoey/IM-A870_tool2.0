@echo off
title Vega IRON Rooting tool ver 2.0
:START
echo			Vega IRON Rooting tool ver 2.0
echo	루팅 전 해야될 작업
echo	1. USB 디버깅 모드 체크
echo	2. USB driver intsall
echo.
echo			Infomation
echo	Superuser 버전 :
echo	 SuperSU 1.41 / Superuser(CWM) 1.0.1.8 / Superuser(ChainsDD) 3.1.3
echo	순정 펌웨어 버전 : 
echo	 SKTelecom 1.44 / Olleh 1.27 / U+ 1.32
echo	ADBdriverinstaller 출처 http://adbdriver.com/downloads/
echo	CWM 출처 http://cafe.naver.com/skydevelopers/257564
echo	제작 : 양갱
echo.
echo			 M e n u
echo	SKT/KT 전용 (U+ 지원 예정)
echo	1. ADB driver install ^& rooting
echo	2. Rooting
echo	SKT/KT/U+ 모두 사용 가능
echo	3. Kernel tampered cnt reset
echo	4. 순정 롬 올리기
echo	5. Vega IRON Rooting tool 종료
echo.
set /p mode= 원하시는 선택을 입력 후 엔터키를 누르세요 : 
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
set /p Su1= 원하시는 루팅앱을 선택 후 엔터키를 누르세요 : 
echo 장치를 기다리는 中....
adb wait-for-device
echo reboot bootloader
adb reboot bootloader
echo CWM booting
fastboot boot recovery.img
echo boot complete
echo install zip from sideload로 진입해주세요.
echo 진입하셨으면 아무키나 눌러주세요.
pause
echo AdbDriverInstaller.exe가 실행됩니다.
AdbDriverInstaller.exe
echo install 눌러주세요.
echo 경고 창 뜰 경우 계속 눌러주세요.
echo 설치가 완료 되었으면 아무키나 눌러주세요.
pause
echo ADBdriverinstaller가 종료되고 rooting을 진행합니다.
taskkill /f /im AdbDriverInstaller.exe
if /i "%Su1%" == "1" adb sideload UPDATE-SuperSU-v1.41.zip 
if /i "%Su1%" == "2" adb sideload superuser.zip
if /i "%Su1%" == "3" adb sideload Superuser-3.1.3-arm-signed.zip
echo 플래싱이 완료되면 아무키나 눌러주세요.
pause
echo 
echo ADB Driver 및 rooting이 완료 되었습니다.
echo.
adb kill-server
echo 1. 초기메뉴로 돌아가기 
echo 2. 종료하기
set /p exitmenu= 원하시는 선택을 입력 후 엔터키를 누르세요 : 
if /i "%exitmenu%" == "1" goto START
if /i "%exitmenu%" == "2" goto exit
cls
:rooting
echo			Superuser install choice
echo	1. SuperSU
echo	2. Superuser(CWM)
echo	3. Superuser(ChainsDD)
set /p Su2= 설치를 원하는 루팅앱을 선택 후 엔터키를 누르세요 : 
echo 장치를 기다리는 中....
adb wait-for-device
echo reboot bootloader
adb reboot bootloader
echo CWM booting
fastboot boot recovery.img
echo boot complete
echo install zip from sideload로 진입해주세요.
echo 진입하셨으면 아무키나 눌러주세요.
pause
echo rooting... 
if /i "%Su2%" == "1" adb sideload UPDATE-SuperSU-v1.41.zip 
if /i "%Su2%" == "2" adb sideload superuser.zip
if /i "%Su2%" == "3" adb sideload Superuser-3.1.3-arm-signed.zip
echo 플래싱이 완료되면 아무키나 눌러주세요.
pause
echo reboot 中...
adb reboot
echo Rooting이 완료 되었습니다.
echo.
adb kill-server
echo 1. 초기메뉴로 돌아가기 
echo 2. 종료하기
set /p exitmenu= 원하시는 선택을 입력 후 엔터키를 누르세요 : 
if /i "%exitmenu%" == "1" goto START
if /i "%exitmenu%" == "2" goto exit
cls
:cnt
echo rawdata.img를 sdcard로 전송합니다.
adb push rawdata.img /sdcard/
echo aboot.img를 sdcard로 전송합니다.
adb push aboot.img /sdcard/
echo adb shell의 루트 권한 허용 해주세요
echo adb shell의 루트 권한이 있다면 계속 진행 됩니다.
echo rawdata.img가 dev/block/mmcblk0p12로 복사됩니다
adb shell su -c dd of=/dev/block/mmcblk0p12 if=/sdcard/rawdata.img
echo rawdata.img가 dev/block/mmcblk0p12로 복사되었습니다.
echo aboot.img가 dev/block/mmcblk0p5로 복사됩니다.
adb shell su -c dd of=/dev/block/mmcblk0p5 if=/sdcard/aboot.img
echo aboot.img가 dev/block/mmcblk0p5로 복사되었습니다.
echo reboot
adb reboot
echo Kernel tampered cnt reset complete
adb kill-server
echo 1. 초기메뉴로 돌아가기 
echo 2. 종료하기
set /p exitmenu= 원하시는 선택을 입력 후 엔터키를 누르세요 : 
if /i "%exitmenu%" == "1" goto START
if /i "%exitmenu%" == "2" goto exit
cls
:rom_up
echo			Operator selection
echo	1. SKTelecom
echo	2. Olleh
echo	3. U+
set /p Telecom= 해당 통신사를 입력 후 엔터키를 누르세요 :
echo 장치를 기다리는 中....
adb wait-for-device
echo reboot recovery...
adb reboot recovery
echo access recovery mode!
echo apply update from ADB로 진입해주세요.
echo 진입하셨으면 아무키나 눌러주세요.
pause
echo Rom Upload... 
if /i "%Telecom%" == "1" adb sideload IM-A870S_S0218144_Update.zip
if /i "%Telecom%" == "2" adb sideload IM-A870K_S0839127_Update.zip
if /i "%Telecom%" == "3" adb sideload IM-A870L_S1235132_Update.zip
echo 플래싱이 완료되면 아무키나 눌러주세요.
pause
echo reboot 中...
adb reboot
echo 순정 롬 업로드가 완료 되었습니다.
echo.
adb kill-server
echo 1. 초기메뉴로 돌아가기 
echo 2. 종료하기
set /p exitmenu= 원하시는 선택을 입력 후 엔터키를 누르세요 : 
if /i "%exitmenu%" == "1" goto START
if /i "%exitmenu%" == "2" goto exit
cls
:exit