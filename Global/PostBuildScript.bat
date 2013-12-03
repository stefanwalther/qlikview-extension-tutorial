@@echo off

set TARGET_PATH=C:\Users\%USERNAME%\AppData\Local\QlikTech\QlikView\Extensions\Objects
set EXTENSION_NAME=%~1
set VS_TARGET_DIR=%~2
set VS_TARGETNAME=%~3
set VS_TARGETFILENAME=%~4

echo.-------------------------
echo.Settings for local extension deployment:
echo.
echo.Extension Name: 			EXTENSION_NAME		%EXTENSION_NAME%
echo.Visual Studio Target Dir: 	VS_TARGET_DIR		%VS_TARGET_DIR%
echo.Target Path: 				TARGET_PATH			%TARGET_PATH%
echo.Target Name: 				VS_TARGETNAME		%VS_TARGETNAME%
echo.Target File Name:			VS_TARGETFILENAME	%VS_TARGETFILENAME%
echo.
echo.-------------------------
echo.DEPLOYMENT:
echo.
if not exist "%TARGET_PATH%\%EXTENSION_NAME%\" (
	echo ... creating destination directory for extension "%EXTENSION_NAME"
	mkdir "%TARGET_PATH%\%EXTENSION_NAME%\"
	echo.
)

REM Remove remaining files from old builds, so delete everything
REM but do not remove DynProperties.qvpp
if exist "%TARGET_PATH%\%EXTENSION_NAME%\DynProperties.qvpp" (
	del /S /F /Q /A /EXCLUDE:DynProperties.qvpp "%TARGET_PATH%\%EXTENSION_NAME%\*.*" 
) else (
	del /S /F /Q /A "%TARGET_PATH%\%EXTENSION_NAME%\*.*" 
)

xcopy "%VS_TARGET_DIR%*.*" "%TARGET_PATH%\%EXTENSION_NAME%\" /Y /E /I

REM Delete .dll and .pdb
del /Q "%TARGET_PATH%\%EXTENSION_NAME%\%VS_TARGETFILENAME%"
del /Q "%TARGET_PATH%\%EXTENSION_NAME%\%VS_TARGETNAME%.pdb"