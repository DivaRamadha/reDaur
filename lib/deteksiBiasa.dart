import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_realtime_detection/InfoPage/organik.dart';
import 'package:flutter_realtime_detection/screen.dart';
import 'package:flutter_realtime_detection/style/style.dart';
import 'package:flutter_realtime_detection/model/modelIlmu.dart';
import 'package:flutter_realtime_detection/widget/cardReferensi.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:cached_network_image/cached_network_image.dart';

TextStyle subtittle = new TextStyle(
  color: Colors.grey[700],
  fontWeight: FontWeight.w600,
  fontSize: 12,
);
TextStyle subtittlePutih = new TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 12,
);
TextStyle tittle = new TextStyle(
  color: Colors.grey[700],
  fontWeight: FontWeight.w800,
  fontSize: 14,
);
TextStyle desck = new TextStyle(
  color: Colors.grey[700],
  // fontWeight: FontWeight.w600,
  fontSize: 10,
);

class MyImagePicker extends StatefulWidget {
  final String kategori;

  const MyImagePicker({Key key,@required this.kategori}) : super(key: key);

  @override
  MyImagePickerState createState() => MyImagePickerState();
}

class MyImagePickerState extends State<MyImagePicker> {
  File imageURI;
  String result;
  String confidence1;
  String confidence2;
  String path;
  int index;
  String variabelTampung = '';

  final picker = ImagePicker();

  getImageFromCamera() async {
    final image = await picker.getImage(source: ImageSource.camera);

    setState(() {
      imageURI = File(image.path);
      path = image.path;
    });
  }

  getImageFromGallery() async {
    var image = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      imageURI = File(image.path);
      path = image.path;
    });
  }

  classifyImage() async {
    await Tflite.loadModel(
        model: "assets/mobilenet_v1_1.0_224.tflite",
        labels: "assets/mobilenet_v1_1.0_224.txt");
    var output = await Tflite.runModelOnImage(
        path: path,
        // required
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);

    output.map((re) {
      setState(() {
        print(re);
        result = re["label"];
        confidence1 = (re["confidence"] * 100).toStringAsFixed(0) + '%';
        confidence2 = re["confidence"].toString();
        index = re["index"];
      });
      print(result);
      print(confidence1);
      print(confidence2);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    variabelTampung = widget.kategori;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        title: Text('Deteksi Sampah ${widget.kategori}',
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
       
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    imageURI == null
                        ? Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: warnaPutih,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 12)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    height: 100,
                                    width: 60,
                                    child: Image.asset(
                                      'assets/pt.png',
                                      color: darkPrimaryColor,
                                    )),
                                Text(
                                  'Tidak ada foto',
                                  style: secondaryStyle,
                                )
                              ],
                            ),
                          )
                        : Stack(
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: warnaPutih,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 12)
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child:
                                      Image.file(imageURI, fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      imageURI = null;
                                      result = null;
                                      confidence1 = null;
                                      confidence2 = null;
                                      index = null;
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: warnaPutih),
                                    child: Icon(
                                      Icons.close,
                                      color: darkPrimaryColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    imageURI == null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () => getImageFromGallery(),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: warnaPutih),
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/picture.png',
                                        color: darkPrimaryColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Galeri',
                                    style: secondaryStyle,
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () => getImageFromCamera(),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: warnaPutih),
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/camera.png',
                                        color: darkPrimaryColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Kamera',
                                    style: secondaryStyle,
                                  )
                                ],
                              )
                            ],
                          )
                        : SizedBox(),
                    imageURI == null
                        ? SizedBox()
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 12)
                            ]),
                            child: RaisedButton(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              onPressed: () => classifyImage(),
                              child: Text(
                                'Deteksi Foto',
                                style: mainStyle,
                              ),
                              // textColor: darkPrimaryColor,
                              color: Colors.white,
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            )),
                    SizedBox(
                      height: 20,
                    ),
                    result == null
                        ? SizedBox()
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: warnaPutih,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 12)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Hasil : ' + result,
                                    style: TextStyle(
                                        color: result == variabelTampung ? primaryColor : Colors.grey[700],
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14)),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Confidence * 100 : ' + confidence1 ?? '',
                                  style: secondaryStyle,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Confidence : ' + confidence2 ?? '',
                                  style: secondaryStyle,
                                ),
                                Text(
                                  'index : ' + index.toString() ?? '',
                                  style: secondaryStyle,
                                )
                                // Text(result)
                              ],
                            ),
                          ),
                          SizedBox(
                      height: 12,
                    ),
                   result == null
                        ? SizedBox()
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: result == variabelTampung ? primaryColor : Colors.red[200],
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 12),
                            ]),
                            padding: EdgeInsets.all(14),
                            child: Text(
                             result == variabelTampung ?  'Sesuai' : 'Tidak Sesuai',
                              style: mainStyle,
                            )),
                    SizedBox(
                      height: 20,
                    ),
                    result == null
                        ? SizedBox()
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sampah ' + result,
                              style: subtittle,
                            )),
                    
                    SizedBox(
                      height: 12,
                    ),
                    result == null
                        ? SizedBox()
                        : index == 4
                            ? _bodyOrganik()
                            : index == 0 ? _bodySampahKaca() : Container(
                              child: Text('Belum ada referensi'),
                            ),
                    
                  ]),
            ),
          ),
        ));
  }

  _bodyOrganik() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2 / 3),
      itemCount: sampahOrganik.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int i) {
        ModelSampahOrganik m = sampahOrganik[i];
        return new CardReferensi(
          desc: m.desc,
          imgUrl: m.imgUrl,
          title: m.kategori,
          ontap:(){
             Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WebViewContainer(m.url, m.kategori)));
          },
        );
      },
    );
  }

  _bodySampahKaca() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 4 / 5),
      itemCount: sampahKaca.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int i) {
        ModelSampahKaca k = sampahKaca[i];
        return new CardReferensi(
          desc: k.desc,
          imgUrl: k.imgUrl,
          title: k.kategori,
          ontap:(){
             Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WebViewContainer(k.url, k.kategori)));
          },
        );
      },
    );
  }
}
