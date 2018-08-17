import 'package:flutter/material.dart';
import 'NewsDetailPage.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Center(
          child: new RaisedButton(
              child: new Text('跳到详情页'),
              onPressed: () {
                Navigator
                    .of(context)
                    .push(MaterialPageRoute(builder: (buildContext) {
                  return new NewsDetailPage();
                }));
              })),
    );
  }
}
