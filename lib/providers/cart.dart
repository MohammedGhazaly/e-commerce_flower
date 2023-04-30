import 'package:e_commerce_flower/models/item_model.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List<Item> selectedProducts = [];
  double totalPrice = 0;
  addToSelectedProducts(Item product) {
    selectedProducts.add(product);
    totalPrice += product.price;

    notifyListeners();
  }
}
