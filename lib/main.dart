import 'package:flutter/material.dart';
import 'package:gps_project/datamodels/user_location.dart';
import 'package:gps_project/services/location_service.dart';
import 'package:gps_project/views/home_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
        create: (context) => LocationService().locationStream,
        child: MaterialApp(title: 'Flutter Demo', home: HomeView()));
  }
}
