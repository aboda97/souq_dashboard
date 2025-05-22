import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomChooseImg extends StatefulWidget {
  final ValueChanged<File?> onImagePicked;
  const CustomChooseImg({super.key, required this.onImagePicked});

  @override
  State<CustomChooseImg> createState() => _CustomChooseImgState();
}

class _CustomChooseImgState extends State<CustomChooseImg> {
  bool isLoading = false;
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Skeletonizer(
          enabled: isLoading,
          child: GestureDetector(
            onTap: () async {
              await pickImageFromGallery();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.outLineBorderTxtFormField,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child:
                  fileImage != null
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(fileImage!),
                      )
                      : Icon(Icons.image_outlined, size: 120),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              fileImage = null;
              widget.onImagePicked(fileImage!);
            });
          },
          icon: Visibility(
            child:
                fileImage != null
                    ? Icon(Icons.delete, color: Colors.red, size: 32)
                    : Container(),
          ),
        ),
      ],
    );
  }

  Future<void> pickImageFromGallery() async {
    isLoading = true;
    setState(() {});
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      fileImage = File(image!.path);
      widget.onImagePicked(fileImage!);
    } on Exception catch (e) {
      debugPrint(e.toString());
      isLoading = false;
      setState(() {});
    }
    isLoading = false;
    setState(() {});
  }
}
