import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'httpWidgets.dart';
class ReportList extends StatefulWidget{
  createState() => ReportUi();
}
class ReportUi extends State<ReportList>{
  bool loading = true;
  List<Widget> list;
  _fetchData() async {
    HttpWidgets wrapper = new HttpWidgets();
    var ls = await wrapper.getReports();
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
      child:  loading? SpinKitFadingCube(size:20, color: Colors.blue,): list.length==0?Text("There is no medical history"):Column(
          children: list
      ),
    );
  }

}