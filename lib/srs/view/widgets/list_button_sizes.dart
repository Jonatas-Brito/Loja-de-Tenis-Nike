import 'package:flutter/material.dart';

class ListButtonsSize extends StatefulWidget {
  final List<String> sizes;
  const ListButtonsSize({this.sizes});
  @override
  State<ListButtonsSize> createState() => _ListButtonsSizeState();
}

class _ListButtonsSizeState extends State<ListButtonsSize> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
          itemCount: widget.sizes.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 90,
              mainAxisExtent: 50,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 22),
          itemBuilder: (context, index) {
            String size = widget.sizes[index];

            return ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade200)),
                child: Text(
                  size,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
              ),
            );
          }),
    );
  }
}
