# Generar el APK Android

Este proyecto contiene el código fuente Flutter editable de la aplicación médica.

## Opción A — Windows / Android Studio
1. Instala Flutter SDK y Android Studio.
2. Abre esta carpeta `app_medica`.
3. Ejecuta `build_apk_windows.bat`.
4. Al finalizar, el APK queda en:
   `build/app/outputs/flutter-apk/app-release.apk`
5. Copia `app-release.apk` a la tablet Android y ábrelo para instalar.

## Opción B — Terminal
```bash
flutter create --platforms=android .
flutter pub get
flutter analyze
flutter build apk --release
```

## Opción C — GitHub Actions
El archivo `.github/workflows/build-android.yml` compila automáticamente un APK release.
Sube el proyecto a GitHub y ejecuta el workflow **Build Android APK**. El resultado aparece como artefacto `app-medica-release`.

## Nota
El APK generado en esta fase es para pruebas/distribución directa. Para publicar en Google Play se debe generar un AAB firmado con una clave de publicación propia.
