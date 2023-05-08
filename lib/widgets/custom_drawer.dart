import 'package:e_commerce_flower/pages/checkout_page.dart';
import 'package:e_commerce_flower/pages/home_page.dart';
import 'package:e_commerce_flower/pages/login_page.dart';
import 'package:e_commerce_flower/pages/profile_page.dart';
import 'package:e_commerce_flower/widgets/custom_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
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
                // backgroundImage: NetworkImage(user.photoURL!),
              ),
              accountName: Text("Mohammed El-sayed"),
              accountEmail: Text(user.email!)),
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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            title: Text("Profile page"),
            leading: Icon(Icons.person),
          ),
          ListTile(
            onTap: () async {
              print("Log out");
              await FirebaseAuth.instance.signOut();
              // if (!mounted) return;
              showSnackBar(
                  bgColor: Colors.green,
                  snackBarMessage: "Come back again",
                  context: context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return LoginPage();
              }));
            },
            title: Text("Logout"),
            leading: Icon(Icons.exit_to_app),
          ),
          const Spacer(
            flex: 1,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 24),
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
