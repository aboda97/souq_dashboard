import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/components/custom_btn.dart';
import 'package:fruits_dashboard/core/components/custom_text_form_field.dart';
import 'package:fruits_dashboard/core/utils/app_colors.dart';
import 'package:fruits_dashboard/features/add_product_feature/presentation/widgets/build_agreement_check_box.dart';
import 'package:fruits_dashboard/features/add_product_feature/presentation/widgets/custom_choose_img.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  late String productName, productCode, productDescription;
  late num productPrice;
  File? fileImage;
  bool isAgreementChecked = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Product Name';
                }
                return null;
              },
              onSaved: (value) {
                productName = value!;
              },
              hintText: 'Product Name',
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Product Price';
                }
                return null;
              },
              onSaved: (value) {
                productPrice = num.parse(value!);
              },
              hintText: 'Product Price',
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Product Code';
                }
                return null;
              },
              onSaved: (value) {
                productCode = value!.toLowerCase();
              },
              hintText: 'Product Code',
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Product Description';
                }
                return null;
              },
              onSaved: (value) {
                productDescription = value!;
              },
              hintText: 'Product Description',
              maxLines: 6,
            ),
            SizedBox(height: 16),
            BuildAgreementCheckbox(
              onChanged: (value) {
                isAgreementChecked = !isAgreementChecked;
                setState(() {});
              },
              value: isAgreementChecked,
            ),
            SizedBox(height: 16),
            CustomChooseImg(
              onImagePicked: (value) {
                fileImage = value;
                setState(() {});
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              width: MediaQuery.of(context).size.width,
              child: CustomBtnApp(
                text: 'Add',
                onPressed: () {
                  if (fileImage != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      debugPrint(
                        'ProductName: $productName\nProductPrice: $productPrice\nProductCode: $productCode\nProductDescription: $productDescription\nProductImage: $fileImage\nIsAgreementChecked: $isAgreementChecked',
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showErrMsg(context);
                  }
                },
                textColor: AppColors.whiteColor,
                backgroundColor: AppColors.primaryColor,
                borderRadius: 16,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showErrMsg(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Please choose an image')));
  }
}
