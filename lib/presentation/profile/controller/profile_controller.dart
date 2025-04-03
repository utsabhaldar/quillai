import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);
  Rx<File?> selectedImage = Rx<File?>(null);

  void setImage(File? image) {
    selectedImage.value = image;
  }

  Future<void> saveImageBytes() async {
    if (imageBytes.value != null) {
      try {
        final prefs = await SharedPreferences.getInstance();
        final encodedImage = base64Encode(imageBytes.value!);
        await prefs.setString('imageBytes', encodedImage);
      } catch (e) {
        print('Error saving image bytes: $e');
        Get.snackbar(
          'Failed',
          'Error saving image bytes: $e',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      print('Image bytes are null');
      Get.snackbar(
        'Failed',
        'Image bytes are null',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> loadSavedImageBytes() async {
    final prefs = await SharedPreferences.getInstance();
    final savedBytes = prefs.getString('imageBytes');

    if (savedBytes != null) {
      imageBytes.value = base64Decode(savedBytes);
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadSavedImageBytes();
  }

  Future<void> pickImageFromGallery() async {
    final permissionStatus = Platform.isIOS
        ? await Permission.photos.request()
        : await Permission.storage.request();

    if (!permissionStatus.isGranted) {
      showPermissionDeniedSnackbar("photos");
      return;
    }

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
      imageBytes.value = File(pickedFile.path).readAsBytesSync();

      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('imageBytes', base64Encode(imageBytes.value!));
    }
  }

  Future<void> pickImageFromCamera() async {
    final permissionStatus = await Permission.camera.request();

    if (!permissionStatus.isGranted) {
      showPermissionDeniedSnackbar("camera");
      return;
    }

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
      imageBytes.value = File(pickedFile.path).readAsBytesSync();

      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('imageBytes', base64Encode(imageBytes.value!));
    }
  }

  void showPermissionDeniedSnackbar(String feature) {
    Get.snackbar(
      'Permission Denied',
      'Please allow access to $feature in your device settings.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
