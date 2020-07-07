import 'package:flutter/cupertino.dart';
import 'package:gps_project/datamodels/user_location.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Center(
      child: Text(
          'Ubicación: Lat:${userLocation.latitude}, Long: ${userLocation.longitude}'),
    );
  }
}
