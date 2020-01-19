import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'httpWidgets.dart';
class NotificationsList extends StatefulWidget {
  @override
  createState() => NotifcationListUi();
}
class NotifcationListUi extends State<NotificationsList>{
  bool loading = true;
  List<Widget> list;
  _fetchData() async {
    HttpWidgets wrapper = new HttpWidgets();
    var ls = await wrapper.getNotifications();
    setState(() {
      list = ls;
      loading = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Text("Swipe"),
            Expanded(
              child: loading? SpinKitFadingCube(size:20, color: Colors.blue,): list.length==0?Text("No Notifications"):ListView(
                children: list
              ),
            ),
          ],
        ),
      ),
    );
  }

}