import 'package:flutter/material.dart';
import 'package:flutter_realtime_detection/deteksiBiasa.dart';
import 'package:flutter_realtime_detection/style/style.dart';

  List<String> samp = [
    'Kaca',
    'Kaleng',
    'Kardus',
    'Kertas',
    'Plastik',
    'Organik'
  ];
class PilihKategori extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deteksi Upload Foto',
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[700],
        ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,
        color: Colors.grey[700],
        ), onPressed: ()=> Navigator.pop(context)),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(14.0),
        child: new GridView.count(
        primary: true,
        crossAxisCount: 2,
        childAspectRatio: 5/4,
        children: List.generate(samp.length, (index) {
          return getStructuredGridCell(context, samp[index]);
        }),
    ),
      )
      
    );
  }
  Card getStructuredGridCell(BuildContext context,String samp) {
    return new Card(
        elevation: 1.5,
        child: InkWell(
          onTap: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyImagePicker(
                kategori: samp,
              )));
          },
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('assets/real.png',
                height: 40,
                width: 40,
                color: primaryColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(samp)
            ],
          ),
        ));
  }
}