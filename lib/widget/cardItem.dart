import 'package:flutter/material.dart';
import 'package:flutter_realtime_detection/screen.dart';
import 'package:flutter_realtime_detection/style/style.dart';

class CardItem extends StatelessWidget {
  final ScrollWidgetItem s;

  const CardItem({Key key, this.s}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: warnaPutih,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 12)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120,
            width: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                s.imgUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 140,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  s.name,
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w800,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  s.desc,
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
