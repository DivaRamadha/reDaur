import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_realtime_detection/style/style.dart';

import '../deteksiBiasa.dart';

class CardReferensi extends StatelessWidget {
  final Function ontap;
  final String imgUrl;
  final String title;
  final String desc;

  const CardReferensi({Key key, this.ontap, this.imgUrl, this.title, this.desc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
          child: InkWell(
            onTap: ontap(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: CachedNetworkImage(
                          imageUrl: imgUrl,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.4),
                                    BlendMode.darken),
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                            padding: EdgeInsets.all(50),
                            child: Center(
                              child: Image.asset('assets/logo.png'),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                            child: Center(
                                child: Icon(
                              Icons.error,
                              color: darkPrimaryColor,
                            )),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Text(
                          title,
                          style: subtittlePutih,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height / 12,
                  // color: warnaKuning,
                  child: Text(
                    desc,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: desck,
                  ),
                )
              ],
            ),
          ),
        );
  }
}