import 'package:flutter/material.dart';
import 'package:flutter_realtime_detection/InfoPage/organik.dart';
import 'package:flutter_realtime_detection/deteksiBiasa.dart';
import 'package:flutter_realtime_detection/fix.dart';
import 'package:flutter_realtime_detection/home.dart';
import 'package:flutter_realtime_detection/main.dart';
import 'package:flutter_realtime_detection/pilihkategori.dart';
import 'package:flutter_realtime_detection/screen.dart';
import 'package:flutter_realtime_detection/style/style.dart';

class CardInfo extends StatelessWidget {
  final String imgUrl;
  final String desc;
  final int index;

  const CardInfo({Key key, this.imgUrl, this.desc, @required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (index == 0) {
        } else if (index == 1) {
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebViewContainer(
                      'https://rimbakita.com/sampah-organik/', desc)));
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // color: warnaPutih,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: index == 20
                        ? primaryColor.withOpacity(0.2)
                        : warnaPutih,
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    imgUrl,
                    color: index == 20
                        ? darkPrimaryColor
                        : index % 2 == 1 ? warnaOren : primaryColor,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 34,
              child: Container(
                  height: MediaQuery.of(context).size.height / 7.2,
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: Text(
                    desc,
                    style: secondaryStyle,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class CardDeteksi extends StatelessWidget {
  final String imgUrl;
  final String desc;
  final int index;

  const CardDeteksi({Key key, this.imgUrl, this.desc, @required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      // hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () async {
        if (index == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage(cameras)));
        } else if (index == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PilihKategori()));
        }
      },
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // color: warnaPutih,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: index == 20
                        ? primaryColor.withOpacity(0.2)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    imgUrl,
                    color: index == 20
                        ? darkPrimaryColor
                        : index % 2 == 1 ? warnaOren : primaryColor,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 34,
              child: Container(
                  height: MediaQuery.of(context).size.height / 7.2,
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: Text(
                    desc,
                    style: secondaryStyle,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
