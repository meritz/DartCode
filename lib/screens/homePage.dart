import 'package:foodapp/helpers/screnn_navigation.dart';
import 'package:foodapp/providers/restaurantProvider.dart';
import 'package:foodapp/screens/restaurant.dart';
import 'package:foodapp/screens/restaurant_search.dart';
import 'package:foodapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/providers/app.dart';
import 'package:foodapp/widgets/loading.dart';
import 'package:foodapp/widgets/restaurant.dart';
import 'package:foodapp/helpers/style.dart';
import 'package:foodapp/screens/transmitdata_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);

    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    restaurantProvider.loadSingleRestaurant();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.5,
        backgroundColor: Colors.cyan.shade900,
        title: CustomText(
          text: "SeneFood",
          color: white,
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.document_scanner_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return TransmitDataScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      backgroundColor: white,
      body: app.isLoading
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Loading()],
              ),
            )
          : SafeArea(
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.cyan.shade900,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, left: 8, right: 8, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.search,
                            color: Colors.cyan.shade900,
                          ),
                          title: TextField(
                            textInputAction: TextInputAction.search,
                            onSubmitted: (pattern) async {
                              await restaurantProvider.search(name: pattern);
                              changeScreen(context, RestaurantsSearchScreen());
                            },
                            decoration: InputDecoration(
                              hintText: "Trouver un restaurant",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: " Restaurants populaires",
                          size: 20,
                          color: grey,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Column(
                    children: restaurantProvider.restaurants
                        .map((item) => GestureDetector(
                              onTap: () async {
                                changeScreen(
                                    context,
                                    RestaurantScreen(
                                      restaurantModel: item,
                                    ));
                              },
                              child: RestaurantWidget(
                                restaurant: item,
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
    );
  }
}
