import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget{
  final String name;
  final String symptoms;
  final String doctor;
  ReportCard(this.name, this.symptoms,this.doctor );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //return SizedBox();
    return Card(
        child:ExpansionTile(
            title: Text(name, softWrap: true, overflow: TextOverflow.ellipsis,),
            children:<Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Name: ", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(name.toString())
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Symptoms : ", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(symptoms.toString())
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Doctor : ", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(doctor.toString())
                      ],
                    ),

                  ],
                ),
              ),
            ]

        ));
  }

}