import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import '../cart_system.dart';
import '../screens/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.grey,
      ),
      home: const ItemScreen(),
    );
  }
}

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartSystem>(
      create: (context) => CartSystem(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Item list"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 9),
              child: Consumer<CartSystem>(
                builder: (context, cartSystem, _) => IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen(cartObj: cartSystem),
                    ));
                  },
                  icon: const Icon(Icons.shopping_cart_rounded),
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: const [
            ListItems(
              itemName: "Samsung Galaxy S21 Ultra",
              img: "s21u.png",
            ),
            ListItems(
              itemName: "Lenovo Legion 5",
              img: "legion5.png",
            ),
            ListItems(
              itemName: "Acer Nitro 5",
              img: "nitro5.png",
            ),
            ListItems(
              itemName: "Redmi Note 10 Pro",
              img: "rn10pro.png",
            ),
            ListItems(
              itemName: "Intel Core i9-12900K",
              img: "corei9.png",
            ),
            ListItems(
              itemName: "OPPO Find N",
              img: "oppo-find-n.png",
            ),
            ListItems(
              itemName: "Xiaomi 11 Ultra",
              img: "mi11ultra.png",
            ),
          ],
        ),
      ),
    );
  }
}

class ListItems extends StatefulWidget {
  const ListItems({Key? key, required this.img, required this.itemName})
      : super(key: key);

  final String img, itemName;

  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
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
            // ADD/REMOVE BUTTON
            Consumer<CartSystem>(builder: (context, cartSystem, _) {
              String addRemoveTxt = (cartSystem.cartList.any((elem) =>
                      listEquals(elem, [widget.itemName, widget.img])))
                  ? "REMOVE "
                  : "ADD";
              return TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) =>
                      (cartSystem.cartList.any((elem) =>
                              listEquals(elem, [widget.itemName, widget.img])))
                          ? Colors.red.withOpacity(0.75)
                          : Colors.green.withOpacity(0.8)),
                ),
                onPressed: () {
                  if (cartSystem.cartList.any((elem) =>
                      listEquals(elem, [widget.itemName, widget.img]))) {
                    cartSystem.removeItem(widget.itemName, widget.img);
                  } else {
                    cartSystem.addItem(widget.itemName, widget.img);
                  }
                },
                child: Text(
                  addRemoveTxt,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
