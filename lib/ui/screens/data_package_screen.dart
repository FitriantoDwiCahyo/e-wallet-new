import 'package:e_wallet_new/ui/screens/data_success_screen.dart';
import 'package:e_wallet_new/ui/screens/pin_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:e_wallet_new/ui/widgets/custom_form_field.dart';
import 'package:e_wallet_new/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class DataPackageScreen extends StatelessWidget {
  static const routeName = '/data-package';
  const DataPackageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paket Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: '+62',
            isShowTitle: false,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: const [
              PackageItem(
                amount: 10,
                price: 100000,
                isSelected: true,
              ),
              PackageItem(
                amount: 25,
                price: 100000,
              ),
              PackageItem(
                amount: 40,
                price: 100000,
              ),
              PackageItem(
                amount: 100,
                price: 100000,
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          CustomFilledButtons(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.of(context).pushNamed(PinScreen.routeName) ==
                  true) {
                Navigator.of(context).pushNamed(DataSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}
