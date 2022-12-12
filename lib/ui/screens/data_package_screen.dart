import 'package:e_wallet_new/blocs/data_plan/data_plan_bloc.dart';
import 'package:e_wallet_new/models/data_plan_form_model.dart';
import 'package:e_wallet_new/ui/screens/data_success_screen.dart';
import 'package:e_wallet_new/ui/screens/pin_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:e_wallet_new/ui/widgets/custom_form_field.dart';
import 'package:e_wallet_new/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../models/data_plan_model.dart';
import '../../models/operator_card_model.dart';
import '../../shared/shared_method.dart';
import '../../shared/theme.dart';

class DataPackageScreen extends StatefulWidget {
  static const routeName = '/data-package';

  final OperatorCardModel operatorCard;

  const DataPackageScreen({
    Key? key,
    required this.operatorCard,
  }) : super(key: key);

  @override
  State<DataPackageScreen> createState() => _DataPackageScreenState();
}

class _DataPackageScreenState extends State<DataPackageScreen> {
  final phoneController = TextEditingController(text: '');
  DataPlanModel? selecetedDataPlan;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataPlanBloc(),
      child: BlocConsumer<DataPlanBloc, DataPlanState>(
        listener: (context, state) {
          if (state is DataPlanFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is DataPlanSuccess) {
            context.read<AuthBloc>().add(
                  AuthUpdateBalance(selecetedDataPlan!.price! * -1),
                );

            Navigator.of(context).pushNamedAndRemoveUntil(
                DataSuccessScreen.routeName, (route) => false);
          }
        },
        builder: (context, state) {
          if (state is DataPlanLoading) {
            return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Paket Data'),
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
                CustomFormField(
                  title: '+62',
                  isShowTitle: false,
                  controller: phoneController,
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
                  children: widget.operatorCard.dataPlans!.map(
                    (dataPlan) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              selecetedDataPlan = dataPlan;
                            });
                          },
                          child: PackageItem(
                            dataPlan: dataPlan,
                            isSelected: dataPlan.id == selecetedDataPlan?.id,
                          ));
                    },
                  ).toList(),
                ),
              ],
            ),
            floatingActionButton:
                (selecetedDataPlan != null && phoneController.text.isNotEmpty)
                    ? Container(
                        margin: const EdgeInsets.all(24),
                        child: CustomFilledButtons(
                          title: 'Continue',
                          onPressed: () async {
                            if (await Navigator.of(context)
                                    .pushNamed(PinScreen.routeName) ==
                                true) {
                              final authState = context.read<AuthBloc>().state;
                              String pin = '';
                              if (authState is AuthSuccess) {
                                pin = authState.user.pin!;
                              }

                              context.read<DataPlanBloc>().add(
                                    DataPlanPost(
                                      DataPlanFormModel(
                                        dataPlanId: selecetedDataPlan!.id,
                                        phoneNumber: phoneController.text,
                                        pin: pin,
                                      ),
                                    ),
                                  );
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(builder: (context) => ));
                            }
                          },
                        ),
                      )
                    : Container(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
