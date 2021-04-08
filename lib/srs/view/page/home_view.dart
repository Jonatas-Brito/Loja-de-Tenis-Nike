import 'package:flutter/material.dart';
import 'package:loja/srs/view/widgets/custom_bottombar.dart';
import 'package:loja/srs/view/widgets/list_builder.dart';

class MainNikeShoesStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: NikeShoesStore(),
    );
  }
}

class NikeShoesStore extends StatelessWidget {
  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListViewNikeShoes(),
          ValueListenableBuilder<bool>(
              valueListenable: notifierBottomBarVisible,
              child: CustomBottomBar(),
              builder: (context, value, child) {
                return AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    left: 0,
                    right: 0,
                    bottom: value ? 0.0 : -kToolbarHeight,
                    height: kToolbarHeight,
                    child: child);
              }),
        ],
      ),
    );
  }
}
