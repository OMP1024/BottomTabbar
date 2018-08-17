## BottomTabar 的使用

```
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
```
效果：

![Simulator Screen Shot - iPhone X - 2018-08-16 at 19.02.02.png](https://upload-images.jianshu.io/upload_images/854488-c452dd178197bf62.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
