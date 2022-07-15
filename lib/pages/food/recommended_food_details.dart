import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:readmore/readmore.dart';

import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: scaleHeight(70),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.close),
                AppIcon(icon: Icons.shopping_cart),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: scaleHeight(10)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(scaleWidth(20)),
                      topRight: Radius.circular(scaleWidth(20))),
                ),
                child: Center(child: BigText(text: 'Chinese Quisine')),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: scaleHeight(250),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food3.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.only(
                    left: scaleWidth(20),
                    right: scaleWidth(20),
                    top: scaleHeight(10)),
                child: Column(
                  //Full Details food screen info
                  children: [
                    ReadMoreText(
                      'Flutter is Google mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. Flutter is Google mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. Flutter is Google mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. Flutter is Google mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. Flutter is Google mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. Let\'s try to understand the concept about all products and services uploaded here they are all good products. Take a deep dive into the logics required to store information in the database as information generated are pushed ahead to take columns and rows.',
                      trimLines: 10,
                      //trimLength: 200,
                      //colorClickableText: Colors.pink,
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
                    )
                  ],
                )),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: scaleWidth(50), vertical: scaleHeight(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  size: scaleHeight(50),
                  iconColor: Colors.white,
                  iconSize: scaleHeight(24),
                ),
                BigText(
                  text: '\$${12.88} x ${0}',
                  size: scaleHeight(20),
                ),
                AppIcon(
                  icon: Icons.add,
                  iconColor: Colors.white,
                  size: scaleHeight(50),
                  backgroundColor: AppColors.mainColor,
                  iconSize: scaleHeight(24),
                ),
              ],
            ),
          ),
          Container(
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
                //Favourite Button
                Container(
                    padding: EdgeInsets.all(scaleHeight(15)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(scaleWidth(20))),
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )),
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
        ],
      ),
    );
  }
}
