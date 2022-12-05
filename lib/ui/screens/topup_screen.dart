import 'package:e_wallet_new/blocs/payment_method/payment_method_bloc.dart';
import 'package:e_wallet_new/models/topup_form_model.dart';
import 'package:e_wallet_new/ui/screens/topup_amount_screen.dart';
import 'package:e_wallet_new/ui/widgets/bank_item.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';

import '../../models/payment_method_model.dart';
import '../../shared/theme.dart';

class TopupScreen extends StatefulWidget {
  static const routeName = '/topup';
  const TopupScreen({Key? key}) : super(key: key);

  @override
  State<TopupScreen> createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen> {
  PaymentMethodModel? selectedPaymentMethod;
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
            BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              if (state is AuthSuccess) {
                return Row(
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
                          state.user.cardNumber!.replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} "),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          state.user.name.toString(),
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }
              return Container();
            }),
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
            BlocProvider(
              create: (context) => PaymentMethodBloc()..add(PaymentMethodGet()),
              child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
                builder: (context, state) {
                  if (state is PaymentMethodSuccess) {
                    return Column(
                      children: state.paymentMethods.map((paymentMethod) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPaymentMethod = paymentMethod;
                            });
                          },
                          child: BankItem(
                            paymentMethod: paymentMethod,
                            isSelected:
                                paymentMethod.id == selectedPaymentMethod?.id,
                          ),
                        );
                      }).toList(),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ]),
      floatingActionButton: (selectedPaymentMethod != null)
          ? Container(
            margin: const EdgeInsets.all(24),
            child: CustomFilledButtons(
                title: 'Continue',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TopupAmountScreen(
                        data: TopupFormModel(
                            paymentMethodCode: selectedPaymentMethod?.code),
                      ),
                    ),
                  );
                },
              ),
          )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
