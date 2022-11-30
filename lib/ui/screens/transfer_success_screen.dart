// import 'package:e_wallet_new/ui/screens/home_screen.dart';
import 'package:e_wallet_new/ui/screens/home_screen.dart';
// import 'package:e_wallet_new/ui/screens/profile_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TransferSuccessScreen extends StatelessWidget {
  static const routeName = '/transfer-success';
  const TransferSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Berhasil Transfer',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Use the money wisely and\ngrow your finance',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            CustomFilledButtons(
              title: 'Back to Home',
              width: 183,
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    HomeScreen.routeName, (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
