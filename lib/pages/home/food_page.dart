import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //PageView Builder controller: Shows next slide should be visible or not
  PageController pageController = PageController(viewportFraction: 0.85);

  //control scalable height fror PageView page (Zoom in and Zoom out)
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = scaleHeight(320);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider Section
        SizedBox(
          height: scaleHeight(320),
          child: PageView.builder(
              itemCount: 5,
              controller: pageController,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),

        //Popular Text
        SizedBox(height: scaleHeight(15)),
        Container(
          margin: EdgeInsets.only(left: scaleWidth(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(width: scaleWidth(10)),
              BigText(
                text: '.',
                size: scaleHeight(30),
                color: AppColors.titleColor,
              ),
              SizedBox(width: scaleWidth(10)),
              Container(
                margin: EdgeInsets.only(bottom: scaleHeight(2)),
                child:
                    SmallText(text: 'Recommended', color: AppColors.titleColor),
              ),
            ],
          ),
        ),
        SizedBox(width: scaleWidth(10)),
        //List of food and images
        SizedBox(
          height: scaleHeight(700),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: ((context, index) {
                return Container(
                  width: scaleWidth(120),
                  height: scaleHeight(120),
                  margin: EdgeInsets.only(
                      left: scaleWidth(20),
                      right: scaleWidth(20),
                      bottom: scaleHeight(10)),
                  child: Row(
                    children: [
                      Container(
                        width: scaleWidth(120),
                        height: scaleHeight(120),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(scaleHeight(15)),
                          color: Colors.red,
                          image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/food3.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: scaleHeight(100),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(scaleWidth(10)),
                                bottomRight: Radius.circular(scaleWidth(10)),
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: scaleWidth(10),
                                right: scaleWidth(10),
                                top: scaleHeight(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                    text: 'Nutritious Fruit Mealfadafdafadf'),
                                SizedBox(height: scaleHeight(8)),
                                SmallText(text: 'Best Meal with Chinese love'),
                                SizedBox(height: scaleHeight(10)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    //Scaling zoom pageView Builder
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: scaleHeight(220),
            margin: EdgeInsets.symmetric(horizontal: scaleWidth(10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(scaleHeight(30)),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                image: AssetImage("assets/images/food1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                  left: scaleHeight(30),
                  right: scaleHeight(30),
                  bottom: scaleHeight(30)),
              height: scaleHeight(120),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    left: scaleWidth(15),
                    top: scaleHeight(15),
                    right: scaleWidth(15)),
                child: const AppColumn(
                  text: "Yummy Yummy Cake",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
