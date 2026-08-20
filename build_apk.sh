#!/usr/bin/env bash
set -e
command -v flutter >/dev/null 2>&1 || { echo "Flutter no está instalado o no está en PATH."; exit 1; }
flutter create --platforms=android .
flutter pub get
flutter analyze
flutter build apk --release
echo "APK: build/app/outputs/flutter-apk/app-release.apk"
