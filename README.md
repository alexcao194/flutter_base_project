# Base Project

## Environments
- [Flutter SDK](https://flutter.dev)
- [Xcode 14](https://developer.apple.com/xcode)
- [Cocoapods 1.10.1](https://cocoapods.org)
- [JDK > 11](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
- [Android Studio and Android SDK](https://developer.android.com/studio)
- [Fastlane](https://docs.fastlane.tools/)

## Folder structure
- `assets`: The folder to store resources file such as fonts, images and lottie animations
  - `images`: store images
  - `rive`: store lottie animations
  - `sounds`: store sounds
- `lib`: The folder is main container of all code inside Zeniuz application
    - `app`
      - `data`: 
        - `data_sources`: Data sources such as API, Database, realtime, etc.
        - `models`: Data models convert from raw data to entity
        - `repositories`: Repositories to interact with data sources
      - `domain`:
        - `entities`: Entities use in application
        - `usecases`: User behaviors, extends from `BaseUseCase` classes
        - `repositories`: Interface of repositories
      - `presentation`:
        - `screens`: 
            - `join`:
                - `bloc`: Join screen bloc
                - `widgets`: Widgets of Join screen
                - `join_screen.dart`: Join screen
    - `configs`: Configuration of Router, Supabase, etc.
    - `constants`: Constants of application
    - `core`: Base classes, extensions, etc.
    - `utils`: Helper functions
    - `main.dart`: Entry point of application
    - `app.dart`: Wrapper of application

## Code style
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart/style)
- import from dart package first, then flutter package, then project package, then current package
- importing from the same package should be in one line and use relative path 
  - ex: `import '../../models/user_model.dart'`

## Usage

### Plugins required
- FlutterAssetsGenerator
- Flutter Intl

### Install dependencies
- Move to root dir `cd {root}`
- Install necessary packages `flutter pub get`

### generate files
- generate necessary files: `flutter pub run build_runner build --delete-conflicting-outputs`
- right click on `assets` folder and click `Flutter: Configuring Paths` to add assets path into `pubspec.yaml`
- click `Build` -> `Generate Flutter Assets` to generate assets path

### generate localization
- run `flutter --no-color pub global run intl_utils:generate` to generate localization files

### generate splash screen (optional)
- configure splash screen in `flutter_native_splash.yaml`, then run:
- `flutter pub run flutter_native_splash:create`

### generate launcher icon (optional)
- configure launcher icon in `flutter_launcher_icons.yaml`, then run:
- `flutter pub run flutter_launcher_icons`

### change app name (optional)
- run `flutter pub run rename_app:main all="My App Name"`

### Start the app
- `flutter run lib/main.dart`

### Sign with your own keystore
- Create a keystore file `keystore.jks`, it should be placed in `android/app` folder
- Create a file `key.properties` in `android` folder with the following content:
```
storePassword=<password>
keyPassword=<password>
keyAlias=<alias>
storeFile=<relative path to keystore file> (from android/app)
```
- Run `flutter build <build  type> --release` to build the apk file
