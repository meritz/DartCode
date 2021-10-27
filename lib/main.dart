import 'package:flutter/material.dart';
import 'package:foodapp/providers/app.dart';
import 'package:foodapp/providers/restaurantProvider.dart';
import 'package:foodapp/screens/landingPage.dart';
import 'package:provider/provider.dart';
import 'notifiers/authNotifier.dart';

// void main() {
//   runApp(MyApp());
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthNotifier(),
      ),
      // ChangeNotifierProvider(
      //   create: (_) => FoodNotifier(),
      // ),
      ChangeNotifierProvider.value(value: AppProvider()),
      ChangeNotifierProvider.value(value: RestaurantProvider.initialize()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SeneFood',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: Colors.cyan.shade900,
      ),
      home: Scaffold(
        body: LandingPage(),
      ),
    );
  }
}
