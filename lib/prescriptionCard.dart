import 'package:flutter/material.dart';
import 'dart:math'as math;
class PrescriptionCard extends StatelessWidget {
  final double offset;
  final String name; //<-- title of the event
  final String date; //<-- date of the event
  final String assetLink;//<-- name of the image to be displayed

  const PrescriptionCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.assetLink,
    @required this.offset,
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
                date: date,
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
  final String date;
  final double offset;
  const CardContent({Key key, @required this.name, @required this.date, @required this.offset})
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
          Transform.translate(offset:Offset(32 * offset, 0), child: Text(date, style: TextStyle(color: Colors.grey))),
          Spacer(),
          Row(
            children: <Widget>[
              Transform.translate(
                offset:Offset(48 * offset, 0),
                child: RaisedButton(
                  color: Color(0xFF162A49),
                  child: Text('Reserve'),
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
                  '0.00 \$',
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