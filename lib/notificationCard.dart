import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget{
  final String hospitalId;
  final String hospitalName;
  final String reason;
  NotificationCard(this.hospitalId, this.hospitalName, this.reason);
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0xFFFEFEFE),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Name: ", style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(hospitalName)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Reason: ", style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(reason)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){},
                    child: Icon(Icons.check,),
                    color: Colors.green,
                  ),
                  RaisedButton(
                    onPressed: (){},
                    child: Icon(Icons.cancel,),
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}