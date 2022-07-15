import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:readmore/readmore.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Food image Area
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: scaleHeight(350),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/food2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //Back && Cart Icon
          Positioned(
            top: scaleHeight(45),
            left: scaleWidth(20),
            right: scaleWidth(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart),
              ],
            ),
          ),
          //Description Area
          Positioned(
            top: scaleHeight(300),
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: scaleWidth(20),
                left: scaleWidth(20),
                right: scaleWidth(20),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(scaleWidth(20)),
                  topRight: Radius.circular(scaleWidth(20)),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(text: 'Chinese Quisine'),
                  SizedBox(height: scaleHeight(20)),
                  BigText(
                    text: 'Introduce',
                    size: scaleHeight(18),
                  ),
                  SizedBox(height: scaleHeight(10)),
                  //Readmore detailed food area
                  Expanded(
                    child: SingleChildScrollView(
                      child: ReadMoreText(
                        'Flutter is Google mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. Let\'s try to understand the concept about all products and services uploaded here they are all good products. Take a deep dive into the logics required to store information in the database as information generated are pushed ahead to take columns and rows.',
                        trimLines: 3,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' Show more',
                        trimExpandedText: ' Show less',
                        style: TextStyle(
                            fontSize: scaleHeight(14),
                            height: 2.0,
                            color: AppColors.mainBlackColor),
                        moreStyle: TextStyle(
                            fontSize: scaleHeight(14),
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor),
                        lessStyle: TextStyle(
                            fontSize: scaleHeight(14),
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: scaleHeight(100),
        padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(15),
          vertical: scaleHeight(15),
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(scaleHeight(20)),
            topRight: Radius.circular(scaleHeight(20)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Remove and Add Button
            Container(
              padding: EdgeInsets.all(scaleHeight(15)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(scaleWidth(20))),
              child: Row(
                children: [
                  Icon(Icons.remove,
                      color: AppColors.signColor, size: scaleHeight(20)),
                  SizedBox(
                    width: scaleWidth(10),
                  ),
                  BigText(
                    text: '0',
                    size: scaleHeight(18),
                  ),
                  SizedBox(
                    width: scaleWidth(10),
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                    size: scaleHeight(20),
                  ),
                ],
              ),
            ),
            //Add to Cart Button
            Container(
              padding: EdgeInsets.all(scaleHeight(15)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(scaleWidth(20)),
                  color: AppColors.mainColor),
              child: BigText(
                text: "\$10 | Add to Cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
