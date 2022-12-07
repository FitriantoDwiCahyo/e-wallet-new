import 'package:e_wallet_new/shared/shared_method.dart';
import 'package:flutter/material.dart';

import '../../models/data_plan_model.dart';
import '../../shared/theme.dart';

class PackageItem extends StatelessWidget {
  final DataPlanModel dataPlan;
  final bool isSelected;

  const PackageItem({
    Key? key,
    required this.dataPlan,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 174,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(
          20,
        ),
        border:
            Border.all(color: isSelected ? blueColor : whiteColor, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            dataPlan.name.toString(),
            style: blackTextStyle.copyWith(
              fontSize: 30,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            formatCurrency(dataPlan.price ?? 0 ),
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
