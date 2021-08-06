import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_realtime_detection/screen.dart';
import 'package:flutter_realtime_detection/style/style.dart';
import 'package:flutter_realtime_detection/widget/infoCard.dart';


class DetectObjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warnaPutih,
      appBar: AppBar(
        title: Text('Deteksi',
        style: TextStyle(
          color: Colors.grey[700],
        ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,
        color: Colors.grey[700],
        ), onPressed: ()=> Navigator.pop(context)),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text('Silahkan pilih untuk mendeteksi jenis sampah',
                      style: secondaryStyle,
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 120,
                      child: Image.asset('assets/cek.png')
                    )
                  ],
                )
                ),
                SizedBox(
                  height: 20,
                ),
                CardDeteksi(
                  index: 0,
                  imgUrl: 'assets/real.png',
                  desc: 'Deteksi sampah secara realtime',
                ),
                SizedBox(
                  height: 20,
                ),
                CardDeteksi(
                  index: 1,
                  imgUrl: 'assets/real.png',
                  desc: 'Deteksi sampah melalui upload foto',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
