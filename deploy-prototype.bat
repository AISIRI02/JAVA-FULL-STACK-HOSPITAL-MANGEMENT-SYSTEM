@echo off
echo ========================================
echo Hospital Management System - Prototype
echo ========================================
echo Deploying prototype version with mock data...
echo.

REM Create webapp directory in Tomcat
set WEBAPP_DIR=C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\Hospital_Management-System-HSM
if not exist "%WEBAPP_DIR%" mkdir "%WEBAPP_DIR%"

REM Copy webapp files
echo Copying webapp files...
xcopy "src\main\webapp\*" "%WEBAPP_DIR%\" /E /Y /I

REM Create WEB-INF classes directory
if not exist "%WEBAPP_DIR%\WEB-INF\classes" mkdir "%WEBAPP_DIR%\WEB-INF\classes"

REM Copy compiled classes (if target/classes exists)
if exist "target\classes" (
    echo Copying compiled classes...
    xcopy "target\classes\*" "%WEBAPP_DIR%\WEB-INF\classes\" /E /Y /I
)

echo.
echo ========================================
echo Deployment completed!
echo ========================================
echo.
echo To start the application:
echo 1. Start Tomcat server
echo 2. Open browser and go to: http://localhost:8080/Hospital_Management-System-HSM
echo.
echo Default Login Credentials:
echo.
echo Admin:
echo   Email: admin@gmail.com
echo   Password: admin
echo.
echo Sample Doctor:
echo   Email: john@hospital.com
echo   Password: password123
echo.
echo Sample Patient:
echo   Email: john.doe@email.com
echo   Password: password123
echo.
echo ========================================
pause
