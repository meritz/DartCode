import 'package:flutter/material.dart';
import 'package:foodapp/helpers/restaurantHelpers.dart';
import 'package:foodapp/models/restaurant.dart';

class RestaurantProvider with ChangeNotifier {
  RestaurantServices _restaurantServices = RestaurantServices();
  List<RestaurantModel> restaurants = [];
  List<RestaurantModel> searchedRestaurants = [];

  RestaurantModel restaurant;

  RestaurantProvider.initialize() {
    loadRestaurants();
  }

  loadRestaurants() async {
    restaurants = await _restaurantServices.getRestaurants();
    notifyListeners();
  }

  loadSingleRestaurant({int retaurantId}) async {
    restaurant = await _restaurantServices.getRestaurantById(id: retaurantId);
    notifyListeners();
  }

  Future search({String name}) async {
    searchedRestaurants =
        await _restaurantServices.searchRestaurant(restaurantName: name);
    print("RESTOS ARE: ${searchedRestaurants.length}");
    notifyListeners();
  }
}
