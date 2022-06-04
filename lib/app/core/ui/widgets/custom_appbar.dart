import 'package:flutter/material.dart';

class CustomAppbar extends AppBar {
  CustomAppbar({Key? key, double elevation = 2})
      : super(
            key: key,
            backgroundColor: Colors.white,
            elevation: elevation,
            centerTitle: true,
            title: Image.asset(
              'assets/images/logo.png',
              width: 80,
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            actions: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.search),
              )
            ]);
}
