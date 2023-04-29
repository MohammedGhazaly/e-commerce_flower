import 'package:e_commerce_flower/constants.dart';
import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    backgroundColor: appBarGreenColor,
    title: Text("Home"),
    actions: [
      Row(
        children: [
          Stack(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
              Positioned(
                top: -0,
                left: -0,
                child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(211, 164, 255, 193),
                        shape: BoxShape.circle),
                    child: Text(
                      "0",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              "\$0",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    ],
  );
}
