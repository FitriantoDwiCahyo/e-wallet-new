import 'package:e_wallet_new/blocs/auth/auth_bloc.dart';
import 'package:e_wallet_new/models/operator_card_model.dart';
import 'package:e_wallet_new/shared/shared_method.dart';
import 'package:e_wallet_new/ui/screens/data_package_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:e_wallet_new/ui/widgets/data_provider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/operator_card/operator_card_bloc.dart';
import '../../shared/theme.dart';

class DataProviderScreen extends StatefulWidget {
  static const routeName = '/data-provider';
  const DataProviderScreen({Key? key}) : super(key: key);

  @override
  State<DataProviderScreen> createState() => _DataProviderScreenState();
}

class _DataProviderScreenState extends State<DataProviderScreen> {
  OperatorCardModel? selectedOperatorCard;

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
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        state.user.cardNumber!.replaceAllMapped(
                            RegExp(r".{4}"), (match) => "${match.group(0)}"),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Balance: ${formatCurrency(state.user.balance ?? 0)}',
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              }),
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
          BlocProvider(
            create: (context) => OperatorCardBloc()..add(OperatorCardGet()),
            child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
              builder: (context, state) {
                if (state is OperatorCardSuccess) {
                  return Column(
                    children: state.operatorCards.map(
                      (operatorCard) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOperatorCard = operatorCard;
                            });
                          },
                          child: DataProviderItem(
                            operatorCard: operatorCard,
                            isSelected:
                                operatorCard.id == selectedOperatorCard?.id,
                          ),
                        );
                      },
                    ).toList(),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
      floatingActionButton: (selectedOperatorCard != null)
          ? Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButtons(
                title: 'Continue',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DataPackageScreen(
                      operatorCard: selectedOperatorCard!,
                    ),
                  ),
                ),
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
