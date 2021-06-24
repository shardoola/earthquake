import 'package:flutter/material.dart';

import 'quakes_app/quakes_app.dart';
import 'simple_google_map/show_map.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(new MaterialApp(

  //  home: QuakesApp(),
    home: Scaffold(
      body: WebView(
       initialUrl: "https://zoom.earth/",
        javascriptMode: JavascriptMode.unrestricted,
     ),
         ),
  )


  );
}

