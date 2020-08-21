import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationView{
  final BottomNavigationBarItem item;
  final AnimationController controller;
  NavigationView({
    IconData icon,
    String title,
    TickerProvider vsync
  }):
        item = new BottomNavigationBarItem(icon: new Icon(icon), title: new Text(title)),
        controller = new AnimationController(vsync: vsync,duration: kThemeAnimationDuration);

}