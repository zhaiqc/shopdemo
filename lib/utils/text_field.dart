import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop/utils/Dimens.dart';

import 'AppConfig.dart';
import 'Colours.dart';

class MyTextField extends StatefulWidget{

  final TextEditingController controller;
  final TextStyle style;
  final int maxLength;
  final bool autoFocus;
  final TextInputType keyboardType;
  final String hintText;
  final TextStyle hintStyle;
  final FocusNode focusNode;
  final bool isInputPwd;
  final Function getVCode;
  final bool isBorder;
  final bool enabled;
  final TimerController timerController;

  const MyTextField(
      {Key key,
        @required this.controller,
        this.style,
        this.maxLength: 16,
        this.autoFocus: false,
        this.keyboardType: TextInputType.text,
        this.hintText: "",
        this.hintStyle,
        this.enabled,
        this.focusNode,
        this.isInputPwd: false,
        this.getVCode,
        this.isBorder: false,
        this.timerController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyTextFieldState();
  }

}


class _MyTextFieldState extends State<MyTextField>{
  bool _isShowPwd = false;
  bool _isShowDelete = true;
  bool _isClick = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //监听输入改变
    widget.controller.addListener(() {
      setState(() {
        _isShowDelete = widget.controller.text.isEmpty;
      });
    });
//    if (widget.config != null) {
//      // 因Android平台输入法兼容问题，所以只配置IOS平台
//      FormKeyboardActions.setKeyboardActions(context, widget.config);
//    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
//    _subscription?.cancel();
    if(widget.timerController!=null){
      widget.timerController.disposed();

    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        TextField(
          enabled: widget.enabled,
          focusNode: widget.focusNode,
          maxLength: widget.maxLength,
          obscureText: widget.isInputPwd ? !_isShowPwd : false,
          autofocus: widget.autoFocus,
          controller: widget.controller,
          textInputAction: TextInputAction.done,
          keyboardType: widget.keyboardType,
          // 数字、手机号限制格式为0到9(白名单)， 密码限制不包含汉字（黑名单）
          inputFormatters: (widget.keyboardType == TextInputType.number ||
              widget.keyboardType == TextInputType.phone)
              ? [WhitelistingTextInputFormatter(RegExp("[0-9]"))]
              : [BlacklistingTextInputFormatter(RegExp(""))],
          style: widget.style,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            counterText: "",
            focusedBorder: widget.isBorder
                ? UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppConfig.otherColor, width: 0.8),
            )
                : null,
            enabledBorder: widget.isBorder
                ? UnderlineInputBorder(
              borderSide: BorderSide(color: Colours.line, width: 0.8),
            )
                : null,
            border: InputBorder.none,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Offstage(
              offstage: _isShowDelete,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: new Icon(Icons.clear),
                onTap: () {
                  setState(() {
                    widget.controller.text = "";
                  });
                },
              ),
            ),
            Offstage(
              offstage: !widget.isInputPwd,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: new Icon(
                    _isShowPwd
                        ? Entypo.eye
                        : Entypo.eye_with_line,
                    size: 18.0,
                  ),
                  onTap: () {
                    setState(() {
                      _isShowPwd = !_isShowPwd;
                    });
                  },
                ),
              ),
            ),
            Offstage(
              offstage: widget.getVCode == null,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  height: AppConfig.logic_width(55.0),
                  width: AppConfig.logic_width(220.0),
                  child: FlatButton(
                    onPressed: widget.timerController != null
                        ? widget.timerController.isClick
                        ? () {
                      widget.timerController.setContext(this);
                      widget.getVCode();
                    }
                        : null
                        : null,
                    padding:
                    const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
                    textColor: AppConfig.otherColor,
                    color: Colors.transparent,
                    disabledTextColor: Colors.white,
                    disabledColor: Colours.gray_cc,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      side: BorderSide(
                        color: widget.timerController != null
                            ? widget.timerController.isClick
                            ? AppConfig.otherColor
                            : Colours.gray_cc
                            : Colours.gray_cc,
                        width: 0.8,
                      ),
                    ),
                    child: Text(
                      widget.timerController != null
                          ? widget.timerController.isClick
                          ? "获取验证码"
                          : "${widget.timerController.time}s后重新获取"
                          : "获取验证码",
                      style: TextStyle(fontSize: Dimens.font_sp12),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

}

class TimerController {
  int time;
  StreamSubscription _subscription;
  int second;

  State state;
  bool isClick = true;

  TimerController({this.time, this.second});

  setContext(state) {
    this.state = state;
  }

  startTimer() {
    state.setState(() {
      time = second;
      isClick = false;
    });
    _subscription = Stream.periodic(Duration(seconds: 1), (i) => i)
        .take(second)
        .listen((i) {
      state.setState(() {
        time = second - i - 1;
        isClick = time < 1;
      });
    });
//  _subscription = Stream.periodic(period)

  }

  disposed() {
    if(_subscription!=null){
      _subscription.cancel();

    }
  }
}