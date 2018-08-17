import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/DiscoveryPage.dart';
import 'pages/MyInfoPage.dart';
import 'pages/NewsListPage.dart';
import 'pages/TweetsListPage.dart';
import 'BottomTabBar.dart';


void main() {
  List<Widget> selectedIcons = [
    new Image.asset(
        'images/ic_nav_news_actived.png', width: 20.0, height: 20.0),
    new Image.asset(
        'images/ic_nav_tweet_actived.png', width: 20.0, height: 20.0),
    new Image.asset(
        'images/ic_nav_discover_actived.png', width: 20.0, height: 20.0),
    new Image.asset('images/ic_nav_my_pressed.png', width: 20.0, height: 20.0)
  ];
  List<Widget> normalIcons = [
    new Image.asset('images/ic_nav_news_normal.png', width: 20.0, height: 20.0),
    new Image.asset(
        'images/ic_nav_tweet_normal.png', width: 20.0, height: 20.0),
    new Image.asset(
        'images/ic_nav_discover_normal.png', width: 20.0, height: 20.0),
    new Image.asset('images/ic_nav_my_normal.png', width: 20.0, height: 20.0)
  ];

  List<Widget> pages = [
    new NewsListPage(),
    new TweetsListPage(),
    new DiscoveryPage(),
    new MyInfoPage()
  ];

  runApp(new MaterialApp(title: 'tabbar',
      theme: new ThemeData(primaryColor: Colors.green),
      home: new BottomTabBar(
        normalIcons: normalIcons,
        selectedIcons: selectedIcons,
        pages: pages,
        titles: ['资讯', '动态', '发现', '我的'],
        normalColor: Colors.grey,
        selectedColor: Colors.green,
        fontSize: 10.0,
      )));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _tabIndex = 0;
  var _tabImages;
  var _appBarTitles = ['资讯', '动态', '发现', '我的'];

  _initData() {
    if (_tabImages == null) {
      _tabImages = [
        [
          _getImage(path: 'images/ic_nav_news_actived.png'),
          _getImage(path: 'images/ic_nav_news_normal.png')
        ],
        [
          _getImage(path: 'images/ic_nav_tweet_actived.png'),
          _getImage(path: 'images/ic_nav_tweet_normal.png')
        ],
        [
          _getImage(path: 'images/ic_nav_discover_actived.png'),
          _getImage(path: 'images/ic_nav_discover_normal.png')
        ],
        [
          _getImage(path: 'images/ic_nav_my_pressed.png'),
          _getImage(path: 'images/ic_nav_my_normal.png'),
        ],
      ];
    }
  }

  Image _getImage({String path}) {
    return new Image.asset(
      path,
      width: 20.0,
      height: 20.0,
    );
  }

  TextStyle _getTabTextStyle(int curIndex) {
    return new TextStyle(
        color: curIndex == _tabIndex ? Colors.green : Colors.grey,
        fontSize: 10.0);
  }

  _getTabIcon(int index) {
    return index == _tabIndex ? _tabImages[index][0] : _tabImages[index][1];
  }

  _getTabTitle(int index) {
    return new Text(_appBarTitles[index], style: _getTabTextStyle(index));
  }

  @override
  Widget build(BuildContext context) {
    _initData();
    return new MaterialApp(
      title: 'My app',
      theme: new ThemeData(primaryColor: Colors.green),
      home: new Scaffold(
          appBar: new AppBar(
              title: new Text(_appBarTitles[_tabIndex],
                  style: new TextStyle(color: Colors.white)),
              iconTheme: new IconThemeData(color: Colors.white)),
          body: new IndexedStack(
            children: <Widget>[
              new NewsListPage(),
              new TweetsListPage(),
              new DiscoveryPage(),
              new MyInfoPage()
            ],
            index: _tabIndex,
          ),
          bottomNavigationBar: new CupertinoTabBar(
            items: () {
              List<BottomNavigationBarItem> list = [];
              for (int i = 0; i < 4; i++) {
                list.add(new BottomNavigationBarItem(
                    icon: _getTabIcon(i), title: _getTabTitle(i)));
              }
              return list;
            }(),
            currentIndex: _tabIndex,
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });
            },
          )),
    );
  }
}
