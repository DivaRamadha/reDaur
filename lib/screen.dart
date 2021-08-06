import 'package:flutter/material.dart';
import 'package:flutter_realtime_detection/InfoPage/organik.dart';
import 'package:flutter_realtime_detection/deteksi.dart';
import 'package:flutter_realtime_detection/style/style.dart';
import 'package:flutter_realtime_detection/widget/cardItem.dart';
import 'package:flutter_realtime_detection/widget/infoCard.dart';

TextStyle mainStyle = new TextStyle(
    color: Colors.grey[700], fontWeight: FontWeight.w800, fontSize: 14);

TextStyle secondaryStyle = new TextStyle(
    color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600);

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: warnaPutih,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Selamat Datang',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          Text(
                            'di reDaur',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w800,
                                fontSize: 14),
                          ),
                          Container(
                              width: 160,
                              child: Text(
                                'yuk mari bersama hijaukan dan lestarikan kembali bumi kita',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              )),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          // height: MediaQuery.of(context).size.height / 6,
                          // width: 200,
                          child: Image.asset(
                            'assets/home.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Layanan Kami', style: mainStyle),
                ),
                Container(
                  height: 240,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListView.builder(
                        itemCount: itemScroll.length,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          ScrollWidgetItem s = itemScroll[i];
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 14.0, top: 8, bottom: 8),
                            child: InkWell(
                                onTap: () {
                                  if (i == 0) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetectObjectPage()));
                                  }
                                  print('object');
                                },
                                child: CardItem(
                                  s: s,
                                )),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Informasi', style: mainStyle),
                ),
                SizedBox(
                  height: 4,
                ),
                ListView.builder(
                    itemCount: informasiList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, i) {
                      Informasi info = informasiList[i];
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 14.0, top: 8, bottom: 8),
                        child: CardInfo(
                          imgUrl: info.imgUrl,
                          desc: info.desc,
                          index: i,
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScrollWidgetItem {
  final String imgUrl;
  final String name;
  final String desc;

  ScrollWidgetItem({this.imgUrl, this.name, this.desc});
}

final List<ScrollWidgetItem> itemScroll = [
  ScrollWidgetItem(
      imgUrl: 'assets/det.png',
      name: 'Deteksi Objek',
      desc: 'Deteksi berbagai macam sampah'),
  ScrollWidgetItem(
      imgUrl: 'assets/re.png',
      name: 'reDaur',
      desc: 'Manfaat daur ulang sampah'),
  ScrollWidgetItem(
      imgUrl: 'assets/shop.png',
      name: 'reDaur',
      desc: 'Manfaat daur ulang sampah'),
  // ScrollWidgetItem(
  //     imgUrl: 'assets/tangan.png',
  //     name: 'reBoisasi',
  //     desc: 'Acara sosial kami setiap bulannya'),
];

class Informasi {
  final String imgUrl;
  final String desc;

  Informasi({this.imgUrl, this.desc});
}

final List<Informasi> informasiList = [
  Informasi(
      imgUrl: 'assets/diet.png', desc: 'Konsumsi makanan sehat selama pandemi'),
  Informasi(
      imgUrl: 'assets/plastic.png',
      desc: 'Manfaat daur ulang sampah anorganik'),
  Informasi(imgUrl: 'assets/waste.png', desc: 'Manfaat sampah organik bagi lingkungan')
];
