import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  Uint8List? _image;
  File? selectedImage;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    loadProfileImage();
  }

  Future<void> loadProfileImage() async {
    _prefs = await SharedPreferences.getInstance();
    final imageData = _prefs.getString('profile_image');
    if (imageData != null) {
      setState(() {
        _image = Uint8List.fromList(imageData.codeUnits);
      });
    }
  }

  void saveProfileImage(Uint8List image) async {
    final imageData = String.fromCharCodes(image);
    await _prefs.setString('profile_image', imageData);
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.blue[100],
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 70,
                          ),
                          Text("Gallery")
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70,
                          ),
                          Text("Camera")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Gallery
  Future _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    setState(() {
      selectedImage = File(pickedImage.path);
      _image = File(pickedImage.path).readAsBytesSync();
      saveProfileImage(_image!);
    });
    Navigator.of(context).pop(); // close the modal sheet
  }

  // Camera
  Future _pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage == null) return;
    setState(() {
      selectedImage = File(pickedImage.path);
      _image = File(pickedImage.path).readAsBytesSync();
      saveProfileImage(_image!);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 60, 112, 218),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: _image != null
                    ? MemoryImage(_image!)
                    : NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png") as ImageProvider<Object>?,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    showImagePickerOption(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              showImagePickerOption(context);
            },
            child: Text(
              'kayiranga420@gmail.com',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
