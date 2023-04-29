import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/data/items_data.dart';
import 'package:e_commerce_flower/models/item_model.dart';
import 'package:e_commerce_flower/widgets/custom_app_bar.dart';
import 'package:e_commerce_flower/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  // final String d = "";
  // final List<Item> testItems = [
  //   Item(imgPath: "assets/img/1.jpg", price: 12.99),
  //   Item(imgPath: "assets/img/2.jpg", price: 13.99),
  //   Item(imgPath: "assets/img/3.jpg", price: 15.99),
  //   Item(imgPath: "assets/img/4.jpg", price: 8.99),
  //   Item(imgPath: "assets/img/5.jpg", price: 10.99),
  //   Item(imgPath: "assets/img/6.jpg", price: 20.99),
  //   Item(imgPath: "assets/img/7.jpg", price: 30.99),
  //   Item(imgPath: "assets/img/8.jpg", price: 12.99),
  // ];
  // final List<Map<String, dynamic>> testImages = [
  //   // Item(imgPath: "assets/img/1.jpg", price: 12.99)  ,
  //   {
  //     "imgPath": "assets/img/1.jpg",
  //     "price": 12.99,
  //   },
  //   {
  //     "imgPath": "assets/img/2.jpg",
  //     "price": 13.99,
  //   },
  //   {
  //     "imgPath": "assets/img/3.jpg",
  //     "price": 15.99,
  //   },
  //   {
  //     "imgPath": "assets/img/4.jpg",
  //     "price": 8.99,
  //   },
  //   {
  //     "imgPath": "assets/img/5.jpg",
  //     "price": 10.99,
  //   },
  //   {
  //     "imgPath": "assets/img/6.jpg",
  //     "price": 20.99,
  //   },
  //   {
  //     "imgPath": "assets/img/7.jpg",
  //     "price": 30.99,
  //   },
  //   {
  //     "imgPath": "assets/img/8.jpg",
  //     "price": 10.99,
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: customAppBar(),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GridTile(
                      child: Image.asset(
                        // testImages[index]["imgPath"],
                        items[index].imgPath,
                        fit: BoxFit.cover,
                      ),
                      footer: GridTileBar(
                        // backgroundColor: Colors.black,
                        title: Text(""),
                        // subtitle: Text(""),
                        leading: Text(
                          // "\$" + testImages[index]["price"].toString(),
                          "\$" + items[index].price.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          // padding: EdgeInsets.all(0),
                          icon: Container(
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: Icon(Icons.add)),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
