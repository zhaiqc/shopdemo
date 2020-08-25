import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rich_edit/rich_edit.dart';
import 'package:shop/utils/RichEdit/SimpleRichEditController.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  SimpleRichEditController controller = SimpleRichEditController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:build_appbar() ,
      body:RichEdit(controller) ,
    );
  }


  Widget build_appbar(){
    return new AppBar(
      backgroundColor: Colors.red,
      leading: new IconButton(

          icon: const Icon(Icons.chevron_left,),
          color: Colors.white,
          iconSize: 30.0,
          onPressed: (){Navigator.pop(context);}
      ),
      actions: <Widget>[
       new FlatButton(
            onPressed: () {

            },
            child: new Text(
               "发表",
              style:TextStyle(color: Colors.white)),
            )
      ],
      centerTitle: true,
      title: new Text("发表评论",maxLines: 1,overflow: TextOverflow.ellipsis,),

    );
  }
}
