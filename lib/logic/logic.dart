import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/constant.dart';



class Logic extends GetxController {

  // ignore: unnecessary_cast
  final Rx<File?> pdf = (null as File?).obs;
  RxList<File?> fileList=<File?>[].obs;
  RxList<Widget?> widgetList=<Widget?>[].obs;
  Rx<ImageSource> source=ImageSource.camera.obs;


}