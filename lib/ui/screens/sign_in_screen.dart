import 'package:e_wallet_new/models/sign_in_form_model.dart';
import 'package:e_wallet_new/shared/shared_method.dart';
import 'package:e_wallet_new/shared/theme.dart';
import 'package:e_wallet_new/ui/screens/home_screen.dart';
import 'package:e_wallet_new/ui/screens/sign_up_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:e_wallet_new/ui/widgets/custom_form_field.dart';
import 'package:e_wallet_new/ui/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign-in';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
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
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              width: 155,
              height: 50,
              margin: const EdgeInsets.only(
                top: 100,
                bottom: 60,
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
              'Sign In &\nGrow Your Finance',
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
                  //NOTE: Email Input
                  CustomFormField(
                    title: 'Email Address',
                    controller: emailController,
                  ),
                  const SizedBox(height: 12),
                  //NOTE: Password Input
                  CustomFormField(
                    title: 'Password',
                    obscureText: true,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password',
                      style: blueTextStyle,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomFilledButtons(
                    title: 'Sign In',
                    onPressed: () {
                      if (validate()) {
                        context.read<AuthBloc>().add(
                              AuthLogin(
                                SignInFormModel(
                                    email: emailController.text,
                                    password: passwordController.text),
                              ),
                            );
                      } else {
                        showCustomSnackBar(context, 'Semua field harus diisi');
                      }
                    },
                  ),
                ],
              ),
            ),
            CustomTextButton(
              title: 'Create New Account',
              onPressed: () {
                Navigator.of(context).pushNamed(SignUpScreen.routeName);
              },
            ),
          ],
        );
      }),
    );
  }
}
