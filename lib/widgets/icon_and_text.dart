import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final double? iconSize;
  final String text;
  final Color color;
  final Color iconColor;
  const IconAndText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.color,
      required this.iconColor,
      this.iconSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        const SizedBox(width: 5),
        SmallText(
          text: text,
          color: color,
        ),
      ],
    );
  }
}
