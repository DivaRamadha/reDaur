import 'package:flutter/material.dart';
import 'package:flutter_realtime_detection/deteksiBiasa.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  final tittle;
  WebViewContainer(this.url, this.tittle);
  @override
  createState() => _WebViewContainerState(this.url, this.tittle);
}
class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  var tittle;
  final _key = UniqueKey();
  _WebViewContainerState(this._url, this.tittle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0,
         leading: IconButton(icon: Icon(Icons.arrow_back,
         color: Colors.grey[700],
         ), onPressed: null),
         title: Text(tittle,
         style: subtittle,
         ),
       ),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _url))
          ],
        ));
  }
}