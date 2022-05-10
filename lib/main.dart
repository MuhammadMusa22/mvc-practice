import 'package:flutter/material.dart';
import 'views/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVC Practice ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}



// - uses: actions/upload-artifact@v1
// with:
// name: release-apk
// path: build/app/outputs/flutter-apk/app-release.apk
// upload:
// runs-on: ubuntu-latest
// name: Upload APK
// steps:
// - name: Upload to slack step
// - uses: adrey/slack-file-upload-action@master
// with:
// token: ${{ secrets.SLACK_TOKEN }}
// path: build/app/outputs/flutter-apk/app-release.apk
// channel: random

// steps:
// - name: Post to a Slack channel
// id: slack
// uses: slackapi/slack-github-action@v1.18.0
// with:
// channel-id: 'C032NCAKJPR'
// slack-message: "Does it Work"
// env:
// SLACK_BOT_TOKEN: ${{ secrets.SLACK_BOT_TOKEN }}