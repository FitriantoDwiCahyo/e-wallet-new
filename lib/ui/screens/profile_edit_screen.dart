import 'package:e_wallet_new/blocs/auth/auth_bloc.dart';
import 'package:e_wallet_new/ui/screens/profile_edit_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_edit_form_model.dart';
import '../../shared/shared_method.dart';
import '../../shared/theme.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_filled_button.dart';

class ProfileEditScreen extends StatefulWidget {
  static const routeName = '/profile-edit';
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final usernameController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();

    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      usernameController.text = authState.user.username!;
      nameController.text = authState.user.name!;
      emailController.text = authState.user.email!;
      passwordController.text = authState.user.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit Profile',
          ),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                ProfileEditSuccessScreen.routeName, (route) => false);
          }
        }, builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            children: [
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
                      title: 'Username',
                      controller: usernameController,
                    ),
                    const SizedBox(height: 12),
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
                      obsecureText: true,
                      controller: passwordController,
                    ),

                    const SizedBox(height: 16),
                    CustomFilledButtons(
                      title: 'Update Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthUpdateUser(
                                UserEditFormModel(
                                    username: usernameController.text,
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text),
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
