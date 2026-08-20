@echo off
setlocal
where flutter >nul 2>nul
if errorlevel 1 (
  echo Flutter no esta instalado o no esta en PATH.
  echo Instala Flutter desde flutter.dev y vuelve a ejecutar este archivo.
  pause
  exit /b 1
)
flutter create --platforms=android .
flutter pub get
flutter analyze
if errorlevel 1 (
  echo Hay errores que deben corregirse antes de compilar.
  pause
  exit /b 1
)
flutter build apk --release
if errorlevel 1 (
  echo La compilacion fallo.
  pause
  exit /b 1
)
echo.
echo APK generado en:
echo build\app\outputs\flutter-apk\app-release.apk
pause
