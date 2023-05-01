import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/pages/checkout_page.dart';
import 'package:e_commerce_flower/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.pageTitle,
  });
  final String pageTitle;
  @override
  Widget build(BuildContext context) {
    // final cartInstance = Provider.of<Cart>(context);
    return AppBar(
      backgroundColor: appBarGreenColor,
      title: Text(pageTitle),
      actions: [
        Consumer<Cart>(builder: (context, classInstance, child) {
          return Row(
            children: [
              Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckoutPage()));
                      },
                      icon: Icon(Icons.shopping_cart)),
                  Positioned(
                    top: -0,
                    left: -0,
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(211, 164, 255, 193),
                            shape: BoxShape.circle),
                        child: Text(
                          // الطريقه التانيه اللي بنستعملها علشان نجيب الداتا
                          // cartInstance.selectedProducts.length.toString()
                          classInstance.itemCount.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  // cartInstance.selectedProducts.length.toString()
                  classInstance.totalPrice.toStringAsFixed(2).toString(),
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          );
        })
      ],
    );
  }
}
