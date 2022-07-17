import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/data/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
//API client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://mvs.bslmeiyu.com"));

//Repositories
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

//Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
