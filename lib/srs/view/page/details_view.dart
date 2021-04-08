import 'package:flutter/material.dart';
import 'package:loja/core/widgets/app_bar_widget.dart';
import 'package:loja/srs/controllers/animation/shake.controller.dart';
import 'package:loja/srs/models/shoes_model.dart';
import 'package:loja/srs/view/page/shopping_bag_view.dart';

class NikeShoesDetails extends StatefulWidget {
  final NikeShoes shoes;

  NikeShoesDetails({Key key, this.shoes}) : super(key: key);

  @override
  State<NikeShoesDetails> createState() => _NikeShoesDetailsState();
}

class _NikeShoesDetailsState extends State<NikeShoesDetails> {
  bool firstAnimation = true;
  int valor = 0;

  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);

  Future<void> _openShoppingBag(context) async {
    notifierButtonsVisible.value = false;
    await Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, animation1, __) {
          return FadeTransition(
            opacity: animation1,
            child: NikeShoppingBag(shoes: widget.shoes),
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
              tag: 'background_${widget.shoes.model}',
              child: Container(
                color: Color(widget.shoes.color),
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
                tag: 'vulgo_${widget.shoes.model}',
                child: ShakeTransition(
                  axis: Axis.vertical,
                  duration: Duration(milliseconds: 800),
                  offset: 20,
                  child: Material(
                    color: Colors.transparent,
                    child: FittedBox(
                      child: Text(
                        widget.shoes.vulgo,
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
              itemCount: widget.shoes.image.length,
              itemBuilder: (context, index) {
                if (firstAnimation && valor != 0) {
                  firstAnimation = false;
                }
                if (valor == index) {
                  valor++;
                }

                final tag = index == 0
                    ? 'image_${widget.shoes.model}'
                    : 'image_${widget.shoes.model}_$index';
                return Container(
                  child: Hero(
                    tag: tag,
                    child: ShakeTransition(
                      axis: Axis.vertical,
                      duration: index == 0 && firstAnimation
                          ? const Duration(milliseconds: 800)
                          : Duration.zero,
                      offset: 50,
                      child: Image.asset(
                        widget.shoes.image[index],
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
        appBar: AppBarWidget(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned.fill(
              child: ListView(
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
                                widget.shoes.model,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const Spacer(),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${widget.shoes.oldPrice.toString()}',
                                      style: TextStyle(
                                          color: Colors.red,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 13),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        '\$${widget.shoes.price.toString()}',
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
                            child: SizedBox(
                              width: 250,
                              height: 150,
                              child: GridView.builder(
                                  itemCount: widget.shoes.sizes.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 90,
                                          mainAxisExtent: 30,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5,
                                          childAspectRatio: 22),
                                  itemBuilder: (context, index) {
                                    String size = widget.shoes.sizes[index];
                                    return _ShoeSizeItem(
                                      text: size,
                                    );
                                  }),
                            )),
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
    return Text(
      '$text',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
