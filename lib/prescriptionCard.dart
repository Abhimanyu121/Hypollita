import 'package:flutter/material.dart';
import 'dart:math'as math;
class PrescriptionCard extends StatelessWidget {
  final double offset;
  final String name; //<-- title of the event
  final String dose ;
  final String meal ;//<-- date of the event
  final String assetLink;//<-- name of the image to be displayed

  const PrescriptionCard({
    Key key,
    @required this.name,
    @required this.dose,
    @required this.assetLink,
    @required this.offset,
    @required this.meal
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)), //<--custom shape
        child: Column(
          children: <Widget>[
            ClipRRect(  //<--clipping image
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.network( //<-- main image
                assetLink,
                height: MediaQuery.of(context).size.height * 0.3,
                //height: 30,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.none,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: CardContent( //<--replace the Container with CardContent
                name: name,
                meal: meal,
                dose: dose,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CardContent extends StatelessWidget {
  final String name;
  final String dose;
  final String meal;
  final double offset;
  const CardContent({Key key, @required this.name, @required this.dose,@required this.meal, @required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Transform.translate(offset:Offset(8 * offset, 0), child: Text(name, style: TextStyle(fontSize: 20))),
          SizedBox(height: 8),
          Transform.translate(offset:Offset(32 * offset, 0), child: Text(dose +(" Times a day"), style: TextStyle(color: Colors.grey))),
          SizedBox(height: 8),
          Transform.translate(offset:Offset(32 * offset, 0), child: Text(meal +(" Meal"), style: TextStyle(color: Colors.grey))),
          Spacer(),
          Row(
            children: <Widget>[
              Transform.translate(
                offset:Offset(48 * offset, 0),
                child: RaisedButton(
                  color: Color(0xFF162A49),
                  child: Text('Order'),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  onPressed: () {},
                ),
              ),
              Spacer(),
              Transform.translate(
                offset:Offset(32 * offset, 0),
                child: Text(
                  '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}