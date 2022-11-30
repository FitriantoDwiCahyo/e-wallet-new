import 'package:e_wallet_new/shared/shared_method.dart';
import 'package:e_wallet_new/ui/screens/data_package_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:e_wallet_new/ui/widgets/data_provider_item.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class DataProviderScreen extends StatelessWidget {
  static const routeName = '/data-provider';
  const DataProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
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
            'From Wallet',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Image.asset(
                'assets/img_wallet.png',
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '8008 2208 1996',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Balance: ${formatCurrency(1220000)}',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const DataProviderItem(
            imgUrl: 'assets/img_provider_telkomsel.png',
            title: 'Telkomsel',
            isAvailable: true,
            isSelected: true,
          ),
          const DataProviderItem(
            imgUrl: 'assets/img_provider_indosat.png',
            title: 'Indosat',
            isAvailable: true,
            isSelected: false,
          ),
          const DataProviderItem(
            imgUrl: 'assets/img_provider_singtel.png',
            title: 'Singtel',
            isAvailable: true,
            isSelected: false,
          ),
          const SizedBox(
            height: 125,
          ),
          CustomFilledButtons(
            title: 'Continue',
            onPressed: () =>
                Navigator.of(context).pushNamed(DataPackageScreen.routeName),
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
