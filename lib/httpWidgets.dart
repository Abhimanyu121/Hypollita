import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'prescriptionCard.dart';
class HttpWidgets {

  Future<List<Widget>> getPrescriptions()async {
    var client = http.Client();
    var widgetList = List<Widget>();
    try {
      var response = await http.get("https://reqres.in/api/users?page=2");
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        var items = jsonResponse['data'] as List;
        print(items);
        for (int i = 0 ; i< items.length; i++){
          var  item = items[i];
          widgetList.add( new PrescriptionCard(
            assetLink: item["avatar"],
            name: item["email"],
            date: item["id"].toString(),
            offset: 0,
          ));
        }
      }
    } finally {
        client.close();
      }
    return widgetList;
    }
  }