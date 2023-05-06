import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/pages/home_page.dart';
import 'package:e_commerce_flower/pages/login_page.dart';
import 'package:e_commerce_flower/pages/verify_email_page.dart';
import 'package:e_commerce_flower/providers/cart_provider.dart';
import 'package:e_commerce_flower/providers/progress_indicator_provider.dart';
import 'package:e_commerce_flower/providers/toggle_password_provider.dart';
import 'package:e_commerce_flower/widgets/custom_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Phoenix(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

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
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // return Container();
                // return HomePage();
                return VerifyEmailPage();
              } else {
                return LoginPage();
              }
            },
          )
          // LoginPage()
          // home: StreamBuilder(
          //   stream: FirebaseAuth.instance.authStateChanges(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(
          //         child: LoadingAnimationWidget.twoRotatingArc(
          //             color: greenColor, size: 28),
          //       );
          //     } else if (snapshot.hasError) {
          //       showSnackBar(
          //           bgColor: Colors.red,
          //           snackBarMessage: "Something went wrong",
          //           context: context);
          //     } else if (snapshot.hasData) {
          //       return HomePage();
          //     } else {
          //       return LoginPage();
          //     }
          //   },
          // ),
          ),
    );
  }
}
