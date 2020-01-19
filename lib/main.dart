import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypollita/notificationList.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'tabs.dart';
import 'prescriptionTab.dart';
import 'reportList.dart';
void main() => runApp(HypollitaState());
class HypollitaState extends StatefulWidget{
  @override
  createState() => new HypollitaUi();
}
class HypollitaUi extends State<HypollitaState> {
  bool tab1 = true;
  bool tab2 = false;
  bool tab3 = false;
  superTab1(){
    setState(() {
      tab1 = true;
      tab2 = false;
      tab2 = false;
    });
  }
  superTab2(){
    setState(() {
      tab1 = false;
      tab2 = true;
      tab2 = false;
    });
  }
  superTab3(){
    setState(() {
      tab1 = false;
      tab2 = false;
      tab2 = true;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    PrescriptionTab prescriptionTab = new PrescriptionTab();
    return CupertinoApp(
      title: 'Hypollita',
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      home: SlidingUpPanel(
        parallaxEnabled: true,
          parallaxOffset: 1.0,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
        panel: Center(
          child: NotificationsList(),
        ),
        collapsed: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(child: Tabs(superTab1, superTab2 , superTab3)),
            Text("Notifications", style: TextStyle(fontWeight : FontWeight.w600),),
            SizedBox(height: 10,)
          ],
        ),
        body: CupertinoPageScaffold(
          backgroundColor: Color(0xFF162A49),
          navigationBar: CupertinoNavigationBar(
            //backgroundColor: Color(0xFFFEFEFE),
            trailing: Text("Logout") ,
            transitionBetweenRoutes: true,
            automaticallyImplyLeading: true,
            automaticallyImplyMiddle: true,
            middle: Text("Medifier"),
            border: Border(top:BorderSide.none, bottom:BorderSide.none, left : BorderSide.none, right:  BorderSide.none),
          ),
          resizeToAvoidBottomInset: true,
          child: Center(
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Center(child: tab1?PrescriptionTab():tab2?ReportList():ReportList()),
                SizedBox(height: 5,)
              ],
            )),
          ),
        ),
      ),
    );
  }
}

