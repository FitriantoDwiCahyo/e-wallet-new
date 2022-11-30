import 'package:e_wallet_new/ui/screens/topup_amount_screen.dart';
import 'package:e_wallet_new/ui/widgets/bank_item.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TopupScreen extends StatelessWidget {
  static const routeName = '/topup';
  const TopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TopUp'),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Wallet',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/img_wallet.png',
                  width: 60,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '8000 2208 1953',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'rian dwi',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Wallet',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            BankItem(
              title: 'Bank BCA',
              imageUrl: 'assets/img_bank_bca.png',
              isSelected: true,
            ),
            BankItem(
              title: 'Bank BNI',
              imageUrl: 'assets/img_bank_bni.png',
            ),
            BankItem(
              title: 'Bank Mandiri',
              imageUrl: 'assets/img_bank_mandiri.png',
            ),
            BankItem(
              title: 'Bank OCBC',
              imageUrl: 'assets/img_bank_ocbc.png',
            ),
            const SizedBox(
              height: 12,
            ),
            CustomFilledButtons(
              title: 'Continue',
              onPressed: () {
                Navigator.of(context).pushNamed(TopupAmountScreen.routeName);
              },
            ),
          ]),
    );
  }
}
