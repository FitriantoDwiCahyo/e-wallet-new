import 'package:e_wallet_new/blocs/auth/auth_bloc.dart';
import 'package:e_wallet_new/models/sign_up_form_model.dart';
import 'package:e_wallet_new/shared/shared_method.dart';
import 'package:e_wallet_new/ui/screens/sign_in_screen.dart';
import 'package:e_wallet_new/ui/screens/sign_up_upload_profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:e_wallet_new/ui/widgets/custom_form_field.dart';
import 'package:e_wallet_new/ui/widgets/custom_text_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
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

        if (state is AuthCheckEmailSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpUploadProfileScreen(
                data: SignUpFormModel(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                ),
              ),
            ),
          );
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //NOTE: Name Input
                  CustomFormField(
                    title: 'Full Name',
                    controller: nameController,
                  ),
                  const SizedBox(height: 12),
                  //NOTE: Email Input
                  CustomFormField(
                    title: 'Email Address',
                    controller: emailController,
                  ),
                  const SizedBox(height: 12),
                  //NOTE: Password Input
                  CustomFormField(
                    title: 'Password',
                    controller: passwordController,
                    obscureText: true,
                  ),

                  const SizedBox(height: 16),
                  CustomFilledButtons(
                    title: 'Continue',
                    onPressed: () {
                      if (validate()) {
                        context
                            .read<AuthBloc>()
                            .add(AuthCheckEmail(emailController.text));
                      } else {
                        showCustomSnackBar(context, 'Semua field harus diisi');
                      }
                    },
                  ),
                ],
              ),
            ),
            CustomTextButton(
              title: 'Sign In',
              onPressed: () {
                Navigator.of(context).pushNamed(SignInScreen.routeName);
              },
            ),
          ],
        );
      }),
    );
  }
}
