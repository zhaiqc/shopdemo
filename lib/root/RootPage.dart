import 'dart:convert';
import 'dart:io';

import 'package:file_picker_web/file_picker_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:shop/root/User.dart';
import 'package:shop/root/home/HomePage.dart';
import 'package:shop/root/my/MyPage.dart';
import 'package:shop/root/vip/VipPage.dart';
import 'package:shop/utils/AppConfig.dart';
import 'package:shop/utils/NavigationView.dart';
import 'package:shop/utils/provider/ViewModelProvider.dart';

import '../utils/AppConfig.dart';
import 'article/ArticlePage.dart';
import 'home/HomeViewModel.dart';
import 'login/model/login_entity.dart';

class RootPage extends StatefulWidget {
  int currentIndex;

  RootPage(this.currentIndex);
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>with TickerProviderStateMixin {
  List<NavigationView> _navigationViews =[];
  StatefulWidget _currentPage;
  List<StatefulWidget> _pageList;
  int currentIndex = 0;
  final  pages = [
    ViewModelProvider(viewModel: HomeViewModel(), child: HomePage(),),
//  HomePage(),
//  VipPage(),
  MyPage(),

  ];

  @override
  void initState() {

    SharedPreferences.getInstance().then((prefs) {
      String use =prefs.getString("user");
      if(use!=null){
        new User().entity=LoginEntity().fromJson(jsonDecode(use));
      }
      print(new User().entity.data.userinfo.username);

    });



    // TODO: implement initState
    super.initState();
  }
  void _rebuild() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 750, height: 1334);
    final BottomAppBar bottomAppBar = new BottomAppBar(
      shape: CircularNotchedRectangle(),

    );

    return      new MaterialApp(
        theme: AppConfig.defaultTheme,
        home: buildBottomTabScaffold());
  }

  Widget buildBottomTabScaffold() {
    return SizedBox(
        height: 100,
        child: Scaffold(
          //对应的页面
          body: pages[currentIndex],
          //appBar: AppBar(title: const Text('Bottom App Bar')),
          //悬浮按钮的位置
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          //悬浮按钮
          floatingActionButton: FloatingActionButton(
            hoverColor: Colors.red,
            backgroundColor: Colors.red,
            child: const Icon(Icons.add),
            onPressed: () {
              print("add press ");
//              _pickFiles();
//               FilePicker.getFile(
//                  allowedExtensions: ['mp4', 'png']);
              Navigator.push(context, new MaterialPageRoute(builder: (_) => new ArticlePage()));

//              AppConfig.toast(context, "功能暂未开放");
            },
          ),
          //其他菜单栏
          bottomNavigationBar: BottomAppBar(
            //悬浮按钮 与其他菜单栏的结合方式
            shape: CircularNotchedRectangle(),
            notchMargin: 6.0,
            color: Colors.red, //底部工具栏的颜色。
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildBottomItem(currentIndex, 0, Icons.home, "首页"),
                buildBottomItem(currentIndex, 1, Icons.person, "我的"),
              ],
            ),
          ),
        ));
  }
  buildBottomItem(int selectIndex, int index, IconData iconData, String title) {
    //未选中状态的样式
    TextStyle textStyle = TextStyle(fontSize: 12.0,color: Colors.white);
    MaterialColor iconColor = Colors.grey;
    double iconSize=20;
    EdgeInsetsGeometry padding =  EdgeInsets.only(top: 8.0);

    if(selectIndex==index){
      //选中状态的文字样式
      textStyle = TextStyle(fontSize: 13.0,color: Colors.white);
      //选中状态的按钮样式
      iconSize=25;
      padding =  EdgeInsets.only(top: 6.0);
    }
    Widget padItem = SizedBox();
    if (iconData != null) {
      padItem = Padding(
        padding: padding,
        child: Container(
          color: Colors.red, //底部工具栏的颜色。
            child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  iconData,
                  color: Colors.white,
                  size: iconSize,
                ),
                Text(
                  title,
                  style: textStyle,
                )
              ],
            ),
          ),
        ),
      );
    }
    Widget item = Expanded(
      flex: 1,
      child: new GestureDetector(
        onTap: () {
          if (index != currentIndex) {
            setState(() {
              currentIndex = index;
            });
          }
        },
        child: SizedBox(
          height: 52,
          child: padItem,
        ),
      ),
    );
    return item;
  }

  List<File> _files = [];

  void _pickFiles() async {
//    var _image = await FlutterWebImagePicker.getImage;
//    print(_image);

//    _files = await FilePicker.getMultiFile() ?? [];
//    setState(() {});
  }

}

