# Islami

Islami is a Flutter application that brings Quran reading, Ahadith, and daily Tasbeeh together in one simple, offline-friendly experience.

## Features

- **Quran**: Browse Surahs, search by name, and read verses.
- **Recently read**: Quickly return to a recently opened Surah.
- **Ahadith**: Browse 50 locally bundled Ahadith in an interactive carousel.
- **Sebha**: Tap the digital Sebha to rotate it and count Tasbeeh up to 30.
- **Onboarding**: First-run introduction flow with native splash-screen support.
- **Offline content**: Quran and Ahadith data are bundled with the app.

## Future Features

- **Radio**: The Radio tab is included in the navigation and will be implemented in a future version.
- **Time**: The Time tab is included in the navigation and will be implemented in a future version.

## Tech Stack

- Flutter and Dart
- Material UI
- `carousel_slider`
- `smooth_page_indicator`
- `lottie`
- `shared_preferences`
- `flutter_native_splash`

## Getting Started

From the project folder, run:

```bash
flutter pub get
flutter run
```
## Project Structure

```text
lib/
├── core/             # Models and theme
├── screens/          # Onboarding, home, and reading screens
└── main.dart

assets/
├── animations/
├── fonts/
├── hadeeth/          # 50 local Ahadith text files
├── images/
└── suras/            # Quran Surah text files
```

## Demo Video

https://github.com/user-attachments/assets/aa2045f6-a949-44ed-ac6c-faf9a49d07d9

## License

No license has been selected for this project yet. Add a license before publishing it for reuse.
