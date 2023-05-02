import 'package:e_commerce_flower/models/item_model.dart';
import 'package:e_commerce_flower/pages/checkout_page.dart';
import 'package:e_commerce_flower/pages/details_page.dart';
import 'package:e_commerce_flower/pages/home_page.dart';
import 'package:e_commerce_flower/pages/login_page.dart';
import 'package:e_commerce_flower/pages/register_page.dart';
import 'package:e_commerce_flower/providers/cart_provider.dart';
import 'package:e_commerce_flower/providers/progress_indicator_provider.dart';
import 'package:e_commerce_flower/providers/toggle_password_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(
            create: (context) => ProgressIndicatorProvider()),
        ChangeNotifierProvider(create: (context) => TogglePasswordProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: RegisterPage()),
    );
  }
}
