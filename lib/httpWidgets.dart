import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'prescriptionCard.dart';
import 'notificationCard.dart';
import 'package:flutter/material.dart';
import 'reportsCard.dart';
class HttpWidgets {

  Future<List<Widget>> getPrescriptions()async {
    var client = http.Client();
    var widgetList = List<Widget>();
    try {
      var response = await http.post("http://52.186.120.243:6969/prescription", body:{"aadhar": "qwerty"});
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        var items = jsonResponse['data'] as List;
        print(items);
        for (int i = 0 ; i< items.length; i++){
          var  item = items[i];
          widgetList.add( new PrescriptionCard(
            assetLink: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png",
            name: item["name"],
            dose: item["dose"].toString(),
            meal : item["meal"].toString(),
            offset: 0,
          ));
        }
      }
    } finally {
        client.close();
      }
    return widgetList;
    }
    Future <List<Widget>> getNotifications() async {
      var client = http.Client();
      var widgetList = List<Widget>();
      try {
        var response = await http.get("https://reqres.in/api/unknown");
        if (response.statusCode == 200) {
          var jsonResponse = convert.jsonDecode(response.body);
          var items = jsonResponse['data'] as List;
          print(items);
          widgetList.add(
            SizedBox(
              height: 20,
            )
          );
          for (int i = 0 ; i< items.length; i++){
            var  item = items[i];
            widgetList.add( new NotificationCard(
              item["Name"].toString(),
              item["name"],
              item["color"].toString()
            ));
          }
        }
      } finally {
        client.close();
      }
      return widgetList;
    }
    Future <List<Widget>> getReports() async {
      var client = http.Client();
      var widgetList = List<Widget>();
      try {
        var response = await http.post("http://52.186.120.243:6969/history", body:{"aadhar": "qwerty"} );
        if (response.statusCode == 200) {
          var jsonResponse = convert.jsonDecode(response.body);
          var items = jsonResponse['data'] as List;
          print(items);

          for (int i = 0 ; i< items.length; i++){
            var  item = items[i];
            widgetList.add( new ReportCard(
                item["name"].toString(),
                item["symptoms"],
                item["doctor"].toString(),

            ));
          }
        }
      } finally {
        client.close();
      }
      return widgetList;
    }
  }