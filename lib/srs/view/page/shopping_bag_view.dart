import 'package:flutter/material.dart';
import 'package:loja/srs/models/shoes_model.dart';
import 'package:loja/srs/view/widgets/list_button_sizes.dart';

const _buttonSize = 180.0;
const _buttonCircularSize = 55.0;
const _buttonCircularSiz = 50.0;
const _buttonCircularSizes = 100.0;
const _imageSize = 120.0;
const _finalImageSize = 40.0;

class NikeShoppingBag extends StatefulWidget {
  final NikeShoes shoes;

  const NikeShoppingBag({Key key, this.shoes}) : super(key: key);

  @override
  _NikeShoppingBagState createState() => _NikeShoppingBagState();
}

class _NikeShoppingBagState extends State<NikeShoppingBag>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animationResize;
  Animation _animationMovementIn;
  Animation _animationMovementOut;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    _animationResize = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.3,
        ),
      ),
    );

    _animationMovementIn = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.45,
          0.7,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _animationMovementOut = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.85,
          1.0,
          curve: Curves.easeInBack,
        ),
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop(true);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPanel() {
    final currentImageSize = (_imageSize * _animationResize.value)
        .clamp(_finalImageSize, _imageSize);
    final size = MediaQuery.of(context).size;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.1),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(
            0.0,
            value * size.height * 1.0,
          ),
          child: child,
        );
      },
      child: Container(
        height: (size.height * 1.7 * _animationResize.value)
            .clamp(_buttonCircularSizes, size.height * 2.7),
        width: (size.width * _animationResize.value)
            .clamp(_buttonCircularSizes, size.width),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: _animationResize.value == 1
                ? Radius.circular(0)
                : Radius.circular(30),
            bottomRight: _animationResize.value == 1
                ? Radius.circular(0)
                : Radius.circular(30),
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: _animationResize.value == 1
                      ? const EdgeInsets.only(left: 25, top: 25)
                      : const EdgeInsets.only(left: 0, top: 3),
                  child: Image.asset(
                    widget.shoes.imagem,
                    height: currentImageSize,
                  ),
                ),
                if (_animationResize.value == 1) ...[
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          widget.shoes.model,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            '\$${widget.shoes.price}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ],
            ),
            if (_animationResize.value == 1) ...[
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  height: 0.4,
                  width: 360,
                  color: Colors.black12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'assets/images/foot.png',
                        color: Colors.black,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    Text('ESCOLHA O TAMANHO'),
                  ],
                ),
              ),
              Expanded(
                child: ListButtonsSize(
                  sizes: widget.shoes.sizes,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final _buttonSizeWidth = (_buttonSize * _animationResize.value)
                .clamp(_buttonCircularSize, _buttonSize);
            final panelSizeWidth = (size.width * _animationResize.value)
                .clamp(_buttonCircularSiz, size.width);
            final panelSizeHeight = (size.height * _animationResize.value)
                .clamp(_buttonCircularSiz, size.height);
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      color: Colors.black87,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Stack(
                    children: [
                      if (_animationMovementIn.value != 1)
                        Positioned(
                          top: size.height * 0.1 +
                              (_animationMovementIn.value * size.height * .654),
                          left: size.width / 2 - panelSizeWidth / 2,
                          width: panelSizeWidth,
                          height: panelSizeHeight,
                          child: _buildPanel(),
                        ),
                      Positioned(
                        bottom: 60 - (_animationMovementOut.value * 120),
                        left: size.width / 2 - _buttonSizeWidth / 2,
                        child: TweenAnimationBuilder(
                          tween: Tween(begin: 1.0, end: 0.0),
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeInOutCubic,
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(
                                0.0,
                                value * size.height * 0.6,
                              ),
                              child: child,
                            );
                          },
                          child: InkWell(
                            onTap: () {
                              _controller.forward();
                            },
                            child: Container(
                              width: _buttonSizeWidth,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Colors.white,
                                    ),
                                    if (_animationResize.value == 1) ...[
                                      const SizedBox(width: 10),
                                      Text(
                                        'ADD NA SACOLA',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
