import 'package:e_wallet_new/shared/shared_method.dart';
import 'package:e_wallet_new/ui/widgets/custom_input_pin_button.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class PinScreen extends StatefulWidget {
  static const routeName = '/pin-screen';
  const PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final TextEditingController pinController = TextEditingController(text: '');

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }

    if (pinController.text.length == 6) {
      if (pinController.text == '123456') {
        Navigator.of(context).pop(true);
      } else {
        showCustomSnackBar(context, 'Pin Salah Serius');
      }
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sha PIN',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 52,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: pinController,
                  obscureText: true,
                  obscuringCharacter: '*',
                  cursorColor: greyColor,
                  enabled: false,
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: medium,
                    letterSpacing: 16,
                  ),
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 66,
              ),
              Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  CustomInputPinButton(
                    title: '1',
                    onTap: () {
                      addPin('1');
                    },
                  ),
                  CustomInputPinButton(
                    title: '2',
                    onTap: () {
                      addPin('2');
                    },
                  ),
                  CustomInputPinButton(
                    title: '3',
                    onTap: () {
                      addPin('3');
                    },
                  ),
                  CustomInputPinButton(
                    title: '4',
                    onTap: () {
                      addPin('4');
                    },
                  ),
                  CustomInputPinButton(
                    title: '5',
                    onTap: () {
                      addPin('5');
                    },
                  ),
                  CustomInputPinButton(
                    title: '6',
                    onTap: () {
                      addPin('6');
                    },
                  ),
                  CustomInputPinButton(
                    title: '7',
                    onTap: () {
                      addPin('7');
                    },
                  ),
                  CustomInputPinButton(
                    title: '8',
                    onTap: () {
                      addPin('8');
                    },
                  ),
                  CustomInputPinButton(
                    title: '9',
                    onTap: () {
                      addPin('9');
                    },
                  ),
                  const SizedBox(
                    height: 60,
                    width: 60,
                  ),
                  CustomInputPinButton(
                    title: '0',
                    onTap: () {
                      addPin('0');
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      deletePin();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: numberBackgroundColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
