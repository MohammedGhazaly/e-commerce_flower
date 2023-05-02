import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/providers/cart_provider.dart';
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
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(
            pageTitle: "Checkout",
          )),
      body: Consumer<Cart>(
        builder: (context, classInstance, child) {
          return Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.73,
                  child: ListView.builder(
                      itemCount: classInstance.selectedProducts.length,
                      // itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            subtitle: Text(
                                "${classInstance.selectedProducts[index].location} - ${classInstance.selectedProducts[index].price} \$"),
                            leading: CircleAvatar(
                                backgroundImage: AssetImage(classInstance
                                    .selectedProducts[index].imgPath)),
                            title: Text(classInstance
                                .selectedProducts[index].productName),
                            trailing: IconButton(
                              onPressed: () {
                                classInstance.removeProductUsingIndex(
                                    classInstance.selectedProducts[index],
                                    index);
                              },
                              icon: const Icon(Icons.remove),
                            ),
                          ),
                        );
                      })),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(16)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                        backgroundColor: MaterialStateProperty.all(pinkColor)),
                    onPressed: () {},
                    child: Text(
                      "Pay ${classInstance.totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 18),
                    )),
              )
            ],
          );
        },
      ),
    ));
  }
}
