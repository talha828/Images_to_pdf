**Warning**

 this project is now in Developement Mood

# image_to_pdf

## Getting Started

This is Flutter simple package where you can simple convert your images Into Single PDf.

Add following dependencies to you pubspec.yaml file 

```dart 
dependencies:
  flutter:
    sdk: flutter
  image_to_pdf_converter:
    git:
      url: https://github.com/talha828/Images_to_pdf
      path: packages/image_to_pdf_converter
```       

provide a image list to constructor

```dart
 await  ImageToPdf.imageList(data.fileList) 
 ```
 
 in output you get Document convert them in file and use it.


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
