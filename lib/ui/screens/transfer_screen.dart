import 'package:e_wallet_new/ui/screens/transfer_amount_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:e_wallet_new/ui/widgets/custom_form_field.dart';
import 'package:e_wallet_new/ui/widgets/transfer_recent_users_item.dart';
import 'package:e_wallet_new/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TransferScreen extends StatelessWidget {
  static const routeName = '/transfer';
  const TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
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
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: 'By username',
            isShowTitle: false,
          ),
          buildResultUsers(),
          const SizedBox(
            height: 274,
          ),
          CustomFilledButtons(
            title: 'Continue',
            onPressed: () {
              Navigator.of(context).pushNamed(TransferAmountScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const TransferRecentUsersItem(
            name: 'Ucup',
            username: 'ucup',
            imageUrl: 'assets/img_friend1.png',
            isVerified: true,
          ),
          const TransferRecentUsersItem(
            name: 'Mahmud',
            username: 'mahmud',
            imageUrl: 'assets/img_friend2.png',
            isVerified: false,
          ),
          const TransferRecentUsersItem(
            name: 'Juki',
            username: 'juki',
            imageUrl: 'assets/img_friend3.png',
            isVerified: false,
          ),
        ],
      ),
    );
  }

  Widget buildResultUsers() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 27,
            runSpacing: 17,
            children: const [
              TransferResultUserItem(
                name: 'Ucup',
                username: 'ucup',
                imageUrl: 'assets/img_friend1.png',
                isVerified: true,
                isSelected: true,
              ),
              TransferResultUserItem(
                name: 'Mahmud',
                username: 'mahmud',
                imageUrl: 'assets/img_friend2.png',
                isVerified: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
