import 'package:flutter/material.dart';
class Tabs extends StatefulWidget{
  Function _superTab1;
  Function _superTab2;
  Function _superTab3;
  Tabs(this._superTab1, this._superTab2, this._superTab3);
  @override
  createState() => new TabsUi(_superTab1, _superTab2, _superTab3);
}
class TabsUi extends State<Tabs> {
  bool tab1 = true;
  bool tab2 = false;
  bool tab3 = false;
  Function _superTab1;
  Function _superTab2;
  Function _superTab3;
  TabsUi(this._superTab1, this._superTab2, this._superTab3);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 24),
        FlatButton(child: MyTab(text: 'Prescriptions', isSelected: tab1), onPressed: _tab1,),
        FlatButton(child: MyTab(text: 'Reports', isSelected: tab2), onPressed: _tab2,),
        FlatButton(child: MyTab(text: 'Nearby', isSelected: tab3), onPressed: _tab3,),
      ],
    );
  }
  _tab1(){
    setState(() {
      tab1 = true;
      tab2 = false;
      tab3 = false;
    });
    _superTab1();
  }
  _tab2(){
    setState(() {
      tab1 = false;
      tab2 = true;
      tab3 = false;
    });
    _superTab2();
  }
  _tab3(){
    setState(() {
      tab1 = false;
      tab2 = false;
      tab3 = true;
    });
    _superTab3();
  }
}

class MyTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const MyTab({Key key, @required this.isSelected, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: isSelected ? 16 : 14,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          Container(
            height: 6,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelected ? Color(0xFFFF5A1D) : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}