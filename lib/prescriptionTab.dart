import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'httpWidgets.dart';
class PrescriptionTab extends StatefulWidget {


  @override
  _PrescriptionTabState createState() => _PrescriptionTabState();
}

class _PrescriptionTabState extends State<PrescriptionTab> {
  PageController pageController;
  double pageOffset = 0;
  bool loading = true;

  List prescriptionList = List<Widget>();
  _initPrescription()async{
    HttpWidgets httpWidgets = new HttpWidgets();
    var ls = await httpWidgets.getPrescriptions();
    setState(() {
      prescriptionList = ls;
      loading = false;
    });
  }
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page); //<-- add listener and set state
    });
    _initPrescription();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return new SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: loading?SpinKitFadingCube(size:20, color: Colors.blue,): prescriptionList.length==0?Text("Currently there are no prescription :)"):PageView(
        controller: pageController,
        children: prescriptionList
      ),
    );
  }
}