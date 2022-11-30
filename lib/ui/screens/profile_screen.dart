import 'package:e_wallet_new/ui/screens/pin_screen.dart';
import 'package:e_wallet_new/ui/screens/profile_edit_pin_screen.dart';
import 'package:e_wallet_new/ui/screens/profile_edit_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_text_button.dart';
import 'package:e_wallet_new/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 22,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/img_profile.png',
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Marsudin',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ProfileMenuItem(
                    iconUrl: 'assets/ic_edit_profile.png',
                    title: 'Edit Profile',
                    onTap: () async {
                      if (await Navigator.of(context)
                              .pushNamed(PinScreen.routeName) ==
                          true) {
                        Navigator.of(context)
                            .pushNamed(ProfileEditScreen.routeName);
                      }
                    }),
                ProfileMenuItem(
                    iconUrl: 'assets/ic_pin.png',
                    title: 'My Pin',
                    onTap: () async {
                      if (await Navigator.of(context)
                              .pushNamed(PinScreen.routeName) ==
                          true) {
                        Navigator.of(context)
                            .pushNamed(ProfileEditPinScreen.routeName);
                      }
                    }),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_wallet.png',
                  title: 'Wallet Settings',
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_reward.png',
                  title: 'My Rewards',
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_help.png',
                  title: 'Help Center',
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_logout.png',
                  title: 'Log Out',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 57,
          ),
          CustomTextButton(title: 'Report Problem')
        ],
      ),
    );
  }
}
