import 'package:e_commerce_flower/providers/cart.dart';
import 'package:e_commerce_flower/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
            pageTitle: "Checkout",
          )),
      body: SizedBox(
          height: 300,
          child: Consumer<Cart>(
            builder: (context, classInstance, child) {
              return ListView.builder(
                  // itemCount: classInstance.selectedProducts.length,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        subtitle: Text("Test"),
                        leading: CircleAvatar(
                            backgroundImage: AssetImage("assets/img/1.jpg")),
                        title: Text("TEST"),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.remove),
                        ),
                      ),
                    );
                  });
            },
          )),
    ));
  }
}
