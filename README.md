#  Hanakin

Flutter Application
This is a Flutter application designed to provide a high-performance, feature-rich mobile experience. The project integrates various libraries and plugins to achieve functionalities such as authentication, state management, notifications, media handling, and more.

## Getting Started

### Prerequisites
Before running the application, ensure you have the following installed:

- [Flutter SDK v3.19.4](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Online documentation](https://docs.flutter.dev/)
- A code editor such as [VS code](https://code.visualstudio.com/) or [Android studio](https://developer.android.com/studio)

### Installing Dependencies
Run the following command to install the necessary dependencies:

                                                           flutter pub get

### Running the Application
To run the application on a connected device or emulator, use:

                                                           flutter run

## Getting Started

The project utilizes a variety of powerful Flutter packages. Below is a list of some key dependencies:

- [ ] [cupertino_icons: ^1.0.2](https://pub.dev/packages/cupertino_icons)
        Provides icons for iOS styled apps using the Cupertino design system.

- [ ] [json_annotation: ^4.8.0](https://pub.dev/packages/json_annotation)
        Used for converting Dart objects to JSON and vice versa.

- [ ] [flutter_bloc: ^8.1.2](https://pub.dev/packages/flutter_bloc)
        Implements state management using the BLoC pattern.

- [ ] [go_router: ^6.5.5](https://pub.dev/packages/go_router)
        Used for declarative routing with support for deep linking.

- [ ] [firebase_auth](https://firebase.flutter.dev/docs/auth/start), [cloud_firestore](https://firebase.flutter.dev/docs/firestore/usage), [firebase_core](https://pub.dev/packages/firebase_core), [firebase_messaging](https://pub.dev/packages/firebase_messaging):
        Firebase integration for user authentication and Firestore database.

- [ ] [flutter_local_notifications: ^17.2.1+2](https://pub.dev/packages/flutter_local_notifications)
        Allows scheduling and displaying notifications locally.

- [ ] [permission_handler: ^10.2.0](https://pub.dev/packages/permission_handler)
        Manages runtime permissions for Android and iOS.

- [ ] [flutter_svg: ^2.0.4](https://pub.dev/packages/flutter_svg)
        Enables SVG file rendering in Flutter.

- [ ] [cached_network_image: ^3.3.1](https://pub.dev/packages/cached_network_image)
        Efficient image loading with caching and placeholder support.

For a full list of packages used in this project, check the pubspec.yaml file.

## Features

- [ ] User authentication using Firebase
- [ ] Cloud Firestore database integration
- [ ] State management with flutter_bloc
- [ ] Deep linking and routing with go_router
- [ ] Local and push notifications
- [ ] Media handling (images, videos, and audio)

## Building for Release

To build the app for production, run the following commands:

For Android:

                                                           flutter build apk --release

For iOS:

                                                           flutter build ios --release

