import 'package:e_wallet_new/models/user_edit_form_model.dart';
import 'package:e_wallet_new/shared/shared_method.dart';
import 'package:e_wallet_new/ui/screens/profile_edit_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../models/user_edit_pin_form_model.dart';
import '../../shared/theme.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_filled_button.dart';

class ProfileEditPinScreen extends StatefulWidget {
  static const routeName = '/profile-edit-pin';
  const ProfileEditPinScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditPinScreen> createState() => _ProfileEditPinScreenState();
}

class _ProfileEditPinScreenState extends State<ProfileEditPinScreen> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit Pin',
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
            return const Center(
              child: CircularProgressIndicator(),
            );
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
                      obsecureText: true,
                      title: 'Old Pin',
                      controller: oldPinController,
                    ),
                    const SizedBox(height: 12),
                    CustomFormField(
                      obsecureText: true,
                      title: 'New Pin',
                      controller: newPinController,
                    ),
                    const SizedBox(height: 12),

                    const SizedBox(height: 16),
                    CustomFilledButtons(
                      title: 'Update Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthUpdatePin(UserEditPinFormModel(
                                oldPin: oldPinController.text,
                                newPin: newPinController.text,
                              )),
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
