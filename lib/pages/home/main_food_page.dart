// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home/food_page.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import '../../utils/dimensions.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            //Status Header Section
            child: Container(
              margin: EdgeInsets.only(
                  top: scaleHeight(45), bottom: scaleHeight(15)),
              padding: EdgeInsets.symmetric(horizontal: scaleWidth(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BigText(text: 'Nigeria', color: AppColors.mainColor),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SmallText(
                            text: 'Calabar',
                            color: Colors.black54,
                          ),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: scaleWidth(45),
                      height: scaleHeight(45),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(scaleHeight(15)),
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: scaleHeight(24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: FoodPage(),
            ),
          ),
        ],
      ),
    );
  }
}
