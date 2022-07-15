import 'package:get/get.dart';

// class Dimensions {
//   static double screenHeight = Get.context!.height;
//   static double screenWidth = Get.context!.width;

// //PageView Responsive sizes
//   static double pageViewContainer = screenHeight / 3.87;
//   static double pageViewTextContainer = screenHeight / 7.09;
//   static double pageView = screenHeight / 2.65;

//   //
//   static double height5 = screenHeight / 170.18;
//   static double height10 = screenHeight / 85.09;
//   static double height15 = screenHeight / 56.76;

//   static double height20 = screenHeight / 42.54;
//   static double height130 = screenHeight / 6.54;
// }

double scaleHeight(double val) {
  double screenHeight = Get.context!.height;
  double scaleHeight = screenHeight / (screenHeight / val);
  return scaleHeight;
}

double scaleWidth(double val) {
  double screenWidth = Get.context!.width;
  double scaleWidth = screenWidth / (screenWidth / val);
  return scaleWidth;
}
