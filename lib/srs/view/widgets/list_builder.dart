import 'package:flutter/material.dart';
import 'package:loja/srs/models/shoes_model.dart';
import 'package:loja/srs/view/page/details_view.dart';
import 'package:loja/srs/view/widgets/item_view.dart';

class ListViewNikeShoes extends StatelessWidget {
  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

  void _onShoesPressed(NikeShoes shoes, BuildContext context) async {
    notifierBottomBarVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
        return FadeTransition(
          opacity: animation1,
          child: NikeShoesDetails(
            shoes: shoes,
          ),
        );
      }),
    );
    notifierBottomBarVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 46,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 155, bottom: 10.0, right: 120),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  child: Icon(Icons.filter_list_alt),
                  onTap: () {},
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: shoes.length,
              padding: const EdgeInsets.only(bottom: 50),
              itemBuilder: (context, index) {
                final shoesItem = shoes[index];
                return NikeShoesItem(
                  shoesItem: shoesItem,
                  onTap: () {
                    _onShoesPressed(shoesItem, context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
