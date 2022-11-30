import 'dart:convert';
import 'dart:io';

import 'package:e_wallet_new/models/sign_up_form_model.dart';
import 'package:e_wallet_new/shared/shared_method.dart';
import 'package:e_wallet_new/ui/screens/sign_up_set_ktp_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:e_wallet_new/ui/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/theme.dart';

class SignUpUploadProfileScreen extends StatefulWidget {
  static const routeName = 'sign-up-upload-profile';

  final SignUpFormModel data;

  const SignUpUploadProfileScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SignUpUploadProfileScreen> createState() =>
      _SignUpUploadProfileScreenState();
}

class _SignUpUploadProfileScreenState extends State<SignUpUploadProfileScreen> {
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;

  bool validate() {
    if (pinController.text.length != 6) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // print(data.toJson());
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 155,
            height: 50,
            margin: const EdgeInsets.only(
              top: 100,
              bottom: 40,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/img_logo_light.png',
                ),
              ),
            ),
          ),
          Text(
            'Join Us to Unlock\nYour Growth',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    final image = await selectImage();
                    setState(() {
                      selectedImage = image;
                     
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBackgroundColor,
                      image: selectedImage == null
                          ? null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(selectedImage!.path)),
                            ),
                    ),
                    child: selectedImage != null
                        ? null
                        : Center(
                            child:
                                Image.asset('assets/ic_upload.png', width: 32),
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Rian Dwi',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  title: 'Set PIN (6 digit number)',
                  obscureText: true,
                  controller: pinController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                CustomFilledButtons(
                  title: 'Continue',
                  onPressed: () {
                    if (validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpSetKtpScreen(
                            data: widget.data.copyWith(
                              pin: pinController.text,
                              profilePicture: selectedImage == null
                                  ? null
                                  : 'data:image/png;base64,' +
                                      base64Encode(
                                        File(selectedImage!.path)
                                            .readAsBytesSync(),
                                      ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      showCustomSnackBar(context, 'PIN harus 6 digit');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
