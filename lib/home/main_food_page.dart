import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/home/food_page.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

import '../utils/dimensions.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // print('current height is ' + MediaQuery.of(context).size.height.toString());
    // print('current Width is ' + MediaQuery.of(context).size.width.toString());
    // print('current Getx - Height is ' + Get.context!.height.toString());
    // print('current Getx - Width is ' + Get.context!.width.toString());

    return Scaffold(
      body: Column(
        children: [
          Container(
            //Status Header Section
            child: Container(
              margin: const EdgeInsets.only(top: 45, bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: 'Nigeria', color: AppColors.mainColor),
                      Row(
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
                      width: scaleHeight(45),
                      height: scaleHeight(45),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: scaleHeight(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const FoodPage(),
          SizedBox(
            height: scaleHeight(50),
          ),
          Center(
            child: Text(
              'Hello',
              style: TextStyle(
                fontSize: scaleHeight(150),
              ),
            ),
          )
        ],
      ),
    );
  }
}
