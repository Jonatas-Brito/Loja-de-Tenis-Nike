import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final double height;
  final Widget leading;
  final Widget action;
  const AppBarWidget({
    Key key,
    this.height = 70,
    this.leading,
    this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(left: 10, child: leading ?? SizedBox()),
            Hero(
              tag: "logo",
              child: Image.asset(
                'assets/images/logo.png',
                height: 25,
              ),
            ),
            Positioned(right: 10, child: action ?? SizedBox()),
          ],
        ),
      ),
    );
  }
}
