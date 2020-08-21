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
      body:RichEdit(controller) ,
    );
  }
}
