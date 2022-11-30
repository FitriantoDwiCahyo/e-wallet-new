import 'package:e_wallet_new/ui/screens/home_screen.dart';
import 'package:e_wallet_new/ui/screens/profile_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ProfileEditSuccessScreen extends StatelessWidget {
  static const routeName = '/profile-edit-success';
  const ProfileEditSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nice Update',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Your data is safe with\nour system',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            CustomFilledButtons(
              title: 'My Profile',
              width: 183,
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    ProfileScreen.routeName, (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
