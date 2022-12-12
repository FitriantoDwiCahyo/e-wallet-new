import 'package:e_wallet_new/shared/theme.dart';
import 'package:e_wallet_new/ui/screens/data_package_screen.dart';
import 'package:e_wallet_new/ui/screens/data_provider_screen.dart';
import 'package:e_wallet_new/ui/screens/data_success_screen.dart';
import 'package:e_wallet_new/ui/screens/home_screen.dart';
import 'package:e_wallet_new/ui/screens/onboardingscreen.dart';
import 'package:e_wallet_new/ui/screens/pin_screen.dart';
import 'package:e_wallet_new/ui/screens/profile_edit_pin_screen.dart';
import 'package:e_wallet_new/ui/screens/profile_edit_screen.dart';
import 'package:e_wallet_new/ui/screens/profile_edit_success_screen.dart';
import 'package:e_wallet_new/ui/screens/profile_screen.dart';
import 'package:e_wallet_new/ui/screens/sign_in_screen.dart';
import 'package:e_wallet_new/ui/screens/sign_up_screen.dart';
// import 'package:e_wallet_new/ui/screens/sign_up_set_ktp_screen.dart';
import 'package:e_wallet_new/ui/screens/sign_up_success_screen.dart';
// import 'package:e_wallet_new/ui/screens/sign_up_upload_profile_screen.dart';
import 'package:e_wallet_new/ui/screens/splash_screen.dart';
import 'package:e_wallet_new/ui/screens/topup_amount_screen.dart';
import 'package:e_wallet_new/ui/screens/topup_screen.dart';
import 'package:e_wallet_new/ui/screens/topup_success_screen.dart';
import 'package:e_wallet_new/ui/screens/transfer_amount_screen.dart';
import 'package:e_wallet_new/ui/screens/transfer_screen.dart';
import 'package:e_wallet_new/ui/screens/transfer_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth/auth_bloc.dart';
import 'blocs/user/user_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()
            ..add(
              AuthGetCurrentUser(),
            ),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            iconTheme: IconThemeData(color: blackColor),
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
        home: const SplashScreen(),
        routes: {
          OnboardingScreen.routeName: (ctx) => const OnboardingScreen(),
          SignInScreen.routeName: (ctx) => const SignInScreen(),
          SignUpScreen.routeName: (ctx) => const SignUpScreen(),
          // SignUpSetKtpScreen.routeName: (ctx) => const SignUpSetKtpScreen(),
          SignUpSuccessScreen.routeName: (ctx) => const SignUpSuccessScreen(),
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          ProfileScreen.routeName: (ctx) => const ProfileScreen(),
          PinScreen.routeName: (ctx) => const PinScreen(),
          ProfileEditScreen.routeName: (ctx) => const ProfileEditScreen(),
          ProfileEditPinScreen.routeName: (ctx) => const ProfileEditPinScreen(),
          ProfileEditSuccessScreen.routeName: (ctx) =>
              const ProfileEditSuccessScreen(),
          TopupScreen.routeName: (ctx) => const TopupScreen(),
          // TopupAmountScreen.routeName: (ctx) => const TopupAmountScreen(),
          TopupSuccessScreen.routeName: (ctx) => const TopupSuccessScreen(),
          TransferScreen.routeName: (ctx) => const TransferScreen(),
          // Transfe rAmountScreen.routeName: (ctx) => const TransferAmountScreen(),
          TransferSuccessScreen.routeName: (ctx) =>
              const TransferSuccessScreen(),
          DataProviderScreen.routeName: (ctx) => const DataProviderScreen(),
          // DataPacka    geScreen.routeName: (ctx) => const DataPackageScreen(),
          DataSuccessScreen.routeName: (ctx) => const DataSuccessScreen(),
        },
      ),
    );
  }
}
