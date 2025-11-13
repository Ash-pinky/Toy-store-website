@echo off
cd "%~dp0\app"
start "" http://localhost:8000
php -S localhost:8000
pause
