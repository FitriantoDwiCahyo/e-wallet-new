import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class DataProviderItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final bool isAvailable;
  final bool isSelected;

  const DataProviderItem({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.isAvailable,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(color: isSelected? blueColor: whiteColor,width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            imgUrl,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              Text(
                isAvailable ? 'Available' : 'Not Available',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
