import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TransferRecentUsersItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String username;
  final bool isVerified;

  const TransferRecentUsersItem({
    Key? key,
    required this.name,
    required this.username,
    required this.imageUrl,
    this.isVerified = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        color: whiteColor,
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 45,
            width: 45,
            margin: const EdgeInsets.only(
              right: 14,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '@$username',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          if(isVerified)Row(
            children: <Widget>[
              Icon(
                Icons.check_circle,
                size: 14,
                color: greenColor,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Verified',
                style: greenTextStyle.copyWith(
                  fontSize: 11,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
