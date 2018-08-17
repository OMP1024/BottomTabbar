import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomTabBar extends StatefulWidget {
  @override
  _TabBarState createState() => new _TabBarState(
      this.normalIcons,
      this.selectedIcons,
      this.titles,
      this.pages,
      this.normalColor,
      this.selectedColor,
      this.fontSize);

  BottomTabBar(
      {Key key,
      this.normalIcons,
      this.selectedIcons,
      this.titles,
      this.pages,
      this.normalColor = Colors.grey,
      this.selectedColor = Colors.green,
      this.fontSize = 10.0})
      : assert(normalIcons != null),
        assert(selectedIcons != null),
        assert(titles != null),
        assert(pages != null),
        super(key: key);

  final List<Widget> normalIcons;
  final List<Widget> selectedIcons;
  final List<String> titles;
  final List<Widget> pages;
  final Color normalColor;
  final Color selectedColor;
  final double fontSize;
}

class _TabBarState extends State<BottomTabBar> {
  final List<Widget> normalIcons;
  final List<Widget> selectedIcons;
  final List<String> titles;
  final List<Widget> pages;
  final Color normalColor;
  final Color selectedColor;
  final double fontSize;

  int _tabIndex = 0;

  _TabBarState(this.normalIcons, this.selectedIcons, this.titles, this.pages,
      this.normalColor, this.selectedColor, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(titles[_tabIndex],
            style: new TextStyle(color: Colors.white)),
      ),
      body: new IndexedStack(
        children: pages,
        index: _tabIndex,
      ),
      bottomNavigationBar: new CupertinoTabBar(
        items: () {
          List<BottomNavigationBarItem> items = [];
          for (int i = 0; i < normalIcons.length; i++) {
            items.add(new BottomNavigationBarItem(
                icon: new Stack(
                      children: <Widget>[
                        i == _tabIndex ? selectedIcons[i] : normalIcons[i],
                        new Positioned(  // draw a red marble
                          top: 0.0,
                          right: 0.0,
                          child: new Icon(Icons.brightness_1, size: 8.0,
                              color: Colors.redAccent),
                        )
                      ]
                  ) ,
                title: new Text(titles[i],
                    style: new TextStyle(
                        fontSize: fontSize))));
          }
          return items;
        }(),
        activeColor: selectedColor,
        inactiveColor: normalColor,
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
