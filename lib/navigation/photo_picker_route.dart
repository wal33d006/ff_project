import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

mixin PhotoPickerRoute {
  Future<Uint8List?> openPhotoPicker() async {
    try {
      if (await Permission.camera.isPermanentlyDenied) {
        openAppSettings();
      }
      if (await Permission.camera.request().isGranted) {
        final xFile = await ImagePicker().pickImage(
          source: ImageSource.camera,
          preferredCameraDevice: CameraDevice.front,
        );

        if (xFile != null) {
          final imageFile = File(xFile.path);
          return imageFile.readAsBytesSync();
        }
      }
      return null;
    } catch (ex) {
      return null;
    }
  }
}
