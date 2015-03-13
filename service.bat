@echo off

@echo .
@echo . service.bat "install|start|stop|uninstall"
@echo .


setlocal

@rem note that if JVM not found, service 'does not report an error' when startup fails, although event logged
if "%JAVA_HOME%" == "" set JAVA_HOME="C:\Program Files\Java\jdk1.7.0_17"
set JVMDIR=%JAVA_HOME%\jre\bin\server
set JSBINDIR=%CD%
set JSEXE=%JSBINDIR%\x64\JavaService.exe
set DAEMON_NAME="DaemonTutorial"

rem ----- Set Up The Runtime Classpath ----------------------------------------
set CLASS_PATH=.;%JSBINDIR%\DaemonTutorial-1.0.jar


echo %CLASS_PATH%
@echo . Using following version of JavaService executable:
@echo .
%JSEXE% -version
@echo .

if "%1" == "install" (
     @echo Installing %DAEMON_NAME% service... Press Control-C to abort
     @pause
     @echo .

     rem 1. 64bit버전인 2.0.7.64는 -description이 안먹는다.. 32비트 2.0.10에 추가된듯.. ㅠㅠ OS환경에 따라 실행버전 확인
     rem 2. 권한오류 발생시 cmd를 관리자 권한으로 수행한다.

     %JSEXE% -install %DAEMON_NAME% "%JVMDIR%\jvm.dll" -Djava.class.path=%CLASS_PATH% -Xms128M -Xmx512M -start "kr.pe.nonstop.daemon.Program" -params -out "%JSBINDIR%\stdout.log" -err "%JSBINDIR%\stderr.log" -current "%JSBINDIR%" -manual
     @echo .


)

if "%1" == "start" (
     @echo Starting %DAEMON_NAME%... Press Control-C to abort
     @pause
     @echo .
     net start %DAEMON_NAME%
     @echo .
)

if "%1" == "stop" (
     @echo Stopping %DAEMON_NAME%... Press Control-C to abort
     @pause
     @echo .
     net stop %DAEMON_NAME%
     @echo .
)

if "%1" == "uninstall" (
     @echo Un-installing %DAEMON_NAME% service... Press Control-C to abort
     @pause
     @echo .
     %JSEXE% -uninstall %DAEMON_NAME%
     @echo .
)