import 'package:flutter/material.dart';
import 'package:loja/srs/models/shoes_model.dart';

class NikeShoesItem extends StatelessWidget {
  final VoidCallback onTap;
  final NikeShoes shoesItem;

  const NikeShoesItem({
    Key key,
    this.shoesItem,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHight = 250.0;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 400,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned.fill(
                  child: Hero(
                    tag: 'background_${shoesItem.model}',
                    child: Container(
                      color: Color(shoesItem.color),
                    ),
                  ),
                ),
                Center(
                  child: Hero(
                    tag: 'vulgo_${shoesItem.model}',
                    child: SizedBox(
                      height: itemHight * 0.6,
                      child: Material(
                        color: Colors.transparent,
                        child: FittedBox(
                          child: Text(
                            shoesItem.vulgo,
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
                Positioned(
                  top: 20,
                  left: 20,
                  height: itemHight * 0.8,
                  child: Hero(
                    tag: 'image_${shoesItem.model}',
                    child: Image.asset(
                      shoesItem.image.first,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 30,
                    left: 30,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                      ),
                    )),
                Positioned(
                    bottom: 30,
                    right: 30,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                      ),
                    )),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        shoesItem.model,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$${shoesItem.oldPrice.toString()}',
                        style: TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$${shoesItem.price.toString()}',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
