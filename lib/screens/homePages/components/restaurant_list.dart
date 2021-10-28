import 'package:flutter/material.dart';
import 'package:foodapp/models/restaurant.dart';
import 'package:foodapp/widgets/loading.dart';
import 'package:foodapp/widgets/small_floating_button.dart';
import 'package:transparent_image/transparent_image.dart';

class RestaurantListe extends StatefulWidget {
  const RestaurantListe({
    Key key,
    @required this.restaurantModel,
  }) : super(key: key);

  final RestaurantModel restaurantModel;

  @override
  _RestaurantListeState createState() => _RestaurantListeState();
}

class _RestaurantListeState extends State<RestaurantListe> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.center,
                    child: Container(height: 210, child: Loading()),
                  )),
                  Center(
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: widget.restaurantModel.image),
                  )
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SmallButton(Icons.favorite),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow[900],
                              size: 20,
                            ),
                          ),
                          Text(widget.restaurantModel.rating
                              .toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.05),
                      Colors.black.withOpacity(0.025),
                    ],
                  )),
            ),
          )),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                              "${widget.restaurantModel.name} \n",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "avg meal price: ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300)),
                      TextSpan(
                          text:
                              "\$${widget.restaurantModel.avgPrice} \n",
                          style: TextStyle(fontSize: 16)),
                    ], style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
