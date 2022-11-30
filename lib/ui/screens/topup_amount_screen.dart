import 'package:e_wallet_new/ui/screens/pin_screen.dart';
import 'package:e_wallet_new/ui/screens/topup_success_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:e_wallet_new/ui/widgets/custom_input_pin_button.dart';
import 'package:e_wallet_new/ui/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/theme.dart';

class TopupAmountScreen extends StatefulWidget {
  static const routeName = '/topup-amount';
  const TopupAmountScreen({Key? key}) : super(key: key);

  @override
  State<TopupAmountScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<TopupAmountScreen> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;
      

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: '')
            .format(
          int.parse(
           text == ''? '0': text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 60,
        ),
        children: <Widget>[
          const SizedBox(
            height: 36,
          ),
          Center(
            child: Text(
              'Total Amount',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          const SizedBox(
            height: 67,
          ),
          Align(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: amountController,
                cursorColor: greyColor,
                enabled: false,
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                ),
                decoration: InputDecoration(
                  prefixIcon: Text(
                    'Rp',
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                    ),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
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
                  addAmount('1');
                },
              ),
              CustomInputPinButton(
                title: '2',
                onTap: () {
                  addAmount('2');
                },
              ),
              CustomInputPinButton(
                title: '3',
                onTap: () {
                  addAmount('3');
                },
              ),
              CustomInputPinButton(
                title: '4',
                onTap: () {
                  addAmount('4');
                },
              ),
              CustomInputPinButton(
                title: '5',
                onTap: () {
                  addAmount('5');
                },
              ),
              CustomInputPinButton(
                title: '6',
                onTap: () {
                  addAmount('6');
                },
              ),
              CustomInputPinButton(
                title: '7',
                onTap: () {
                  addAmount('7');
                },
              ),
              CustomInputPinButton(
                title: '8',
                onTap: () {
                  addAmount('8');
                },
              ),
              CustomInputPinButton(
                title: '9',
                onTap: () {
                  addAmount('9');
                },
              ),
              const SizedBox(
                height: 60,
                width: 60,
              ),
              CustomInputPinButton(
                title: '0',
                onTap: () {
                  addAmount('0');
                },
              ),
              GestureDetector(
                onTap: () {
                  deleteAmount();
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
          const SizedBox(
            height: 50,
          ),
          CustomFilledButtons(
            title: 'Checkout Now',
            onPressed: () async {
              if (await Navigator.of(context).pushNamed(PinScreen.routeName) ==
                  true) {
                await launch('https://demo.midtrans.com/');
                await Navigator.of(context).pushNamedAndRemoveUntil(
                    TopupSuccessScreen.routeName, (route) => false);
              }
            },
          ),
          const SizedBox(
            height: 25,
          ),
          const CustomTextButton(
            title: 'Terms & Conditions,',
          ),
        ],
      ),
    );
  }
}
