import 'package:flutter/cupertino.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }
}

Widget _buildPageItem(int index) {
  return Container(
    height: 220,
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
      image: const DecorationImage(
          image: AssetImage("assets/images/food1.jpg"), fit: BoxFit.cover),
    ),
    //child: Stack(),
  );
}
