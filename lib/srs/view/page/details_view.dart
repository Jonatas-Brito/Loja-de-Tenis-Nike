import 'package:flutter/material.dart';
import 'package:loja/srs/controllers/animation/shake.controller.dart';
import 'package:loja/srs/models/shoes_model.dart';
import 'package:loja/srs/view/page/shopping_bag_view.dart';

class NikeShoesDetails extends StatelessWidget {
  final NikeShoes shoes;
  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);

  NikeShoesDetails({Key key, this.shoes}) : super(key: key);

  Future<void> _openShoppingBag(context) async {
    notifierButtonsVisible.value = false;
    await Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, animation1, __) {
          return FadeTransition(
            opacity: animation1,
            child: NikeShoppingBag(shoes: shoes),
          );
        }));
    notifierButtonsVisible.value = true;
  }

  _buildCarousel(context) {
    const itemHight = 250.0;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.50,
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: 'background_${shoes.model}',
              child: Container(
                color: Color(shoes.color),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 30,
            right: 0,
            child: SizedBox(
              height: itemHight * 0.6,
              child: Hero(
                tag: 'vulgo_${shoes.model}',
                child: ShakeTransition(
                  axis: Axis.vertical,
                  duration: Duration(milliseconds: 800),
                  offset: 20,
                  child: Material(
                    color: Colors.transparent,
                    child: FittedBox(
                      child: Text(
                        shoes.vulgo,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.07),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          PageView.builder(
              itemCount: shoes.image.length,
              itemBuilder: (context, index) {
                final tag = index == 0
                    ? 'image_${shoes.model}'
                    : 'image_${shoes.model}_$index';
                return Container(
                  child: Hero(
                    tag: tag,
                    child: ShakeTransition(
                      axis: Axis.vertical,
                      duration: index == 0
                          ? const Duration(milliseconds: 800)
                          : Duration.zero,
                      offset: 50,
                      child: Image.asset(
                        shoes.image[index],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifierButtonsVisible.value = true;
    });

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            height: 25,
          ),
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildCarousel(context),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ShakeTransition(
                          curve: Curves.elasticOut,
                          offset: 300,
                          duration: Duration(milliseconds: 900),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                shoes.model,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const Spacer(),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${shoes.oldPrice.toString()}',
                                      style: TextStyle(
                                          color: Colors.red,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 13),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        '\$${shoes.price.toString()}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        ShakeTransition(
                            offset: 300,
                            curve: Curves.elasticOut,
                            duration: Duration(milliseconds: 1100),
                            child: Text('TAMANHOS DISPONÍVEIS')),
                        const SizedBox(height: 20),
                        ShakeTransition(
                          curve: Curves.elasticOut,
                          offset: 300,
                          duration: Duration(milliseconds: 1200),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _ShoeSizeItem(
                                text: '6',
                              ),
                              _ShoeSizeItem(
                                text: '7',
                              ),
                              _ShoeSizeItem(
                                text: '9',
                              ),
                              _ShoeSizeItem(
                                text: '10',
                              ),
                              _ShoeSizeItem(
                                text: '11',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        ShakeTransition(
                            curve: Curves.elasticOut,
                            offset: 300,
                            duration: Duration(milliseconds: 1300),
                            child: Text('DESCRIÇÃO'))
                      ],
                    ),
                  )
                ],
              ),
            ),
            ValueListenableBuilder<bool>(
                valueListenable: notifierButtonsVisible,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      FloatingActionButton(
                        heroTag: 'fav_1',
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      Spacer(),
                      FloatingActionButton(
                        heroTag: 'fav_2',
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.shopping_bag_outlined,
                        ),
                        onPressed: () {
                          _openShoppingBag(context);
                        },
                      ),
                    ],
                  ),
                ),
                builder: (context, value, child) {
                  return AnimatedPositioned(
                      bottom: value ? 0.0 : -kToolbarHeight * 1.5,
                      left: 0,
                      right: 0,
                      duration: const Duration(milliseconds: 200),
                      child: child);
                })
          ],
        ));
  }
}

class _ShoeSizeItem extends StatelessWidget {
  final String text;

  const _ShoeSizeItem({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        right: 30,
      ),
      child: Text(
        'US$text',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
