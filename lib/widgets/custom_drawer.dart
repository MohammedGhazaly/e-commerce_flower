import 'package:e_commerce_flower/pages/checkout_page.dart';
import 'package:e_commerce_flower/pages/home_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/test.jpg"),
                      fit: BoxFit.cover)),
              currentAccountPicture: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage("assets/img/ali.jpg"),
              ),
              accountName: Text("Mohammed El-sayed"),
              accountEmail: Text("warendragon67@gmail.com")),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            title: Text("Home"),
            leading: Icon(Icons.home),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckoutPage()));
            },
            title: Text("My products"),
            leading: Icon(Icons.add_shopping_cart),
          ),
          ListTile(
            onTap: () {},
            title: Text("About"),
            leading: Icon(Icons.help_center),
          ),
          ListTile(
            onTap: () {},
            title: Text("Logout"),
            leading: Icon(Icons.exit_to_app),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(
              "Developed by Mohammed El-sayed 2022",
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
