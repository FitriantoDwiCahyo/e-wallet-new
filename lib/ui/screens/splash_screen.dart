import 'dart:async';

import 'package:e_wallet_new/ui/screens/home_screen.dart';
import 'package:e_wallet_new/ui/screens/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../shared/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                HomeScreen.routeName, (route) => false);
          }

          if(state is AuthFailed) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                OnboardingScreen.routeName, (route) => false);
            
          }
        },
        child: Center(
          child: Container(
            height: 50,
            width: 155,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/img_logo_dark.png',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
