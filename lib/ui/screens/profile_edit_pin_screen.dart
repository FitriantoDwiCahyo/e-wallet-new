import 'package:e_wallet_new/ui/screens/profile_edit_success_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_filled_button.dart';

class ProfileEditPinScreen extends StatelessWidget {
  static const routeName = '/profile-edit-pin';
  const ProfileEditPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit Pin',
          ),
        ),
        body: ListView(
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
                  const CustomFormField(title: 'Old Pin'),
                  const SizedBox(height: 12),
                  const CustomFormField(title: 'New Pin'),
                  const SizedBox(height: 12),

                  const SizedBox(height: 16),
                  CustomFilledButtons(
                    title: 'Update Now',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(ProfileEditSuccessScreen.routeName,(route) => false);
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
