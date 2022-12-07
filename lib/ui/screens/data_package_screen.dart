import 'package:e_wallet_new/ui/screens/data_success_screen.dart';
import 'package:e_wallet_new/ui/screens/pin_screen.dart';
import 'package:e_wallet_new/ui/widgets/custom_filled_button.dart';
import 'package:e_wallet_new/ui/widgets/custom_form_field.dart';
import 'package:e_wallet_new/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';

import '../../models/data_plan_model.dart';
import '../../models/operator_card_model.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Paket Data'),
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
                    onPressed: ()  {
                      // if (await Navigator.of(context)
                      //         .pushNamed(PinScreen.routeName) ==
                      //     true) {
                      //   Navigator.of(context)
                      //       .push(MaterialPageRoute(builder: (context) => ));
                      // }
                    },
                  ),
                )
              : Container(),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
