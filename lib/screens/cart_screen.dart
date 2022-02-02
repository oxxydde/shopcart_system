import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart_system.dart';

class CartScreen extends StatefulWidget {
  final CartSystem cartObj;
  const CartScreen({Key? key, required this.cartObj}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => CartSystem(),
        builder: (context, _) => Consumer<CartSystem>(builder: (context, cartSystem, _) {
          List<Widget> itemList = [];
          for (var element in widget.cartObj.cartList) {
            itemList.add(CartListItem(itemName: element[0], img: element[1]));
          }
          return ListView(
            children: itemList,
          );
        }),
      ),
    );
  }
}

class CartListItem extends StatefulWidget {
  final String itemName, img;
  const CartListItem({Key? key, required this.itemName, required this.img})
      : super(key: key);

  @override
  _CartListItemState createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        height: screenSize.height * 0.135,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // IMAGE
            Image(
              image: AssetImage('assets/images/${widget.img}'),
              width: 60,
              height: 60,
            ),
            Container(
              width: 17,
            ),
            // ITEM NAME
            Text(
              widget.itemName,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
