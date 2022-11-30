import 'dart:convert';
import 'dart:io';

import 'package:e_wallet_new/blocs/auth/auth_bloc.dart';
import 'package:e_wallet_new/ui/screens/home_screen.dart';
import 'package:e_wallet_new/ui/screens/sign_up_success_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:e_wallet_new/ui/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/sign_up_form_model.dart';
import '../../shared/shared_method.dart';
import '../../shared/theme.dart';

class SignUpSetKtpScreen extends StatefulWidget {
  static const routeName = '/sign-up-set-ktp';

  final SignUpFormModel data;

  const SignUpSetKtpScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SignUpSetKtpScreen> createState() => _SignUpSetKtpScreenState();
}

class _SignUpSetKtpScreenState extends State<SignUpSetKtpScreen> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        if (state is AuthFailed) {
          showCustomSnackBar(context, state.e);
        }

        if (state is AuthSuccess) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
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
              'Verify Your\nAccount',
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
                              child: Image.asset('assets/ic_upload.png',
                                  width: 32),
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Passport/ID Card',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // CustomFormField(title: 'Set PIN (6 digit number)'),
                  const SizedBox(height: 20),
                  CustomFilledButtons(
                    title: 'Continue',
                    onPressed: () {
                      if (validate()) {
                        context.read<AuthBloc>().add(
                              AuthRegister(
                                widget.data.copyWith(
                                  ktp: selectedImage == null
                                      ? null
                                      : 'data:image/png;base64,'+
                                          base64Encode(
                                            File(selectedImage!.path)
                                                .readAsBytesSync(),
                                          ),
                                ),
                              ),
                            );
                      } else {
                        showCustomSnackBar(
                            context, 'Gambar tidak boleh kosong');
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            CustomTextButton(
              title: 'Skip for Now',
              onPressed: () {
                context.read<AuthBloc>().add(
                      AuthRegister(widget.data),
                    );
              },
            ),
          ],
        );
      }),
    );
  }
}
