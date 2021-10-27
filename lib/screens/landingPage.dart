import 'package:foodapp/apis/foodAPIs.dart';
import 'package:foodapp/notifiers/authNotifier.dart';
import 'package:foodapp/screens/adminHome.dart';
import 'package:foodapp/screens/homePage.dart';
import 'package:foodapp/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.cyan.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                'SeneFood',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'MuseoModerno',
                ),
              ),
            ),
            Text(
              'Application de restaurant ',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 17,
                color: Color.fromRGBO(252, 188, 126, 1),
              ),
            ),
            SizedBox(
              height: 140,
            ),
            GestureDetector(
              onTap: () {
                (authNotifier.user == null)
                    ? Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                        return LoginPage();
                      }))
                    : (authNotifier.userDetails == null)
                        ? print('wait')
                        : (authNotifier.userDetails.role == 'admin')
                            ? Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return AdminHomePage();
                                },
                              ))
                            : Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return HomePage();
                                }),
                              );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Commencer",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.cyan.shade900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
