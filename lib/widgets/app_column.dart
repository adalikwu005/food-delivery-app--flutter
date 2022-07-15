import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final double size;
  const AppColumn({Key? key, required this.text, this.size = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Food Name Label
        BigText(
          text: text,
          size: size,
        ),
        SizedBox(height: scaleHeight(10)),

        //Rating && Comment Section
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: scaleHeight(15),
                ),
              ),
            ),
            SizedBox(width: scaleHeight(10)),
            SmallText(text: '4.5'),
            SizedBox(width: scaleHeight(10)),
            SmallText(text: '1287'),
            SizedBox(width: scaleHeight(10)),
            SmallText(text: 'comments'),
          ],
        ),
        //SizedBox(height: Dimensions.height10),
        SizedBox(height: scaleHeight(20)),

        //Time && Distance
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
              icon: Icons.circle_sharp,
              text: 'Normal',
              color: AppColors.mainBlackColor,
              iconColor: AppColors.iconColor1,
              iconSize: scaleHeight(20),
            ),
            IconAndText(
              icon: Icons.location_on,
              text: '1.7km',
              color: AppColors.mainBlackColor,
              iconColor: AppColors.mainColor,
              iconSize: scaleHeight(20),
            ),
            IconAndText(
              icon: Icons.access_time_rounded,
              text: '32min',
              color: AppColors.mainBlackColor,
              iconColor: AppColors.iconColor1,
              iconSize: scaleHeight(20),
            ),
          ],
        ),
      ],
    );
  }
}
