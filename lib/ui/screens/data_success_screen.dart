// import 'package:e_wallet/ui/screens/home_screen.dart';
import 'package:e_wallet_new/ui/screens/home_screen.dart';
// import 'package:e_wallet/ui/screens/profile_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class DataSuccessScreen extends StatelessWidget {
  static const routeName = '/data-success';
  const DataSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Paket Data\nBerhasil Terbeli',
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
