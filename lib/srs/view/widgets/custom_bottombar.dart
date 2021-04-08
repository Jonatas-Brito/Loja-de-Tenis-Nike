import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.7),
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
            ),
          ),
          Expanded(
              child: Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          )),
        ],
      ),
    );
  }
}
