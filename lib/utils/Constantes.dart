import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../models/MessageModel.dart';
import 'location_service.dart';

class Constantes{
  static const Color ColorvertFonce = Color.fromRGBO(35, 110, 72, 1);
  static const Color ColorvertPal = Color.fromRGBO(181, 220, 121, 1);
  static const Color ColorvertClair = Color.fromRGBO(97, 166, 72, 1);
  static const Color ColorvertCitron = Color.fromRGBO(118, 188, 33, 1);
  static const Color ColorvertDark = Color.fromRGBO(99, 140, 28, 1);
  static const Color Colormauve = Color.fromRGBO(151, 72, 236, 1);
  static const Color Colorjaune = Color.fromRGBO(255, 198, 41, 1);
  static const Color ColorLight = Color.fromRGBO(241, 245, 249, 1);
  static const Color Colorwhite = Colors.white;
  static const Color Colorblack = Colors.black;

  static const String  BASE_URL = "https://bbopt.net";
  static const String  WEBVIEW_URL = "http://13.51.242.50:8081";


  static List<MessageModel> messages = [
    MessageModel(
        text: 'Yes it\'s cool',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSendByMe: true
    ),
    MessageModel(
        text: 'Okay',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSendByMe: false
    ),
    MessageModel(
        text: 'Thanks',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSendByMe: true
    ),
    MessageModel(
        text: 'Good !',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSendByMe: false
    ),
    MessageModel(
        text: 'Thanks',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSendByMe: true
    ),
    MessageModel(
        text: 'Hello',
        date: DateTime(2022).subtract(Duration(minutes: 1)),
        isSendByMe: false
    ),
    MessageModel(
        text: 'Oui !',
        date: DateTime(2021).subtract(Duration(minutes: 1)),
        isSendByMe: true
    ),
    MessageModel(
        text: 'Comment ?',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSendByMe: false
    ),
  ].reversed.toList();

  static  List<Map<String, dynamic>> dataCharte = [
    {'day': 'Mon', 'value': 140, 'group': 1},
    {'day': 'Tue', 'value': 232, 'group': 1},
    {'day': 'Wed', 'value': 101, 'group': 1},
    {'day': 'Thu', 'value': 264, 'group': 1},
    {'day': 'Fri', 'value': 90, 'group': 1},
    {'day': 'Sat', 'value': 340, 'group': 1},
    {'day': 'Sun', 'value': 250, 'group': 1},
    {'day': 'Mon', 'value': 120, 'group': 2},
    {'day': 'Tue', 'value': 282, 'group': 2},
    {'day': 'Wed', 'value': 111, 'group': 2},
    {'day': 'Thu', 'value': 234, 'group': 2},
    {'day': 'Fri', 'value': 220, 'group': 2},
    {'day': 'Sat', 'value': 340, 'group': 2},
    {'day': 'Sun', 'value': 310, 'group': 2},
    {'day': 'Mon', 'value': 320, 'group': 3},
    {'day': 'Tue', 'value': 132, 'group': 3},
    {'day': 'Wed', 'value': 201, 'group': 3},
    {'day': 'Thu', 'value': 334, 'group': 3},
    {'day': 'Fri', 'value': 190, 'group': 3},
    {'day': 'Sat', 'value': 130, 'group': 3},
    {'day': 'Sun', 'value': 220, 'group': 3},
    {'day': 'Mon', 'value': 220, 'group': 4},
    {'day': 'Tue', 'value': 402, 'group': 4},
    {'day': 'Wed', 'value': 231, 'group': 4},
    {'day': 'Thu', 'value': 134, 'group': 4},
    {'day': 'Fri', 'value': 190, 'group': 4},
    {'day': 'Sat', 'value': 230, 'group': 4},
    {'day': 'Sun', 'value': 120, 'group': 4},
    {'day': 'Mon', 'value': 220, 'group': 5},
    {'day': 'Tue', 'value': 302, 'group': 5},
    {'day': 'Wed', 'value': 181, 'group': 5},
    {'day': 'Thu', 'value': 234, 'group': 5},
    {'day': 'Fri', 'value': 210, 'group': 5},
    {'day': 'Sat', 'value': 290, 'group': 5},
    {'day': 'Sun', 'value': 150, 'group': 5},
  ];
}